using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.DynamicData;
using System.Web.Mvc;
using Oven.Models;

namespace Oven.Controllers
{
    public class BatchLOTsController : Controller
    {
        private OvenContext db = new OvenContext();

        // GET: BatchLOTs
        public ActionResult Index()
        {
            return View(db.BatchLOTs.ToList());
        }
        public ActionResult GetLot(string lotNumber, string startDate, string endDate, string ovenID, int batchID)
        {

            DateTime sDate = startDate == string.Empty ? DateTime.Parse("1970-01-01") : DateTime.Parse(startDate);
            DateTime eDate = endDate == string.Empty ? DateTime.Now : DateTime.Parse(endDate);
            var batchLots = from h in db.BatchLOTs
                            join k in db.HeatingBatches on h.batchid equals k.BatchID
                where ((h.lotnumber.Contains(lotNumber)) && (lotNumber != string.Empty))
                where ((k.StartDate >= sDate) && (k.StartDate <= eDate))
                where ((k.OvenID == ovenID) || (ovenID == string.Empty))
                where ((k.BatchID == batchID) ||(batchID == 0))
                select new
                {                    
                    h,
                    k.OvenID
                };
            /*if (batchId > 0)
            {
                batchLots = batchLots.Where(h => h.batchid.Equals(batchId));
            };*/

            return Json(batchLots, JsonRequestBehavior.AllowGet);
        }
        // GET: BatchLOTs/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            BatchLOT batchLOT = db.BatchLOTs.Find(id);
            if (batchLOT == null)
            {
                return HttpNotFound();
            }
            return View(batchLOT);
        }

        // GET: BatchLOTs/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: BatchLOTs/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,batchid,device,package,lotnumber,qty,loaded_by,date")] BatchLOT batchLOT)
        {
            if (ModelState.IsValid)
            {
                db.BatchLOTs.Add(batchLOT);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(batchLOT);
        }

        // GET: BatchLOTs/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            BatchLOT batchLOT = db.BatchLOTs.Find(id);
            if (batchLOT == null)
            {
                return HttpNotFound();
            }
            return View(batchLOT);
        }

        // POST: BatchLOTs/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,batchid,device,package,lotnumber,qty,loaded_by,date")] BatchLOT batchLOT)
        {
            if (ModelState.IsValid)
            {
                db.Entry(batchLOT).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(batchLOT);
        }

        // GET: BatchLOTs/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            BatchLOT batchLOT = db.BatchLOTs.Find(id);
            if (batchLOT == null)
            {
                return HttpNotFound();
            }
            return View(batchLOT);
        }

        // POST: BatchLOTs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            BatchLOT batchLOT = db.BatchLOTs.Find(id);
            db.BatchLOTs.Remove(batchLOT);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}

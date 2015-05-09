using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Diagnostics;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Oven.Models;

namespace Oven.Controllers
{
    public class HeatingBatchesController : Controller
    {
        private OvenContext db = new OvenContext();

        // GET: HeatingBatches
        public ActionResult Index()
        {
            //var heatingBatches = db.HeatingBatches.Include(h => h.BatchPattern).Include(h => h.OvenDB).Take(1);
            return View();
        }
        public ActionResult Test()
        {
            var heatingBatches = db.HeatingBatches.Include(h => h.BatchPattern).Include(h => h.OvenDB).First();
            return View(heatingBatches);
        }
        public ActionResult GetHeatingBatches(string startDate, string endDate, string ovenID, int batchID)
        {
            DateTime sDate = startDate==string.Empty?DateTime.Now : DateTime.Parse(startDate);
            DateTime eDate = endDate == string.Empty ? DateTime.Now : DateTime.Parse(endDate);
            eDate = eDate.AddDays(1);
           
            var heatingBatches = from h in db.HeatingBatches
                                 .Where(h=> (h.StartDate >= sDate) && (h.StartDate<= eDate)
                                         && (h.OvenID == ovenID || ovenID == string.Empty)
                                         && (h.BatchID == batchID || batchID == 0))   
                                         where h.Status == "FIN"
                                 orderby h.BatchID descending 
                select new
                {
                    h.BatchID,
                    h.OvenID,
                    h.Status,
                    h.StartDate,
                    h.EndDate
                };
            return Json(heatingBatches, JsonRequestBehavior.AllowGet);
        }

        //GET BatchTemperature based on BatchID
        public ActionResult GetBatchTemperature(int batchID)
        {
            var batchs = from b in db.BatchTemperatures
                         where b.BatchID == batchID
                         orderby b.FetchTime
                         select new
                         {
                             b.FetchTime,
                             b.Temperature
                         };

            var batchs2 = batchs.ToArray();
            var j = new Dictionary<string, Array> {{"data", batchs2}};

            return Json(j, JsonRequestBehavior.AllowGet);
        }

        // GET: HeatingBatches/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            HeatingBatch heatingBatch = db.HeatingBatches.Find(id);
            if (heatingBatch == null)
            {
                return HttpNotFound();
            }
            return View(heatingBatch);
        }

        // GET: HeatingBatches/Create
        public ActionResult Create()
        {
            ViewBag.BatchID = new SelectList(db.BatchPatterns, "Batchid", "Batchid");
            ViewBag.OvenID = new SelectList(db.OvenDBs, "OvenID", "HeatingType");
            return View();
        }

        // POST: HeatingBatches/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "BatchID,OvenID,Status,StartDate,EndDate,HeatingType,SetPoint1,SetPoint2,Interval1,Interval2,Interval3,TotalHeatTime,Tolerance,dummyname,is_overrided,overrideid,is_dummy,manual")] HeatingBatch heatingBatch)
        {
            if (ModelState.IsValid)
            {
                db.HeatingBatches.Add(heatingBatch);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.BatchID = new SelectList(db.BatchPatterns, "Batchid", "Batchid", heatingBatch.BatchID);
            ViewBag.OvenID = new SelectList(db.OvenDBs, "OvenID", "HeatingType", heatingBatch.OvenID);
            return View(heatingBatch);
        }

        // GET: HeatingBatches/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            HeatingBatch heatingBatch = db.HeatingBatches.Find(id);
            if (heatingBatch == null)
            {
                return HttpNotFound();
            }
            ViewBag.BatchID = new SelectList(db.BatchPatterns, "Batchid", "Batchid", heatingBatch.BatchID);
            ViewBag.OvenID = new SelectList(db.OvenDBs, "OvenID", "HeatingType", heatingBatch.OvenID);
            return View(heatingBatch);
        }

        // POST: HeatingBatches/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "BatchID,OvenID,Status,StartDate,EndDate,HeatingType,SetPoint1,SetPoint2,Interval1,Interval2,Interval3,TotalHeatTime,Tolerance,dummyname,is_overrided,overrideid,is_dummy,manual")] HeatingBatch heatingBatch)
        {
            if (ModelState.IsValid)
            {
                db.Entry(heatingBatch).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.BatchID = new SelectList(db.BatchPatterns, "Batchid", "Batchid", heatingBatch.BatchID);
            ViewBag.OvenID = new SelectList(db.OvenDBs, "OvenID", "HeatingType", heatingBatch.OvenID);
            return View(heatingBatch);
        }

        // GET: HeatingBatches/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            HeatingBatch heatingBatch = db.HeatingBatches.Find(id);
            if (heatingBatch == null)
            {
                return HttpNotFound();
            }
            return View(heatingBatch);
        }

        // POST: HeatingBatches/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            HeatingBatch heatingBatch = db.HeatingBatches.Find(id);
            db.HeatingBatches.Remove(heatingBatch);
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

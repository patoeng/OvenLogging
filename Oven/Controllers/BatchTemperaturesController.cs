using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Oven.Models;

namespace Oven.Controllers
{
    public class BatchTemperaturesController : Controller
    {
        private OvenContext db = new OvenContext();

        // GET: BatchTemperatures
        public ActionResult Index()
        {
            return View(db.BatchTemperatures.ToList());
        }
        public ActionResult GetBTCount(int batchID)
        {
            var bT = (from a in db.BatchTemperatures where a.BatchID == batchID select a).Count();
            return Json(bT, JsonRequestBehavior.AllowGet);
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
            var j = new Dictionary<string, Array>();
            j.Add("data", batchs2);

            return Json(j, JsonRequestBehavior.AllowGet);
        }


        // GET: BatchTemperatures/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            BatchTemperature batchTemperature = db.BatchTemperatures.Find(id);
            if (batchTemperature == null)
            {
                return HttpNotFound();
            }
            return View(batchTemperature);
        }

        // GET: BatchTemperatures/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: BatchTemperatures/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "BatchID,FetchTime,Temperature,UOM")] BatchTemperature batchTemperature)
        {
            if (ModelState.IsValid)
            {
                db.BatchTemperatures.Add(batchTemperature);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(batchTemperature);
        }

        // GET: BatchTemperatures/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            BatchTemperature batchTemperature = db.BatchTemperatures.Find(id);
            if (batchTemperature == null)
            {
                return HttpNotFound();
            }
            return View(batchTemperature);
        }

        // POST: BatchTemperatures/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "BatchID,FetchTime,Temperature,UOM")] BatchTemperature batchTemperature)
        {
            if (ModelState.IsValid)
            {
                db.Entry(batchTemperature).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(batchTemperature);
        }

        // GET: BatchTemperatures/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            BatchTemperature batchTemperature = db.BatchTemperatures.Find(id);
            if (batchTemperature == null)
            {
                return HttpNotFound();
            }
            return View(batchTemperature);
        }

        // POST: BatchTemperatures/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            BatchTemperature batchTemperature = db.BatchTemperatures.Find(id);
            db.BatchTemperatures.Remove(batchTemperature);
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

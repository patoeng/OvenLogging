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
    public class DashboardController : Controller
    {
        private OvenContext db = new OvenContext();

        // GET: OvenDBs
        public ActionResult Index()
        {
            var ovenDBs = db.OvenDBs.Include(o => o.OvenGraphSetting);
            return View(ovenDBs.ToList());
        }
        public ActionResult Big()
        {
            var ovenDBs = db.OvenDBs.Include(o => o.OvenGraphSetting);
            return View(ovenDBs.ToList());
        }
        public ActionResult GetDaftarOven()
        {
            var daftarOven = from d in db.OvenDBs
                             orderby d.OvenID ascending
                             select d.OvenID;

            return Json(daftarOven, JsonRequestBehavior.AllowGet);
        }

         // ================================================================================================ GetHeatingBatchs Start
        public ActionResult GetHeatingBatch(String ovenid)
        {
            var heatingBatch = (from b in db.HeatingBatches
                                where b.OvenID == ovenid
                                orderby b.BatchID descending
                                select new
                                {
                                    b.BatchID,
                                    b.Status,
                                    b.StartDate,
                                    b.EndDate
                                }).First();

            return Json(heatingBatch, JsonRequestBehavior.AllowGet);
        }
        // ================================================================================================ GetHeatingBatchs END
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

        // GET: OvenDBs/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            OvenDB ovenDB = db.OvenDBs.Find(id);
            if (ovenDB == null)
            {
                return HttpNotFound();
            }
            return View(ovenDB);
        }

        // GET: OvenDBs/Create
        public ActionResult Create()
        {
            ViewBag.OvenID = new SelectList(db.OvenGraphSettings, "OvenID", "upper_limit_color");
            ViewBag.OvenID = new SelectList(db.OvenPatterns, "OvenID", "OvenID");
            return View();
        }

        // POST: OvenDBs/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "OvenID,HeatingType,SetPoint1,SetPoint2,interval1,interval2,interval3,totalHeatTime,tolerance,ProbeIPAddr,ProbeUDPPort,AlarmIPAddr,AlarmUDPPort,IsRunning,lastalarm,created_at,updated_at,status,barcode,id,alarm_main,dateone,blinkalarm,alarmautofixed,alarmFetchStart,currentBatchStep")] OvenDB ovenDB)
        {
            if (ModelState.IsValid)
            {
                db.OvenDBs.Add(ovenDB);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.OvenID = new SelectList(db.OvenGraphSettings, "OvenID", "upper_limit_color", ovenDB.OvenID);
            ViewBag.OvenID = new SelectList(db.OvenPatterns, "OvenID", "OvenID", ovenDB.OvenID);
            return View(ovenDB);
        }

        // GET: OvenDBs/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            OvenDB ovenDB = db.OvenDBs.Find(id);
            if (ovenDB == null)
            {
                return HttpNotFound();
            }
            ViewBag.OvenID = new SelectList(db.OvenGraphSettings, "OvenID", "upper_limit_color", ovenDB.OvenID);
            ViewBag.OvenID = new SelectList(db.OvenPatterns, "OvenID", "OvenID", ovenDB.OvenID);
            return View(ovenDB);
        }

        // POST: OvenDBs/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "OvenID,HeatingType,SetPoint1,SetPoint2,interval1,interval2,interval3,totalHeatTime,tolerance,ProbeIPAddr,ProbeUDPPort,AlarmIPAddr,AlarmUDPPort,IsRunning,lastalarm,created_at,updated_at,status,barcode,id,alarm_main,dateone,blinkalarm,alarmautofixed,alarmFetchStart,currentBatchStep")] OvenDB ovenDB)
        {
            if (ModelState.IsValid)
            {
                db.Entry(ovenDB).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.OvenID = new SelectList(db.OvenGraphSettings, "OvenID", "upper_limit_color", ovenDB.OvenID);
            ViewBag.OvenID = new SelectList(db.OvenPatterns, "OvenID", "OvenID", ovenDB.OvenID);
            return View(ovenDB);
        }

        // GET: OvenDBs/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            OvenDB ovenDB = db.OvenDBs.Find(id);
            if (ovenDB == null)
            {
                return HttpNotFound();
            }
            return View(ovenDB);
        }

        // POST: OvenDBs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            OvenDB ovenDB = db.OvenDBs.Find(id);
            db.OvenDBs.Remove(ovenDB);
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

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
    public class GraphSettingsController : Controller
    {
        private OvenContext db = new OvenContext();

        // GET: OvenGraphSettings
        public ActionResult Index()
        {
            var ovenGraphSettings = db.OvenGraphSettings.Include(o => o.OvenDB);
            return View(ovenGraphSettings.ToList());
        }

        // GET: OvenGraphSettings/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            OvenGraphSetting ovenGraphSetting = db.OvenGraphSettings.Find(id);
            if (ovenGraphSetting == null)
            {
                return HttpNotFound();
            }
            return View(ovenGraphSetting);
        }

        // GET: OvenGraphSettings/Create
        public ActionResult Create()
        {
            ViewBag.OvenID = new SelectList(db.OvenDBs, "OvenID", "HeatingType");
            return View();
        }

        // POST: OvenGraphSettings/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "OvenID,max_x,max_y,ticksize,limit,limit_tolerance,upper_limit_color,lower_limit_color,target_color,background_color,graph_color,alias")] OvenGraphSetting ovenGraphSetting)
        {
            if (ModelState.IsValid)
            {
                db.OvenGraphSettings.Add(ovenGraphSetting);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.OvenID = new SelectList(db.OvenDBs, "OvenID", "HeatingType", ovenGraphSetting.OvenID);
            return View(ovenGraphSetting);
        }

        // GET: OvenGraphSettings/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            OvenGraphSetting ovenGraphSetting = db.OvenGraphSettings.Find(id);
            if (ovenGraphSetting == null)
            {
                return HttpNotFound();
            }
            ViewBag.OvenID = new SelectList(db.OvenDBs, "OvenID", "HeatingType", ovenGraphSetting.OvenID);
            return View(ovenGraphSetting);
        }

        // POST: OvenGraphSettings/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "OvenID,max_x,max_y,ticksize,limit,limit_tolerance,upper_limit_color,lower_limit_color,target_color,background_color,graph_color,alias")] OvenGraphSetting ovenGraphSetting)
        {
            if (ModelState.IsValid)
            {
                db.Entry(ovenGraphSetting).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.OvenID = new SelectList(db.OvenDBs, "OvenID", "HeatingType", ovenGraphSetting.OvenID);
            return View(ovenGraphSetting);
        }

        // GET: OvenGraphSettings/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            OvenGraphSetting ovenGraphSetting = db.OvenGraphSettings.Find(id);
            if (ovenGraphSetting == null)
            {
                return HttpNotFound();
            }
            return View(ovenGraphSetting);
        }

        // POST: OvenGraphSettings/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            OvenGraphSetting ovenGraphSetting = db.OvenGraphSettings.Find(id);
            db.OvenGraphSettings.Remove(ovenGraphSetting);
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

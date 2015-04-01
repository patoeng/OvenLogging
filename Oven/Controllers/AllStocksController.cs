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
    public class AllStocksController : Controller
    {
        private OvenContext db = new OvenContext();

        // GET: AllStocks
        public ActionResult Index()
        {
            var allstoks = (from a in db.AllStocks
                            select a).First();
            //return View(db.AllStocks.ToList());
            return Json(allstoks, JsonRequestBehavior.AllowGet);
        }

        // GET: AllStocks/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            AllStock allStock = db.AllStocks.Find(id);
            if (allStock == null)
            {
                return HttpNotFound();
            }
            return View(allStock);
        }

        // GET: AllStocks/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: AllStocks/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,process_class,product_type,operation,qty,equipment,facility,date")] AllStock allStock)
        {
            if (ModelState.IsValid)
            {
                db.AllStocks.Add(allStock);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(allStock);
        }

        // GET: AllStocks/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            AllStock allStock = db.AllStocks.Find(id);
            if (allStock == null)
            {
                return HttpNotFound();
            }
            return View(allStock);
        }

        // POST: AllStocks/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,process_class,product_type,operation,qty,equipment,facility,date")] AllStock allStock)
        {
            if (ModelState.IsValid)
            {
                db.Entry(allStock).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(allStock);
        }

        // GET: AllStocks/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            AllStock allStock = db.AllStocks.Find(id);
            if (allStock == null)
            {
                return HttpNotFound();
            }
            return View(allStock);
        }

        // POST: AllStocks/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            AllStock allStock = db.AllStocks.Find(id);
            db.AllStocks.Remove(allStock);
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

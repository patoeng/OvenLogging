using System.Web;
using System.Web.Optimization;

namespace Oven
{
    public class BundleConfig
    {
        // For more information on bundling, visit http://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                        "~/Scripts/jquery-{version}.min.js",
                        //"~/Scripts/jquery.datetimepicker.min.js",
                        "~/Scripts/jquery.validate.js"));

            bundles.Add(new ScriptBundle("~/bundles/jqueryui").Include(
                        "~/Scripts/jquery-ui-1.10.4.min.js",
                        //"~/Scripts/jquery-ui-1.11.1.min.js",
                        "~/Scripts/jquery.dataTables.min.js",
                        "~/Scripts/dataTables.bootstrap.js",
                        "~/Scripts/jquery.datetimepicker.min.js"));

            bundles.Add(new ScriptBundle("~/bundles/jqplot").Include(
                        "~/Scripts/jqplot/excanvas.min.js",
                        "~/Scripts/jqplot/jquery.jqplot.min.js",
                        "~/Scripts/jqplot/plugins/jqplot.cursor.min.js",
                        "~/Scripts/jqplot/plugins/jqplot.highlighter.min.js",
                        "~/Scripts/jqplot/plugins/jqplot.canvasAxisLabelRenderer.min.js",
                        "~/Scripts/jqplot/plugins/jqplot.canvasTextRenderer.min.js",
                        "~/Scripts/jqplot/plugins/jqplot.pointLabels.min.js",
                        "~/Scripts/jqplot/plugins/jqplot.canvasGridRenderer.js"));

            /*bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
                        "~/Scripts/jquery.validate*"));*/

            // Use the development version of Modernizr to develop with and learn from. Then, when you're
            // ready for production, use the build tool at http://modernizr.com to pick only the tests you need.
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                        "~/Scripts/modernizr-*"));

            bundles.Add(new ScriptBundle("~/bundles/bootstrap").Include(
                      "~/Scripts/bootstrap.min.js",
                      "~/Scripts/respond.min.js"));

            bundles.Add(new StyleBundle("~/Content/css").Include(
                      "~/Content/themes/base/jquery.ui.base.css",
                      "~/Content/themes/jquery-ui.theme.min.css",
                      "~/Content/themes/base/minified/jquery-ui.min.css",
                      "~/Content/themes/base/minified/jquery.ui.datetimepicker.min.css",
                      "~/Content/jquery.jqplot.css",
                      "~/Content/bootstrap.min.css",
                      "~/Content/jquery.dataTables.min.css",
                      "~/Content/jquery.dataTables_themeroller.css",
                      "~/Content/site.css"));

            // Set EnableOptimizations to false for debugging. For more information,
            // visit http://go.microsoft.com/fwlink/?LinkId=301862
            BundleTable.EnableOptimizations = true;
        }
    }
}

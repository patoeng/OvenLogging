using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Oven.Startup))]
namespace Oven
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}

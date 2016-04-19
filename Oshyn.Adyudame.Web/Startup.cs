using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Oshyn.Adyudame.Web.Startup))]
namespace Oshyn.Adyudame.Web
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}

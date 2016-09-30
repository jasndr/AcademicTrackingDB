using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(AcademicWeb.Startup))]
namespace AcademicWeb
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}

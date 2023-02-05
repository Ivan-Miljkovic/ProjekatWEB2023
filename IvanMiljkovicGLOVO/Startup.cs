using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(IvanMiljkovicGLOVO.Startup))]
namespace IvanMiljkovicGLOVO
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}

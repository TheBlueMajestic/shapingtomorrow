using System.Web.Mvc;
using System.Web.Security;
using CustomFilters;
using Umbraco.Core.Models;
using Umbraco.Web;
using Umbraco.Web.Models;
using Umbraco.Web.Mvc;

public class LoginController : RenderMvcController
{
    [AllowAllFilter]
    public ActionResult Index(RenderModel model)
    {
        return CurrentTemplate(model);
    }

    [AllowAllFilter]
    [HttpPost]
    public ActionResult Login(string password)
    {
        string loginError = "Something went wrong. Please try again";
        if (UmbracoContext.Current != null)
        {
            UmbracoHelper helper = new UmbracoHelper(UmbracoContext.Current);
            if (helper != null)
            {
                IPublishedContent container = helper.TypedContent(1873);
                if (container != null)
                {
                    string globalPassword = container.GetProperty("globalPassword").Value.ToString();
                    if (globalPassword.Equals(password))
                    {
                        FormsAuthentication.SetAuthCookie("globalUser", true);
                        return Json(new { isAuthenticated = true, url = "/" }, JsonRequestBehavior.AllowGet);
                        
                    }
                    else {
                        loginError = container.GetProperty("loginError").Value.ToString();
                        return Json(new { isAuthenticated = false, errorMessage = loginError }, JsonRequestBehavior.AllowGet);
                    }
                }
            }
        }
        return Json(new { isAuthenticated = true, errorMessage = loginError }, JsonRequestBehavior.AllowGet);
    }
}
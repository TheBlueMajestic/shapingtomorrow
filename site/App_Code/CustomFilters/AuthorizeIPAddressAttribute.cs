using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace CustomFilters
{
    public class AuthorizeIPAddressAttribute : ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext context)
        {
            if (!HttpContext.Current.User.Identity.IsAuthenticated && context.ActionDescriptor.ControllerDescriptor.ControllerName != "ScheduledPublish")//'ScheduledPublish' fix for Umbraco 7.1.8
            {
                if (!context.ActionDescriptor.GetCustomAttributes(typeof(AllowAllFilterAttribute), false).Any())
                {
                    IPWhiteList whiteList = new IPWhiteList();
                    //string ipAddress = HttpContext.Current.Request.UserHostAddress;
					string ipAddress = HttpContext.Current.Request["HTTP_CF_CONNECTING_IP"];
                    //string szXForwardedFor = HttpContext.Current.Request.ServerVariables["X_FORWARDED_FOR"];
                    if (!whiteList.Contains(ipAddress))
                        context.Result = new RedirectResult("/Login");
                }
            }
            base.OnActionExecuting(context);

        }

    }

    public class AllowAllFilterAttribute : ActionFilterAttribute
    {
    }
}

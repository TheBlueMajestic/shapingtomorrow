using System;
using System.Web.Mvc;
using CustomFilters;

public class Global : Umbraco.Web.UmbracoApplication
{
    protected override void OnApplicationStarted(object sender, EventArgs e)
    {
        base.OnApplicationStarted(sender,e);
        RegisterGlobalFilters(GlobalFilters.Filters);
    }

    public static void RegisterGlobalFilters(GlobalFilterCollection filters)
    {
        filters.Add(new AuthorizeIPAddressAttribute());
    }
}
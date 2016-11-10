using System.Collections.Generic;
using System.Net;
using System.Net.Sockets;
using Umbraco.Core.Models;
using Umbraco.Web;


public class IPAddressRange
{
    readonly AddressFamily addressFamily;
    readonly byte[] lowerBytes;
    readonly byte[] upperBytes;

    public IPAddressRange(IPAddress lower, IPAddress upper)
    {
        byte[] inputLowerBytes = lower.GetAddressBytes();
        byte[] inputUpperBytes = upper.GetAddressBytes();
        bool isCorrect = true;
        for (int i = 0; i < inputLowerBytes.Length; i++)
        {
            if (inputLowerBytes[i] > inputUpperBytes[i])
            {
                isCorrect = false;
                break;
            }
        }
        this.addressFamily = lower.AddressFamily;
        if (isCorrect)
        {
            this.lowerBytes = inputLowerBytes;
            this.upperBytes = inputUpperBytes;
        }
        else
        {
            this.lowerBytes = inputUpperBytes;
            this.upperBytes = inputLowerBytes;
        }
    }

    public bool IsInRange(IPAddress address)
    {
        if (address.AddressFamily != addressFamily)
        {
            return false;
        }

        byte[] addressBytes = address.GetAddressBytes();

        bool lowerBoundary = true, upperBoundary = true;

        for (int i = 0; i < this.lowerBytes.Length &&
            (lowerBoundary || upperBoundary); i++)
        {
            if ((lowerBoundary && addressBytes[i] < lowerBytes[i]) ||
                (upperBoundary && addressBytes[i] > upperBytes[i]))
            {
                return false;
            }

            lowerBoundary &= (addressBytes[i] == lowerBytes[i]);
            upperBoundary &= (addressBytes[i] == upperBytes[i]);
        }

        return true;
    }
}




public class IPWhiteList
{
    List<IPAddressRange> ipAddressRangeList;
    public IPWhiteList()
    {
        ipAddressRangeList = new List<IPAddressRange>();
        if (UmbracoContext.Current != null)
        {
            UmbracoHelper helper = new UmbracoHelper(UmbracoContext.Current);
            if (helper != null)
            {
                IPublishedContent container = helper.TypedContent(1873);
                if (container != null)
                {
                    var ids = container.GetProperty("ipRangeList").Value.ToString().Split(',');
                    foreach (var id in ids)
                    {
                        IPublishedContent ipRangeItem = helper.TypedContent(id);
                        if (ipRangeItem != null)
                        {
                            IPAddress lower;
                            IPAddress upper;
                            IPAddress.TryParse(ipRangeItem.GetProperty("ipMin").Value.ToString(), out lower);
                            IPAddress.TryParse(ipRangeItem.GetProperty("ipMax").Value.ToString(), out upper);
                            if (lower != null && upper != null)
                                ipAddressRangeList.Add(new IPAddressRange(lower, upper));

                        }
                    }
                }

            }
        }
    }

    public bool Contains(string ipAddressString)
    {
        IPAddress ipAddress;
        if (IPAddress.TryParse(ipAddressString, out ipAddress))
        {
            foreach (var item in ipAddressRangeList)
            {
                if (item.IsInRange(ipAddress))
                    return true;
            }
        }
        return false;
    }

}
#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\IAsyncOperationWithProgress.ahk
#Include ..\HttpResponseMessage.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * An interface used to implement custom filters for an [HttpClient](../windows.web.http/httpclient.md) instance.
 * @remarks
 * The IHttpFilter interface is used to develop custom filters for an [HttpClient](../windows.web.http/httpclient.md) instance. Custom filters are implemented in the [SendRequestAsync](ihttpfilter_sendrequestasync_602331974.md) method on their IHttpFilter interface.
 * 
 * Classes in the [Windows.Web.Http](../windows.web.http/windows_web_http.md) namespace support the use of filters based on the classes in the [Windows.Web.Http.Filters](windows_web_http_filters.md) namespace. The [HttpClient](../windows.web.http/httpclient.md) class in the [Windows.Web.Http](../windows.web.http/windows_web_http.md) namespace provides a base class for sending HTTP requests and receiving HTTP responses. Filters provide a handler mechanism to help with common HTTP service issues. Simple filters can be chained together in a sequence to handle more complex HTTP service issues.
 * 
 * An HTTP filter is a black box which takes an HTTP request message and produces an HTTP response message. How the filter gets an HTTP response is determined by the filter developer. An app can create the response immediately, it can send the request over TCP to a server, it can even send multiple requests to a server (or to more than one server) before it generates a response message. Since it is unspecified how a filter gets to a response message, a filter can pass the request message to another filter (called the inner filter), thus delegating the creation of a response message to the inner filter.
 * 
 * Filters commonly add or change headers, handle authorization (possibly using the [WebAuthenticationBroker](../windows.security.authentication.web/webauthenticationbroker.md)), or allow or disallow a request based on network conditions. Filters usually make changes and then pass the request to an inner filter, which is typically set when a filter is constructed.
 * 
 * This approach allows filters to be only responsible for a specific aspect of an HTTP request execution and delegate other aspects to other filters. A filter can implement caching, authentication, redirects, cookies, actual communication with the server, or a combination of these. The bottom-most (base) filter will usually be the one that does actual communication with the network.
 * 
 * Developers can write their own filters for site-specific issues. An example is that some site uses the 503 (Service Unavailable) response to indicate that the request should be retried. A custom filter could be implemented to detect this behavior and respond accordingly. Another example could deal with methods in the [Windows.Web.Http](../windows.web.http/windows_web_http.md) and [Windows.Web.Http.Filters](windows_web_http_filters.md) namespaces that send data over the network throw exceptions due to network failures (network connectivity is lost in airplane mode, for example). A custom filter could change catch network exception and convert them to an HTTP status code.
 * @see https://learn.microsoft.com/uwp/api/windows.web.http.filters.ihttpfilter
 * @namespace Windows.Web.Http.Filters
 * @version WindowsRuntime 1.4
 */
class IHttpFilter extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHttpFilter
     * @type {Guid}
     */
    static IID => Guid("{a4cb6dd5-0902-439e-bfd7-e12552b165ce}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SendRequestAsync"]

    /**
     * Send an HTTP request on the [IHttpFilter](ihttpfilter.md) instance as an asynchronous operation.
     * @remarks
     * Custom filters are implemented in the SendRequestAsync method on their [IHttpFilter](ihttpfilter.md) interface.
     * 
     * Classes in the [Windows.Web.Http](../windows.web.http/windows_web_http.md) namespace support the use of filters based on the classes in the [Windows.Web.Http.Filters](windows_web_http_filters.md) namespace. The [HttpClient](../windows.web.http/httpclient.md) class in the [Windows.Web.Http](../windows.web.http/windows_web_http.md) namespace provides a base class for sending HTTP requests and receiving HTTP responses. Filters provide a handler mechanism to help with common HTTP service issues. Simple filters can be chained together in a sequence to handle more complex HTTP service issues.
     * 
     * An HTTP filter is a black box which takes an HTTP request message and produces an HTTP response message. How the filter gets an HTTP response is determined by the filter developer. An app can create the response immediately, it can send the request over TCP to a server, it can even send multiple requests to a server (or to more than one server) before it generates a response message. Since it is unspecified how a filter gets to a response message, a filter can pass the request message to another filter (called the inner filter), thus delegating the creation of a response message to the inner filter.
     * 
     * Filters commonly add or change headers, handle authorization (possibly using the [WebAuthenticationBroker](../windows.security.authentication.web/webauthenticationbroker.md)), or allow or disallow a request based on network conditions. Filters usually make changes and then pass the request to an inner filter, which is typically set when a filter is constructed.
     * 
     * This approach allows filters to be only responsible for a specific aspect of an HTTP request execution and delegate other aspects to other filters. A filter can implement caching, authentication, redirects, cookies, actual communication with the server, or a combination of these. The bottom-most (base) filter will usually be the one that does actual communication with the network.
     * 
     * Below are some exceptions that this function throws.
     * @param {HttpRequestMessage} request The HTTP request message to send.
     * @returns {IAsyncOperationWithProgress<HttpResponseMessage, HttpProgress>} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.filters.ihttpfilter.sendrequestasync
     */
    SendRequestAsync(request) {
        result := ComCall(6, this, "ptr", request, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress(HttpResponseMessage, (ptr) => IPropertyValue(ptr).GetHttpProgress(), operation)
    }
}

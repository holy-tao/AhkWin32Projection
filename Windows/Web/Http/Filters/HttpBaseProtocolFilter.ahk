#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHttpBaseProtocolFilter.ahk
#Include .\IHttpBaseProtocolFilter2.ahk
#Include .\IHttpBaseProtocolFilter3.ahk
#Include .\IHttpBaseProtocolFilter4.ahk
#Include .\IHttpBaseProtocolFilter5.ahk
#Include .\IHttpFilter.ahk
#Include ..\..\..\Foundation\IClosable.ahk
#Include .\IHttpBaseProtocolFilterStatics.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\HttpBaseProtocolFilter.ahk
#Include .\HttpServerCustomValidationRequestedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * The base protocol filter for an [HttpClient](../windows.web.http/httpclient.md) instance.
 * @remarks
 * The HttpBaseProtocolFilter class provides the base filter or handler that is used by an [HttpClient](../windows.web.http/httpclient.md) instance. If no additional filters are added to the [HttpClient](../windows.web.http/httpclient.md) instance, then the HttpBaseProtocolFilter object will be the only filter.
 * 
 * The HttpBaseProtocolFilter class provides a set of properties for toggling various low-level HTTP stack behaviors.
 * 
 * Additional filters based on the [IHttpFilter](ihttpfilter.md) interface can be added to the filter chain applied to an [HttpClient](../windows.web.http/httpclient.md) instance that can further handle or process the results from the HttpBaseProtocolFilter object.
 * 
 * The HttpBaseProtocolFilter object throws exceptions when sending HTTP requests or receiving response and network failures occur (loss of connectivity in airplane mode, for example). Developers using [HttpClient](../windows.web.http/httpclient.md) in apps may prefer to add a filter to catch these exceptions and convert them to HTTP response codes instead.
 * @see https://learn.microsoft.com/uwp/api/windows.web.http.filters.httpbaseprotocolfilter
 * @namespace Windows.Web.Http.Filters
 * @version WindowsRuntime 1.4
 */
class HttpBaseProtocolFilter extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHttpBaseProtocolFilter

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHttpBaseProtocolFilter.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a new [HttpBaseProtocolFilter](httpbaseprotocolfilter.md) for a specific [User](./windows.system/user.md).
     * @param {User} user_ The [User](./windows.system/user.md) for which you want to create the [HttpBaseProtocolFilter](httpbaseprotocolfilter.md).
     * @returns {HttpBaseProtocolFilter} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.filters.httpbaseprotocolfilter.createforuser
     */
    static CreateForUser(user_) {
        if (!HttpBaseProtocolFilter.HasProp("__IHttpBaseProtocolFilterStatics")) {
            activatableClassId := HSTRING.Create("Windows.Web.Http.Filters.HttpBaseProtocolFilter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHttpBaseProtocolFilterStatics.IID)
            HttpBaseProtocolFilter.__IHttpBaseProtocolFilterStatics := IHttpBaseProtocolFilterStatics(factoryPtr)
        }

        return HttpBaseProtocolFilter.__IHttpBaseProtocolFilterStatics.CreateForUser(user_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Get or set a value that indicates whether the [HttpBaseProtocolFilter](httpbaseprotocolfilter.md) should follow redirection responses.
     * @remarks
     * Set AllowAutoRedirect to **true** if you want the [HttpBaseProtocolFilter](httpbaseprotocolfilter.md) to automatically follow HTTP redirection headers to the new location of the resource. The maximum number of redirections to follow is set internally by the system.
     * 
     * If AllowAutoRedirect is set to **false**, all HTTP responses with an HTTP status code from 300 to 399 are returned to whatever called the [HttpBaseProtocolFilter](httpbaseprotocolfilter.md), which might another filter that might then return them to the app.
     * 
     * The **Authorization** header is cleared on auto-redirects and the [HttpBaseProtocolFilter](httpbaseprotocolfilter.md) automatically tries to re-authenticate to the redirected location. In practice, this means that an app can't put custom authentication information into the **Authorization** header if it is possible to encounter redirection. Instead, the app must implement a custom authentication module using a filter.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.filters.httpbaseprotocolfilter.allowautoredirect
     * @type {Boolean} 
     */
    AllowAutoRedirect {
        get => this.get_AllowAutoRedirect()
        set => this.put_AllowAutoRedirect(value)
    }

    /**
     * Get or set a value that indicates whether the [HttpBaseProtocolFilter](httpbaseprotocolfilter.md) can prompt for user credentials when requested by the server.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.filters.httpbaseprotocolfilter.allowui
     * @type {Boolean} 
     */
    AllowUI {
        get => this.get_AllowUI()
        set => this.put_AllowUI(value)
    }

    /**
     * Gets or sets a value that indicates whether the [HttpBaseProtocolFilter](httpbaseprotocolfilter.md) can automatically decompress the HTTP content response.
     * @remarks
     * When this property is set to **true**, the **Accept-Encoding** header is added to the headers and set to allow gzip and compress.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.filters.httpbaseprotocolfilter.automaticdecompression
     * @type {Boolean} 
     */
    AutomaticDecompression {
        get => this.get_AutomaticDecompression()
        set => this.put_AutomaticDecompression(value)
    }

    /**
     * Get or set the read and write cache control behavior to be used on the [HttpBaseProtocolFilter](httpbaseprotocolfilter.md) object.
     * @remarks
     * The CacheControl property gets an [HttpCacheControl](httpcachecontrol.md) object that allows access to the read and write cache control behavior used by the [HttpBaseProtocolFilter](httpbaseprotocolfilter.md) object. HTTP read requests can use the local HTTP cache for the responses. Content returned by HTTP requests can be written to the local HTTP cache.
     * 
     * The CacheControl property allows a developer to set simple read and write cache control behavior on the [HttpBaseProtocolFilter](httpbaseprotocolfilter.md) object. To use this feature, an app creates an [HttpClient](../windows.web.http/httpclient.md) object with a new [HttpBaseProtocolFilter](httpbaseprotocolfilter.md) object . The CacheControl property on the [HttpBaseProtocolFilter](httpbaseprotocolfilter.md) returns an [HttpCacheControl](httpcachecontrol.md) object. Properties on the [HttpCacheControl](httpcachecontrol.md) object are used to set to the read and write cache control behavior for the [HttpBaseProtocolFilter](httpbaseprotocolfilter.md) and the associated [HttpClient](../windows.web.http/httpclient.md) object. This determines the read and write cache behavior on responses to [HttpClient](../windows.web.http/httpclient.md) requests.
     * 
     * Developers can still use the HTTP **Cache-Control** header for more complete control over caching. The [HttpCacheDirectiveHeaderValueCollection](../windows.web.http.headers/httpcachedirectiveheadervaluecollection.md) provides a collection container for instances of the cache directives in **Cache-Control** HTTP header on HTTP content associated with an HTTP request or response. The **Cache-Control** header lets an app control caching behavior used by a server on HTTP content.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.filters.httpbaseprotocolfilter.cachecontrol
     * @type {HttpCacheControl} 
     */
    CacheControl {
        get => this.get_CacheControl()
    }

    /**
     * Get the [HttpCookieManager](../windows.web.http/httpcookiemanager.md) with the cookies associated with an app.
     * @remarks
     * The [HttpCookieManager](../windows.web.http/httpcookiemanager.md) object allows a developer to add or delete an [HttpCookie](../windows.web.http/httpcookie.md) or view the cookies associated with an app.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.filters.httpbaseprotocolfilter.cookiemanager
     * @type {HttpCookieManager} 
     */
    CookieManager {
        get => this.get_CookieManager()
    }

    /**
     * Get or set the client SSL certificate that will be sent to the server if the server requests a client certificate.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.filters.httpbaseprotocolfilter.clientcertificate
     * @type {Certificate} 
     */
    ClientCertificate {
        get => this.get_ClientCertificate()
        set => this.put_ClientCertificate(value)
    }

    /**
     * Get a vector of SSL server certificate errors that the app might subsequently choose to ignore.
     * @remarks
     * SSL server certificate errors should only be ignored in advanced scenarios. Disregarding server certificate errors classified as either **Ignorable** or **Fatal** may result in the loss of privacy or integrity of the content passed over the SSL session.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.filters.httpbaseprotocolfilter.ignorableservercertificateerrors
     * @type {IVector<Integer>} 
     */
    IgnorableServerCertificateErrors {
        get => this.get_IgnorableServerCertificateErrors()
    }

    /**
     * Get or set the maximum number of TCP connections allowed per HTTP server by the [HttpBaseProtocolFilter](httpbaseprotocolfilter.md) object.
     * @remarks
     * The **MaxConnectionsPerServer** property determines the maximum number of TCP connections to an HTTP server allowed on the [HttpBaseProtocolFilter](httpbaseprotocolfilter.md) object. The best value for your application to set this property to depends on your usage pattern, and on the server, and it also depends on whether you're optimizing for performance for a single query or performance for all queries.
     * 
     * The default value for this property is currently 6. But the default value is a function of the version of the [HttpBaseProtocolFilter](httpbaseprotocolfilter.md), and it is not guaranteed to be unchanged from one release to another.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.filters.httpbaseprotocolfilter.maxconnectionsperserver
     * @type {Integer} 
     */
    MaxConnectionsPerServer {
        get => this.get_MaxConnectionsPerServer()
        set => this.put_MaxConnectionsPerServer(value)
    }

    /**
     * Get or set the credentials to be used to negotiate with an HTTP proxy.
     * @remarks
     * The system normally determines the proxy credentials to use automatically. This property only needs to be set in advanced scenarios.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.filters.httpbaseprotocolfilter.proxycredential
     * @type {PasswordCredential} 
     */
    ProxyCredential {
        get => this.get_ProxyCredential()
        set => this.put_ProxyCredential(value)
    }

    /**
     * Get or set the credentials to be used to authenticate with an HTTP server.
     * @remarks
     * The system normally determines the credentials needed to authenticate with an HTTP server automatically. This property only needs to be set in advanced scenarios.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.filters.httpbaseprotocolfilter.servercredential
     * @type {PasswordCredential} 
     */
    ServerCredential {
        get => this.get_ServerCredential()
        set => this.put_ServerCredential(value)
    }

    /**
     * Get or set a value that indicates whether the [HttpBaseProtocolFilter](httpbaseprotocolfilter.md) can use a proxy for sending HTTP requests.
     * @remarks
     * It is possible for this property to be **true** and a proxy exists, but [HttpBaseProtocolFilter](httpbaseprotocolfilter.md) still doesn't use the proxy. This can occur depending on WPAD settings and whether the target URI is to an internal versus an external web server.
     * 
     * Many companies require the use of proxies to communicate with HTTP from a local intranet to the Internet.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.filters.httpbaseprotocolfilter.useproxy
     * @type {Boolean} 
     */
    UseProxy {
        get => this.get_UseProxy()
        set => this.put_UseProxy(value)
    }

    /**
     * Gets or sets the version of the HTTP protocol used.
     * @remarks
     * By default, when a new request is started using [Windows.Web.Http.HttpClient](../windows.web.http/httpclient.md), it uses HTTP 2.0. To create an instance of HttpClient that uses HTTP 1.1 instead, set this property to **HttpVersion.Http11** on a filter, and then create a new instance of HttpClient, passing the filter as an argument to the HttpClient constructor.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.filters.httpbaseprotocolfilter.maxversion
     * @type {Integer} 
     */
    MaxVersion {
        get => this.get_MaxVersion()
        set => this.put_MaxVersion(value)
    }

    /**
     * Gets or sets the cookie usage behavior. By default, cookies are handled automatically.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.filters.httpbaseprotocolfilter.cookieusagebehavior
     * @type {Integer} 
     */
    CookieUsageBehavior {
        get => this.get_CookieUsageBehavior()
        set => this.put_CookieUsageBehavior(value)
    }

    /**
     * Gets the [User](./windows.system/user.md) associated with the [HttpBaseProtocolFilter](httpbaseprotocolfilter.md).
     * @remarks
     * The default value is null unless the HttpBaseProtocolFilter is created with the [CreateForUser](httpbaseprotocolfilter_createforuser_24112450.md) constructor.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.filters.httpbaseprotocolfilter.user
     * @type {User} 
     */
    User {
        get => this.get_User()
    }

    /**
     * This event is raised when the SSL/TLS connection is being established with the server. You should implement an event handler for this event if you need to perform extra validation (in addition to the OS default) of the server SSL certificate.
     * @remarks
     * Default OS validation of the server certificate is performed before raising this event. If the certificate fails this validation, the connection is terminated and your event handler is not called.
     * 
     * In order to skip parts of the OS validation (not recommended for production scenarios), use the [IgnorableServerCertificateErrors](httpbaseprotocolfilter_ignorableservercertificateerrors.md) property to specify the errors that you want to ignore. Then as long as the certificate does not have any other errors, the OS validation will be considered successful and your event handler will be called.
     * 
     * The event handler code is executed as part of a synchronous callback in the OS during the SSL/TLS connection establishment. Avoid performing long-running tasks within the event handler code to prevent the server from timing out during the connection.
     * 
     * If you need to call async APIs within your event handler code, you must take a deferral (See [HttpServerCustomValidationArgs.GetDeferral](httpservercustomvalidationrequestedeventargs_getdeferral_254836512.md)) before calling the asynchronous APIs. Once you are done, call the [deferral.Complete](../windows.foundation/deferral_complete_1807836922.md) method to return control from your handler code.
     * 
     * The following snippet shows how to subscribe to this event.
     * 
     * ```csharp
     * 
     * HttpBaseProtocolFilter.ServerCustomValidationRequest += (sender, args) =>
     * {
     * 	var cert = args.ServerCertificate
     * 	// Your custom cert validation code here.
     * }
     * ```
     * @type {TypedEventHandler<HttpBaseProtocolFilter, HttpServerCustomValidationRequestedEventArgs>}
    */
    OnServerCustomValidationRequested {
        get {
            if(!this.HasProp("__OnServerCustomValidationRequested")){
                this.__OnServerCustomValidationRequested := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{ed0260c6-41f2-5a04-9a8b-2930d7ff8a9e}"),
                    HttpBaseProtocolFilter,
                    HttpServerCustomValidationRequestedEventArgs
                )
                this.__OnServerCustomValidationRequestedToken := this.add_ServerCustomValidationRequested(this.__OnServerCustomValidationRequested.iface)
            }
            return this.__OnServerCustomValidationRequested
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [HttpBaseProtocolFilter](httpbaseprotocolfilter.md) class.
     * 
     * In a desktop app, before using an instance of this class in a way that displays UI, you'll need to associate the object with its owner's window handle. For more info, and code examples, see [Display WinRT UI objects that depend on CoreWindow](/windows/apps/develop/ui-input/display-ui-objects#winui-3-with-c).
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Web.Http.Filters.HttpBaseProtocolFilter")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnServerCustomValidationRequestedToken")) {
            this.remove_ServerCustomValidationRequested(this.__OnServerCustomValidationRequestedToken)
            this.__OnServerCustomValidationRequested.iface.Dispose()
        }

        this.Close()

        super.__Delete()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AllowAutoRedirect() {
        if (!this.HasProp("__IHttpBaseProtocolFilter")) {
            if ((queryResult := this.QueryInterface(IHttpBaseProtocolFilter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpBaseProtocolFilter := IHttpBaseProtocolFilter(outPtr)
        }

        return this.__IHttpBaseProtocolFilter.get_AllowAutoRedirect()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AllowAutoRedirect(value) {
        if (!this.HasProp("__IHttpBaseProtocolFilter")) {
            if ((queryResult := this.QueryInterface(IHttpBaseProtocolFilter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpBaseProtocolFilter := IHttpBaseProtocolFilter(outPtr)
        }

        return this.__IHttpBaseProtocolFilter.put_AllowAutoRedirect(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AllowUI() {
        if (!this.HasProp("__IHttpBaseProtocolFilter")) {
            if ((queryResult := this.QueryInterface(IHttpBaseProtocolFilter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpBaseProtocolFilter := IHttpBaseProtocolFilter(outPtr)
        }

        return this.__IHttpBaseProtocolFilter.get_AllowUI()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AllowUI(value) {
        if (!this.HasProp("__IHttpBaseProtocolFilter")) {
            if ((queryResult := this.QueryInterface(IHttpBaseProtocolFilter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpBaseProtocolFilter := IHttpBaseProtocolFilter(outPtr)
        }

        return this.__IHttpBaseProtocolFilter.put_AllowUI(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AutomaticDecompression() {
        if (!this.HasProp("__IHttpBaseProtocolFilter")) {
            if ((queryResult := this.QueryInterface(IHttpBaseProtocolFilter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpBaseProtocolFilter := IHttpBaseProtocolFilter(outPtr)
        }

        return this.__IHttpBaseProtocolFilter.get_AutomaticDecompression()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AutomaticDecompression(value) {
        if (!this.HasProp("__IHttpBaseProtocolFilter")) {
            if ((queryResult := this.QueryInterface(IHttpBaseProtocolFilter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpBaseProtocolFilter := IHttpBaseProtocolFilter(outPtr)
        }

        return this.__IHttpBaseProtocolFilter.put_AutomaticDecompression(value)
    }

    /**
     * 
     * @returns {HttpCacheControl} 
     */
    get_CacheControl() {
        if (!this.HasProp("__IHttpBaseProtocolFilter")) {
            if ((queryResult := this.QueryInterface(IHttpBaseProtocolFilter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpBaseProtocolFilter := IHttpBaseProtocolFilter(outPtr)
        }

        return this.__IHttpBaseProtocolFilter.get_CacheControl()
    }

    /**
     * 
     * @returns {HttpCookieManager} 
     */
    get_CookieManager() {
        if (!this.HasProp("__IHttpBaseProtocolFilter")) {
            if ((queryResult := this.QueryInterface(IHttpBaseProtocolFilter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpBaseProtocolFilter := IHttpBaseProtocolFilter(outPtr)
        }

        return this.__IHttpBaseProtocolFilter.get_CookieManager()
    }

    /**
     * 
     * @returns {Certificate} 
     */
    get_ClientCertificate() {
        if (!this.HasProp("__IHttpBaseProtocolFilter")) {
            if ((queryResult := this.QueryInterface(IHttpBaseProtocolFilter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpBaseProtocolFilter := IHttpBaseProtocolFilter(outPtr)
        }

        return this.__IHttpBaseProtocolFilter.get_ClientCertificate()
    }

    /**
     * 
     * @param {Certificate} value 
     * @returns {HRESULT} 
     */
    put_ClientCertificate(value) {
        if (!this.HasProp("__IHttpBaseProtocolFilter")) {
            if ((queryResult := this.QueryInterface(IHttpBaseProtocolFilter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpBaseProtocolFilter := IHttpBaseProtocolFilter(outPtr)
        }

        return this.__IHttpBaseProtocolFilter.put_ClientCertificate(value)
    }

    /**
     * 
     * @returns {IVector<Integer>} 
     */
    get_IgnorableServerCertificateErrors() {
        if (!this.HasProp("__IHttpBaseProtocolFilter")) {
            if ((queryResult := this.QueryInterface(IHttpBaseProtocolFilter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpBaseProtocolFilter := IHttpBaseProtocolFilter(outPtr)
        }

        return this.__IHttpBaseProtocolFilter.get_IgnorableServerCertificateErrors()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxConnectionsPerServer() {
        if (!this.HasProp("__IHttpBaseProtocolFilter")) {
            if ((queryResult := this.QueryInterface(IHttpBaseProtocolFilter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpBaseProtocolFilter := IHttpBaseProtocolFilter(outPtr)
        }

        return this.__IHttpBaseProtocolFilter.get_MaxConnectionsPerServer()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_MaxConnectionsPerServer(value) {
        if (!this.HasProp("__IHttpBaseProtocolFilter")) {
            if ((queryResult := this.QueryInterface(IHttpBaseProtocolFilter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpBaseProtocolFilter := IHttpBaseProtocolFilter(outPtr)
        }

        return this.__IHttpBaseProtocolFilter.put_MaxConnectionsPerServer(value)
    }

    /**
     * 
     * @returns {PasswordCredential} 
     */
    get_ProxyCredential() {
        if (!this.HasProp("__IHttpBaseProtocolFilter")) {
            if ((queryResult := this.QueryInterface(IHttpBaseProtocolFilter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpBaseProtocolFilter := IHttpBaseProtocolFilter(outPtr)
        }

        return this.__IHttpBaseProtocolFilter.get_ProxyCredential()
    }

    /**
     * 
     * @param {PasswordCredential} value 
     * @returns {HRESULT} 
     */
    put_ProxyCredential(value) {
        if (!this.HasProp("__IHttpBaseProtocolFilter")) {
            if ((queryResult := this.QueryInterface(IHttpBaseProtocolFilter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpBaseProtocolFilter := IHttpBaseProtocolFilter(outPtr)
        }

        return this.__IHttpBaseProtocolFilter.put_ProxyCredential(value)
    }

    /**
     * 
     * @returns {PasswordCredential} 
     */
    get_ServerCredential() {
        if (!this.HasProp("__IHttpBaseProtocolFilter")) {
            if ((queryResult := this.QueryInterface(IHttpBaseProtocolFilter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpBaseProtocolFilter := IHttpBaseProtocolFilter(outPtr)
        }

        return this.__IHttpBaseProtocolFilter.get_ServerCredential()
    }

    /**
     * 
     * @param {PasswordCredential} value 
     * @returns {HRESULT} 
     */
    put_ServerCredential(value) {
        if (!this.HasProp("__IHttpBaseProtocolFilter")) {
            if ((queryResult := this.QueryInterface(IHttpBaseProtocolFilter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpBaseProtocolFilter := IHttpBaseProtocolFilter(outPtr)
        }

        return this.__IHttpBaseProtocolFilter.put_ServerCredential(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_UseProxy() {
        if (!this.HasProp("__IHttpBaseProtocolFilter")) {
            if ((queryResult := this.QueryInterface(IHttpBaseProtocolFilter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpBaseProtocolFilter := IHttpBaseProtocolFilter(outPtr)
        }

        return this.__IHttpBaseProtocolFilter.get_UseProxy()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_UseProxy(value) {
        if (!this.HasProp("__IHttpBaseProtocolFilter")) {
            if ((queryResult := this.QueryInterface(IHttpBaseProtocolFilter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpBaseProtocolFilter := IHttpBaseProtocolFilter(outPtr)
        }

        return this.__IHttpBaseProtocolFilter.put_UseProxy(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxVersion() {
        if (!this.HasProp("__IHttpBaseProtocolFilter2")) {
            if ((queryResult := this.QueryInterface(IHttpBaseProtocolFilter2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpBaseProtocolFilter2 := IHttpBaseProtocolFilter2(outPtr)
        }

        return this.__IHttpBaseProtocolFilter2.get_MaxVersion()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_MaxVersion(value) {
        if (!this.HasProp("__IHttpBaseProtocolFilter2")) {
            if ((queryResult := this.QueryInterface(IHttpBaseProtocolFilter2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpBaseProtocolFilter2 := IHttpBaseProtocolFilter2(outPtr)
        }

        return this.__IHttpBaseProtocolFilter2.put_MaxVersion(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CookieUsageBehavior() {
        if (!this.HasProp("__IHttpBaseProtocolFilter3")) {
            if ((queryResult := this.QueryInterface(IHttpBaseProtocolFilter3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpBaseProtocolFilter3 := IHttpBaseProtocolFilter3(outPtr)
        }

        return this.__IHttpBaseProtocolFilter3.get_CookieUsageBehavior()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_CookieUsageBehavior(value) {
        if (!this.HasProp("__IHttpBaseProtocolFilter3")) {
            if ((queryResult := this.QueryInterface(IHttpBaseProtocolFilter3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpBaseProtocolFilter3 := IHttpBaseProtocolFilter3(outPtr)
        }

        return this.__IHttpBaseProtocolFilter3.put_CookieUsageBehavior(value)
    }

    /**
     * 
     * @param {TypedEventHandler<HttpBaseProtocolFilter, HttpServerCustomValidationRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ServerCustomValidationRequested(handler) {
        if (!this.HasProp("__IHttpBaseProtocolFilter4")) {
            if ((queryResult := this.QueryInterface(IHttpBaseProtocolFilter4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpBaseProtocolFilter4 := IHttpBaseProtocolFilter4(outPtr)
        }

        return this.__IHttpBaseProtocolFilter4.add_ServerCustomValidationRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ServerCustomValidationRequested(token) {
        if (!this.HasProp("__IHttpBaseProtocolFilter4")) {
            if ((queryResult := this.QueryInterface(IHttpBaseProtocolFilter4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpBaseProtocolFilter4 := IHttpBaseProtocolFilter4(outPtr)
        }

        return this.__IHttpBaseProtocolFilter4.remove_ServerCustomValidationRequested(token)
    }

    /**
     * Clears authentication credentials currently cached on the device.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.filters.httpbaseprotocolfilter.clearauthenticationcache
     */
    ClearAuthenticationCache() {
        if (!this.HasProp("__IHttpBaseProtocolFilter4")) {
            if ((queryResult := this.QueryInterface(IHttpBaseProtocolFilter4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpBaseProtocolFilter4 := IHttpBaseProtocolFilter4(outPtr)
        }

        return this.__IHttpBaseProtocolFilter4.ClearAuthenticationCache()
    }

    /**
     * 
     * @returns {User} 
     */
    get_User() {
        if (!this.HasProp("__IHttpBaseProtocolFilter5")) {
            if ((queryResult := this.QueryInterface(IHttpBaseProtocolFilter5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpBaseProtocolFilter5 := IHttpBaseProtocolFilter5(outPtr)
        }

        return this.__IHttpBaseProtocolFilter5.get_User()
    }

    /**
     * Send an HTTP request using the [HttpBaseProtocolFilter](httpbaseprotocolfilter.md) as an asynchronous operation.
     * @remarks
     * This operation will not block. The returned [IAsyncOperationWithProgress](../windows.foundation/iasyncoperationwithprogress_2.md) (of [HttpResponseMessage](/uwp/api/windows.web.http.httpresponsemessage) and [HttpProgress](/uwp/api/windows.web.http.httpprogress)) completes once the entire HTTP response message is received.
     * 
     * Below are exceptions that this function throws.
     * @param {HttpRequestMessage} request The HTTP request message to send.
     * @returns {IAsyncOperationWithProgress<HttpResponseMessage, HttpProgress>} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.filters.httpbaseprotocolfilter.sendrequestasync
     */
    SendRequestAsync(request) {
        if (!this.HasProp("__IHttpFilter")) {
            if ((queryResult := this.QueryInterface(IHttpFilter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpFilter := IHttpFilter(outPtr)
        }

        return this.__IHttpFilter.SendRequestAsync(request)
    }

    /**
     * Closes the [HttpBaseProtocolFilter](httpbaseprotocolfilter.md) instance and releases allocated resources.
     * @remarks
     * The Close method releases allocated resources used by the [HttpBaseProtocolFilter](httpbaseprotocolfilter.md) instance. The Close method can be used to manage the lifetime of system resources (the network socket used by the [HttpBaseProtocolFilter](httpbaseprotocolfilter.md), for example) that are used by a Windows Runtime object.
     * 
     * In the .NET Framework 4.5, this method is projected as the [Dispose](/uwp/api/windows.web.http.filters.httpbaseprotocolfilter.dispose) method. In Visual C++ component extensions (C++/CX), this method is projected as part of the destructor (delete operator).
     * 
     * Apps written in JavaScript, C#, or VB.NET use garbage collection to release resources. So the [HttpBaseProtocolFilter](httpbaseprotocolfilter.md) object and associated resources doesn't get released until the garbage collection pass runs. The Close method allows an app to release these resources early rather than waiting for the object to be released by garbage collection.
     * 
     * Apps written in C++ or CX don't have a Close method since these apps can destroy the object deterministically. In C++ and CX, objects are released when they fall out of program scope or as part of the destructor (delete operator) for the object.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.filters.httpbaseprotocolfilter.close
     */
    Close() {
        if (!this.HasProp("__IClosable")) {
            if ((queryResult := this.QueryInterface(IClosable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClosable := IClosable(outPtr)
        }

        return this.__IClosable.Close()
    }

;@endregion Instance Methods
}

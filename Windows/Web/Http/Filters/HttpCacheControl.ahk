#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHttpCacheControl.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides control of the local HTTP cache for responses to HTTP requests by methods in the [Windows.Web.Http](../windows.web.http/windows_web_http.md) and [Windows.Web.Http.Filters](windows_web_http_filters.md) namespaces.
 * @remarks
 * The HttpCacheControl object provides properties to get or set the read and write cache control behavior to be used on the [HttpBaseProtocolFilter](httpbaseprotocolfilter.md) object. HTTP read requests can use the local HTTP cache for the responses. Content returned by HTTP requests can be written to the local HTTP cache.
 * 
 * The HttpCacheControl object allows a developer to set simple read and write cache control behavior on the [HttpBaseProtocolFilter](httpbaseprotocolfilter.md) object. To use this feature, an app creates an [HttpClient](../windows.web.http/httpclient.md) object with a new [HttpBaseProtocolFilter](httpbaseprotocolfilter.md) object. The [CacheControl](httpbaseprotocolfilter_cachecontrol.md) property on the [HttpBaseProtocolFilter](httpbaseprotocolfilter.md) object returns an HttpCacheControl object used to set read and write cache behavior for the [HttpBaseProtocolFilter](httpbaseprotocolfilter.md) and the associated [HttpClient](../windows.web.http/httpclient.md) object. This determines the read and write cache behavior on responses to [HttpClient](../windows.web.http/httpclient.md) requests.
 * 
 * Developers can still use the HTTP **Cache-Control** header for more complete control over caching. The [HttpCacheDirectiveHeaderValueCollection](../windows.web.http.headers/httpcachedirectiveheadervaluecollection.md) provides a collection container for instances of the cache directives in **Cache-Control** HTTP header on HTTP content associated with an HTTP request or response.
 * @see https://learn.microsoft.com/uwp/api/windows.web.http.filters.httpcachecontrol
 * @namespace Windows.Web.Http.Filters
 * @version WindowsRuntime 1.4
 */
class HttpCacheControl extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHttpCacheControl

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHttpCacheControl.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Get or set the read behavior to use for cache control on the [HttpCacheControl](httpcachecontrol.md) object.
     * @remarks
     * The ReadBehavior property on the [HttpCacheControl](httpcachecontrol.md) object allows an app to get or set the read cache behavior to use on the [HttpBaseProtocolFilter](httpbaseprotocolfilter.md) object. HTTP read requests can use the local HTTP cache for the responses. Content returned by HTTP requests can be written to the local HTTP cache.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.filters.httpcachecontrol.readbehavior
     * @type {Integer} 
     */
    ReadBehavior {
        get => this.get_ReadBehavior()
        set => this.put_ReadBehavior(value)
    }

    /**
     * Get or set the write behavior to use for cache control on the [HttpCacheControl](httpcachecontrol.md) object.
     * @remarks
     * The WriteBehavior property on the [HttpCacheControl](httpcachecontrol.md) object allows an app to get or set the write cache behavior to use on the [HttpBaseProtocolFilter](httpbaseprotocolfilter.md) object. Content returned by HTTP requests can be written to the local HTTP cache.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.filters.httpcachecontrol.writebehavior
     * @type {Integer} 
     */
    WriteBehavior {
        get => this.get_WriteBehavior()
        set => this.put_WriteBehavior(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ReadBehavior() {
        if (!this.HasProp("__IHttpCacheControl")) {
            if ((queryResult := this.QueryInterface(IHttpCacheControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpCacheControl := IHttpCacheControl(outPtr)
        }

        return this.__IHttpCacheControl.get_ReadBehavior()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ReadBehavior(value) {
        if (!this.HasProp("__IHttpCacheControl")) {
            if ((queryResult := this.QueryInterface(IHttpCacheControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpCacheControl := IHttpCacheControl(outPtr)
        }

        return this.__IHttpCacheControl.put_ReadBehavior(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_WriteBehavior() {
        if (!this.HasProp("__IHttpCacheControl")) {
            if ((queryResult := this.QueryInterface(IHttpCacheControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpCacheControl := IHttpCacheControl(outPtr)
        }

        return this.__IHttpCacheControl.get_WriteBehavior()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_WriteBehavior(value) {
        if (!this.HasProp("__IHttpCacheControl")) {
            if ((queryResult := this.QueryInterface(IHttpCacheControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpCacheControl := IHttpCacheControl(outPtr)
        }

        return this.__IHttpCacheControl.put_WriteBehavior(value)
    }

;@endregion Instance Methods
}

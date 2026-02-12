#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHttpCookieManager.ahk
#Include ..\..\..\Guid.ahk

/**
 * Add or delete an [HttpCookie](httpcookie.md) or view the cookies associated with an app.
 * @remarks
 * The HttpCookieManager object is used to add or delete an [HttpCookie](httpcookie.md) or view the cookies associated with an app.
 * 
 * The [CookieManager](../windows.web.http.filters/httpbaseprotocolfilter_cookiemanager.md) property on [HttpBaseProtocolFilter](../windows.web.http.filters/httpbaseprotocolfilter.md) returns an HttpCookieManager object. To construct an HttpCookieManager, an [HttpBaseProtocolFilter](../windows.web.http.filters/httpbaseprotocolfilter.md) object is first created and then the [CookieManager](../windows.web.http.filters/httpbaseprotocolfilter_cookiemanager.md) property on [HttpBaseProtocolFilter](../windows.web.http.filters/httpbaseprotocolfilter.md) returns the HttpCookieManager object.
 * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpcookiemanager
 * @namespace Windows.Web.Http
 * @version WindowsRuntime 1.4
 */
class HttpCookieManager extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHttpCookieManager

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHttpCookieManager.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Add or change an [HttpCookie](httpcookie.md) in the cookies associated with an app.
     * @remarks
     * If the [HttpCookie](httpcookie.md) already exists, then the values and parameters associated the [HttpCookie](httpcookie.md) are updated.
     * 
     * If the [HttpCookie](httpcookie.md) does not exist, then the [HttpCookie](httpcookie.md) is added based on policy. For example, the policy might be to reject third-party cookies.
     * 
     * The added or changed [HttpCookie](httpcookie.md) will be sent on subsequent HTTP requests.
     * 
     * Setting an [HttpCookie](httpcookie.md) doesn't update the [HttpCookieCollection](httpcookiecollection.md) previously returned by the [GetCookies](httpcookiemanager_getcookies_1465382103.md) method.
     * @param {HttpCookie} cookie The [HttpCookie](httpcookie.md) to change or add.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpcookiemanager.setcookie
     */
    SetCookie(cookie) {
        if (!this.HasProp("__IHttpCookieManager")) {
            if ((queryResult := this.QueryInterface(IHttpCookieManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpCookieManager := IHttpCookieManager(outPtr)
        }

        return this.__IHttpCookieManager.SetCookie(cookie)
    }

    /**
     * Add or change an [HttpCookie](httpcookie.md) in the cookies associated with an app that is sent on future requests.
     * @remarks
     * If the [HttpCookie](httpcookie.md) already exists, then the values and parameters associated the [HttpCookie](httpcookie.md) are updated.
     * 
     * If the [HttpCookie](httpcookie.md) does not exist, then the [HttpCookie](httpcookie.md) is added.
     * 
     * The added or changed [HttpCookie](httpcookie.md) will be sent on subsequent HTTP requests.
     * 
     * Setting an [HttpCookie](httpcookie.md) doesn't update the [HttpCookieCollection](httpcookiecollection.md) previously returned by the [GetCookies](httpcookiemanager_getcookies_1465382103.md) method.
     * @param {HttpCookie} cookie The [HttpCookie](httpcookie.md) to change or add.
     * @param {Boolean} thirdParty 
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpcookiemanager.setcookie
     */
    SetCookieWithThirdParty(cookie, thirdParty) {
        if (!this.HasProp("__IHttpCookieManager")) {
            if ((queryResult := this.QueryInterface(IHttpCookieManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpCookieManager := IHttpCookieManager(outPtr)
        }

        return this.__IHttpCookieManager.SetCookieWithThirdParty(cookie, thirdParty)
    }

    /**
     * Delete an [HttpCookie](httpcookie.md) from the cookies associated with an app.
     * @param {HttpCookie} cookie The [HttpCookie](httpcookie.md) to delete.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpcookiemanager.deletecookie
     */
    DeleteCookie(cookie) {
        if (!this.HasProp("__IHttpCookieManager")) {
            if ((queryResult := this.QueryInterface(IHttpCookieManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpCookieManager := IHttpCookieManager(outPtr)
        }

        return this.__IHttpCookieManager.DeleteCookie(cookie)
    }

    /**
     * Gets an [HttpCookieCollection](httpcookiecollection.md) that contains the [HttpCookie](httpcookie.md) instances that are associated with a specific URI.
     * @remarks
     * The GetCookies method creates a new instance of an [HttpCookieCollection](httpcookiecollection.md). Then the [HttpCookie](httpcookie.md) instances in the internal collection that are associated with the specified URI are read out and added to the new [HttpCookieCollection](httpcookiecollection.md).
     * 
     * Below are the exceptions that this function throws.
     * @param {Uri} uri_ The URI of the [HttpCookie](httpcookie.md) instances desired.
     * @returns {HttpCookieCollection} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpcookiemanager.getcookies
     */
    GetCookies(uri_) {
        if (!this.HasProp("__IHttpCookieManager")) {
            if ((queryResult := this.QueryInterface(IHttpCookieManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpCookieManager := IHttpCookieManager(outPtr)
        }

        return this.__IHttpCookieManager.GetCookies(uri_)
    }

;@endregion Instance Methods
}

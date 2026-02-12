#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHttpCookie.ahk
#Include ..\..\Foundation\IStringable.ahk
#Include .\IHttpCookieFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides a set of properties and methods to manage an HTTP cookie.
 * @remarks
 * Cookies are small chunks of data that are passed between HTTP servers and clients. Their primary use is by the web server developers to save session state. The web server developer uses the state to correlate earlier and later requests. For example, session state can include a unique visitor id which is then used to remember (on the server side) the visitor’s shopping cart.
 * 
 * The HTTP server sends cookies to the client with the **Set-Cookie** header. The client sends them back with the **Cookie** header. Cookies that are sent back don’t include cookie attributes. The correct cookie usage is that the server sets a cookie once and doesn’t re-set it on subsequent responses. This works because a cookie, once set, will be sent back until it expires or is deleted (as long as it matches the URI correctly). Cookies are persistent when they have a valid **Expires** header. Cookies that are not persistent are session cookies, and are not persisted from one session to another.
 * 
 * Although cookies are commonly used by web services developers, they are sometimes used by client-side developers.
 * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpcookie
 * @namespace Windows.Web.Http
 * @version WindowsRuntime 1.4
 */
class HttpCookie extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHttpCookie

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHttpCookie.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes a new instance of the [HttpCookie](httpcookie.md) class with a specified name, domain, and path.
     * @remarks
     * The *name* parameter of the [HttpCookie](httpcookie.md) can't be set to **null** (**Nothing** in Visual Basic).
     * 
     * The property should be a token as defined in [RFC 2616](https://tools.ietf.org/html/rfc2616) and [RFC 6265](https://tools.ietf.org/html/rfc6265).
     * 
     * The following characters are used as separators and can't be used in the *name* parameter: 
     * + left paren ('(')
     * + right paren (')')
     * + greater than ('&gt;')
     * + less than ('&lt;')
     * + at sign ('@')
     * + comma (',')
     * + semicolon (';')
     * + colon (':')
     * + backslash ('\\')
     * + double quote ('"')
     * + forward slash ('/')
     * + left square bracket ('[')
     * + right square bracket (']')
     * + question mark ('?')
     * + equal sign ('=')
     * + left squiggly bracket ('{')
     * + right squiggly bracket ('}')
     * + new line ('\n')
     * + return ('\r")
     * + space (' ')
     * + tab ('\t")
     * 
     * 
     * The *domain * parameter specifies those hosts to which the [HttpCookie](httpcookie.md) will be sent. A cookie with a *domain * parameter of `.contoso.com` will be sent to the `contoso.com` domain and all subdomains (`www.contoso.com` and `info.contoso.com`, for example).
     * 
     * A cookie with a *domain * parameter of `info.contoso.com` will not be sent to `contoso.com` or `www.contoso.com`, but will be sent to `info.contoso.com` and all subdomains (`uk.info.contoso.com` and `us.info.contoso.com`, for example).
     * 
     * If the *domain* parameter is not specified, then the [HttpCookie](httpcookie.md) will be sent only to the host and subdomains of the host that this cookie was received from.
     * 
     * The *path* parameter specifies the subset of paths on the origin server to which this [HttpCookie](httpcookie.md) applies. If this parameter is not specified, the default path matches any path and the [HttpCookie](httpcookie.md) will be sent on all HTTP requests to the *domain * parameter specified and all subdomains.
     * @param {HSTRING} name The name for the [HttpCookie](httpcookie.md)
     * @param {HSTRING} domain The domain for which the [HttpCookie](httpcookie.md) is valid.
     * @param {HSTRING} path_ The URIs to which the [HttpCookie](httpcookie.md) applies.
     * @returns {HttpCookie} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpcookie.#ctor
     */
    static Create(name, domain, path_) {
        if (!HttpCookie.HasProp("__IHttpCookieFactory")) {
            activatableClassId := HSTRING.Create("Windows.Web.Http.HttpCookie")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHttpCookieFactory.IID)
            HttpCookie.__IHttpCookieFactory := IHttpCookieFactory(factoryPtr)
        }

        return HttpCookie.__IHttpCookieFactory.Create(name, domain, path_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Get the token that represents the [HttpCookie](httpcookie.md) name.
     * @remarks
     * The Name property must be set when [HttpCookie](httpcookie.md) is initialized by the constructor.
     * 
     * The Name of the [HttpCookie](httpcookie.md) can't be **null** (**Nothing** in Visual Basic).
     * 
     * The property should be a token as defined in [RFC 2616](https://tools.ietf.org/html/rfc2616) and [RFC 6265](https://tools.ietf.org/html/rfc6265).
     * 
     * The following characters are used as separators and can't be used in the cookie name: 
     * + left paren ('(')
     * + right paren (')')
     * + greater than ('&gt;')
     * + less than ('&lt;')
     * + at sign ('@')
     * + comma (',')
     * + semicolon (';')
     * + colon (':')
     * + backslash ('\\')
     * + double quote ('"')
     * + forward slash ('/')
     * + left square bracket ('[')
     * + right square bracket (']')
     * + question mark ('?')
     * + equal sign ('=')
     * + left squiggly bracket ('{')
     * + right squiggly bracket ('}')
     * + new line ('\n')
     * + return ('\r")
     * + space (' ')
     * + tab ('\t")
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpcookie.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * Get the domain for which the [HttpCookie](httpcookie.md) is valid.
     * @remarks
     * The Domain property specifies those hosts to which the cookie will be sent.
     * 
     * A cookie with a Domain property of `.contoso.com` will be sent to the `contoso.com` domain and all subdomains (`www.contoso.com` and `info.contoso.com`, for example).
     * 
     * A cookie with a Domain property of `info.contoso.com` will not be sent to `contoso.com` or `www.contoso.com`, but will be sent to `info.contoso.com` and all subdomains (`uk.info.contoso.com` and `us.info.contoso.com`, for example).
     * 
     * The default value for the Domain property is the host name that this cookie was received from.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpcookie.domain
     * @type {HSTRING} 
     */
    Domain {
        get => this.get_Domain()
    }

    /**
     * Get the URI path component to which the [HttpCookie](httpcookie.md) applies.
     * @remarks
     * The Path property specifies the subset of paths on the origin server to which this [HttpCookie](httpcookie.md) applies. If this property is not specified, the default path matches any path and the [HttpCookie](httpcookie.md) will be sent on all HTTP requests to the [Domain](httpcookie_domain.md).
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpcookie.path
     * @type {HSTRING} 
     */
    Path {
        get => this.get_Path()
    }

    /**
     * Get or set the expiration date and time for the [HttpCookie](httpcookie.md).
     * @remarks
     * Setting the Expires property to **null** makes this a Cookie that is only good for the current HTTP session and will not be persisted. Setting the Expires property to a date in the past deletes the Cookie.
     * 
     * The default value for the Expires property is **null**.
     * 
     * Javascript and .NET languages do not use [DateTime](../windows.foundation/datetime.md) directly. In Javascript a [DateTime](../windows.foundation/datetime.md) is projected as a **Date** object, and in .NET it is projected as a [System.DateTimeOffset](/dotnet/api/system.datetimeoffset?view=dotnet-uwp-10.0&preserve-view=true) structure. In C++, the **DateTime.UniversalTime** member has the same granularity as a  and supports the date ranges required by Javascript and .NET.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpcookie.expires
     * @type {IReference<DateTime>} 
     */
    Expires {
        get => this.get_Expires()
        set => this.put_Expires(value)
    }

    /**
     * Get or set a value that controls whether a script or other active content can access this [HttpCookie](httpcookie.md).
     * @remarks
     * When this property is set to **true**, a script or other active content cannot access this HTTP cookie.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpcookie.httponly
     * @type {Boolean} 
     */
    HttpOnly {
        get => this.get_HttpOnly()
        set => this.put_HttpOnly(value)
    }

    /**
     * Get or set the security level for the [HttpCookie](httpcookie.md).
     * @remarks
     * When this property is **true**, this HTTP cookie may be sent only with **https:///* requests. This provides additional security since this prevents network sniffing the value of the cookie.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpcookie.secure
     * @type {Boolean} 
     */
    Secure {
        get => this.get_Secure()
        set => this.put_Secure(value)
    }

    /**
     * Get or set the value for the [HttpCookie](httpcookie.md).
     * @remarks
     * The Value of the [HttpCookie](httpcookie.md) must not be set to **null** (**Nothing** in Visual Basic).
     * 
     * The following characters are reserved and cannot be used for this property: 
     * + backslash ('\\')
     * + comma (',')
     * + semicolon (';')
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpcookie.value
     * @type {HSTRING} 
     */
    Value {
        get => this.get_Value()
        set => this.put_Value(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Name() {
        if (!this.HasProp("__IHttpCookie")) {
            if ((queryResult := this.QueryInterface(IHttpCookie.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpCookie := IHttpCookie(outPtr)
        }

        return this.__IHttpCookie.get_Name()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Domain() {
        if (!this.HasProp("__IHttpCookie")) {
            if ((queryResult := this.QueryInterface(IHttpCookie.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpCookie := IHttpCookie(outPtr)
        }

        return this.__IHttpCookie.get_Domain()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Path() {
        if (!this.HasProp("__IHttpCookie")) {
            if ((queryResult := this.QueryInterface(IHttpCookie.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpCookie := IHttpCookie(outPtr)
        }

        return this.__IHttpCookie.get_Path()
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_Expires() {
        if (!this.HasProp("__IHttpCookie")) {
            if ((queryResult := this.QueryInterface(IHttpCookie.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpCookie := IHttpCookie(outPtr)
        }

        return this.__IHttpCookie.get_Expires()
    }

    /**
     * 
     * @param {IReference<DateTime>} value 
     * @returns {HRESULT} 
     */
    put_Expires(value) {
        if (!this.HasProp("__IHttpCookie")) {
            if ((queryResult := this.QueryInterface(IHttpCookie.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpCookie := IHttpCookie(outPtr)
        }

        return this.__IHttpCookie.put_Expires(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HttpOnly() {
        if (!this.HasProp("__IHttpCookie")) {
            if ((queryResult := this.QueryInterface(IHttpCookie.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpCookie := IHttpCookie(outPtr)
        }

        return this.__IHttpCookie.get_HttpOnly()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_HttpOnly(value) {
        if (!this.HasProp("__IHttpCookie")) {
            if ((queryResult := this.QueryInterface(IHttpCookie.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpCookie := IHttpCookie(outPtr)
        }

        return this.__IHttpCookie.put_HttpOnly(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Secure() {
        if (!this.HasProp("__IHttpCookie")) {
            if ((queryResult := this.QueryInterface(IHttpCookie.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpCookie := IHttpCookie(outPtr)
        }

        return this.__IHttpCookie.get_Secure()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Secure(value) {
        if (!this.HasProp("__IHttpCookie")) {
            if ((queryResult := this.QueryInterface(IHttpCookie.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpCookie := IHttpCookie(outPtr)
        }

        return this.__IHttpCookie.put_Secure(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Value() {
        if (!this.HasProp("__IHttpCookie")) {
            if ((queryResult := this.QueryInterface(IHttpCookie.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpCookie := IHttpCookie(outPtr)
        }

        return this.__IHttpCookie.get_Value()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Value(value) {
        if (!this.HasProp("__IHttpCookie")) {
            if ((queryResult := this.QueryInterface(IHttpCookie.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpCookie := IHttpCookie(outPtr)
        }

        return this.__IHttpCookie.put_Value(value)
    }

    /**
     * Returns a string that represents the current [HttpCookie](httpcookie.md) object.
     * @remarks
     * The ToString method returns a string that matches a **Set-Cookie** HTTP header suitable for including on a request message.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpcookie.tostring
     */
    ToString() {
        if (!this.HasProp("__IStringable")) {
            if ((queryResult := this.QueryInterface(IStringable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStringable := IStringable(outPtr)
        }

        return this.__IStringable.ToString()
    }

;@endregion Instance Methods
}

#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHttpChallengeHeaderValue.ahk
#Include ..\..\..\Foundation\IStringable.ahk
#Include .\IHttpChallengeHeaderValueStatics.ahk
#Include .\IHttpChallengeHeaderValueFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents authentication information used in the **Proxy-Authenticate** and **WWW-Authenticate** HTTP header values.
 * @remarks
 * The HttpChallengeHeaderValue class provides support for the authentication information in **Authorization**, **ProxyAuthorization**, **WWW-Authenticate**, and **Proxy-Authenticate** HTTP header values as defined in [RFC 2616](https://tools.ietf.org/html/rfc2616) by the IETF.
 * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpchallengeheadervalue
 * @namespace Windows.Web.Http.Headers
 * @version WindowsRuntime 1.4
 */
class HttpChallengeHeaderValue extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHttpChallengeHeaderValue

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHttpChallengeHeaderValue.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Converts a string to an [HttpChallengeHeaderValue](httpchallengeheadervalue.md) instance.
     * @remarks
     * Below are exceptions that this function throws.
     * @param {HSTRING} input_ A string that represents authentication header value information.
     * @returns {HttpChallengeHeaderValue} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpchallengeheadervalue.parse
     */
    static Parse(input_) {
        if (!HttpChallengeHeaderValue.HasProp("__IHttpChallengeHeaderValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Web.Http.Headers.HttpChallengeHeaderValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHttpChallengeHeaderValueStatics.IID)
            HttpChallengeHeaderValue.__IHttpChallengeHeaderValueStatics := IHttpChallengeHeaderValueStatics(factoryPtr)
        }

        return HttpChallengeHeaderValue.__IHttpChallengeHeaderValueStatics.Parse(input_)
    }

    /**
     * Determines whether a string is valid [HttpChallengeHeaderValue](httpchallengeheadervalue.md) information.
     * @param {HSTRING} input_ The string to validate.
     * @param {Pointer<HttpChallengeHeaderValue>} challengeHeaderValue The [HttpChallengeHeaderValue](httpchallengeheadervalue.md) version of the string.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpchallengeheadervalue.tryparse
     */
    static TryParse(input_, challengeHeaderValue) {
        if (!HttpChallengeHeaderValue.HasProp("__IHttpChallengeHeaderValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Web.Http.Headers.HttpChallengeHeaderValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHttpChallengeHeaderValueStatics.IID)
            HttpChallengeHeaderValue.__IHttpChallengeHeaderValueStatics := IHttpChallengeHeaderValueStatics(factoryPtr)
        }

        return HttpChallengeHeaderValue.__IHttpChallengeHeaderValueStatics.TryParse(input_, challengeHeaderValue)
    }

    /**
     * Initializes a new instance of the [HttpChallengeHeaderValue](httpchallengeheadervalue.md) class with the scheme to use for authorization.
     * @param {HSTRING} scheme The scheme to use for authorization.
     * @returns {HttpChallengeHeaderValue} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpchallengeheadervalue.#ctor
     */
    static CreateFromScheme(scheme) {
        if (!HttpChallengeHeaderValue.HasProp("__IHttpChallengeHeaderValueFactory")) {
            activatableClassId := HSTRING.Create("Windows.Web.Http.Headers.HttpChallengeHeaderValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHttpChallengeHeaderValueFactory.IID)
            HttpChallengeHeaderValue.__IHttpChallengeHeaderValueFactory := IHttpChallengeHeaderValueFactory(factoryPtr)
        }

        return HttpChallengeHeaderValue.__IHttpChallengeHeaderValueFactory.CreateFromScheme(scheme)
    }

    /**
     * Initializes a new instance of the [HttpChallengeHeaderValue](httpchallengeheadervalue.md) class with the scheme to use for authorization and the **SPNEGO** token.
     * @param {HSTRING} scheme The scheme to use for authorization.
     * @param {HSTRING} token The **SPNEGO** token to use with the **Negotiate** protocol scheme.
     * @returns {HttpChallengeHeaderValue} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpchallengeheadervalue.#ctor
     */
    static CreateFromSchemeWithToken(scheme, token) {
        if (!HttpChallengeHeaderValue.HasProp("__IHttpChallengeHeaderValueFactory")) {
            activatableClassId := HSTRING.Create("Windows.Web.Http.Headers.HttpChallengeHeaderValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHttpChallengeHeaderValueFactory.IID)
            HttpChallengeHeaderValue.__IHttpChallengeHeaderValueFactory := IHttpChallengeHeaderValueFactory(factoryPtr)
        }

        return HttpChallengeHeaderValue.__IHttpChallengeHeaderValueFactory.CreateFromSchemeWithToken(scheme, token)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the credentials that contain the authentication information of the user agent for the resource being requested.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpchallengeheadervalue.parameters
     * @type {IVector<HttpNameValueHeaderValue>} 
     */
    Parameters {
        get => this.get_Parameters()
    }

    /**
     * Gets the scheme to use for authentication.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpchallengeheadervalue.scheme
     * @type {HSTRING} 
     */
    Scheme {
        get => this.get_Scheme()
    }

    /**
     * The **SPNEGO** token to use with the **Negotiate** protocol scheme.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpchallengeheadervalue.token
     * @type {HSTRING} 
     */
    Token {
        get => this.get_Token()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVector<HttpNameValueHeaderValue>} 
     */
    get_Parameters() {
        if (!this.HasProp("__IHttpChallengeHeaderValue")) {
            if ((queryResult := this.QueryInterface(IHttpChallengeHeaderValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpChallengeHeaderValue := IHttpChallengeHeaderValue(outPtr)
        }

        return this.__IHttpChallengeHeaderValue.get_Parameters()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Scheme() {
        if (!this.HasProp("__IHttpChallengeHeaderValue")) {
            if ((queryResult := this.QueryInterface(IHttpChallengeHeaderValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpChallengeHeaderValue := IHttpChallengeHeaderValue(outPtr)
        }

        return this.__IHttpChallengeHeaderValue.get_Scheme()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Token() {
        if (!this.HasProp("__IHttpChallengeHeaderValue")) {
            if ((queryResult := this.QueryInterface(IHttpChallengeHeaderValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpChallengeHeaderValue := IHttpChallengeHeaderValue(outPtr)
        }

        return this.__IHttpChallengeHeaderValue.get_Token()
    }

    /**
     * Returns a string that represents the current [HttpChallengeHeaderValue](httpchallengeheadervalue.md) object.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpchallengeheadervalue.tostring
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

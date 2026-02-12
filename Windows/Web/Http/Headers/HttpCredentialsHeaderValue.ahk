#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHttpCredentialsHeaderValue.ahk
#Include ..\..\..\Foundation\IStringable.ahk
#Include .\IHttpCredentialsHeaderValueStatics.ahk
#Include .\IHttpCredentialsHeaderValueFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the value of the **Authorization** or **Proxy-Authorization** HTTP header on an HTTP request.
 * @remarks
 * The HttpCredentialsHeaderValue class represents the **Authorization** or **Proxy-Authorization** HTTP header on an HTTP request.
 * 
 * The [Authorization](httprequestheadercollection_authorization.md) property on the [HttpRequestHeaderCollection](httprequestheadercollection.md) returns an HttpCredentialsHeaderValue object that represents the **Authorization** HTTP header. The [ProxyAuthorization](httprequestheadercollection_proxyauthorization.md) property on the [HttpRequestHeaderCollection](httprequestheadercollection.md) returns an HttpCredentialsHeaderValue object that represents the **Proxy-Authorization** HTTP header.
 * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcredentialsheadervalue
 * @namespace Windows.Web.Http.Headers
 * @version WindowsRuntime 1.4
 */
class HttpCredentialsHeaderValue extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHttpCredentialsHeaderValue

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHttpCredentialsHeaderValue.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Converts a string to an [HttpCredentialsHeaderValue](httpcredentialsheadervalue.md) instance.
     * @remarks
     * Below are the exceptions that this function throws.
     * @param {HSTRING} input_ A string that represents the credential information in the **Authorization** or **Proxy-Authorization** HTTP header.
     * @returns {HttpCredentialsHeaderValue} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcredentialsheadervalue.parse
     */
    static Parse(input_) {
        if (!HttpCredentialsHeaderValue.HasProp("__IHttpCredentialsHeaderValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Web.Http.Headers.HttpCredentialsHeaderValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHttpCredentialsHeaderValueStatics.IID)
            HttpCredentialsHeaderValue.__IHttpCredentialsHeaderValueStatics := IHttpCredentialsHeaderValueStatics(factoryPtr)
        }

        return HttpCredentialsHeaderValue.__IHttpCredentialsHeaderValueStatics.Parse(input_)
    }

    /**
     * Determines whether a string is valid [HttpCredentialsHeaderValue](httpcredentialsheadervalue.md) information.
     * @param {HSTRING} input_ The string to validate.
     * @param {Pointer<HttpCredentialsHeaderValue>} credentialsHeaderValue The [HttpCredentialsHeaderValue](httpcredentialsheadervalue.md) version of the string.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcredentialsheadervalue.tryparse
     */
    static TryParse(input_, credentialsHeaderValue) {
        if (!HttpCredentialsHeaderValue.HasProp("__IHttpCredentialsHeaderValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Web.Http.Headers.HttpCredentialsHeaderValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHttpCredentialsHeaderValueStatics.IID)
            HttpCredentialsHeaderValue.__IHttpCredentialsHeaderValueStatics := IHttpCredentialsHeaderValueStatics(factoryPtr)
        }

        return HttpCredentialsHeaderValue.__IHttpCredentialsHeaderValueStatics.TryParse(input_, credentialsHeaderValue)
    }

    /**
     * Initializes a new instance of the [HttpCredentialsHeaderValue](httpcredentialsheadervalue.md) class with the scheme to use for authentication.
     * @param {HSTRING} scheme The scheme to use for authentication.
     * @returns {HttpCredentialsHeaderValue} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcredentialsheadervalue.#ctor
     */
    static CreateFromScheme(scheme) {
        if (!HttpCredentialsHeaderValue.HasProp("__IHttpCredentialsHeaderValueFactory")) {
            activatableClassId := HSTRING.Create("Windows.Web.Http.Headers.HttpCredentialsHeaderValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHttpCredentialsHeaderValueFactory.IID)
            HttpCredentialsHeaderValue.__IHttpCredentialsHeaderValueFactory := IHttpCredentialsHeaderValueFactory(factoryPtr)
        }

        return HttpCredentialsHeaderValue.__IHttpCredentialsHeaderValueFactory.CreateFromScheme(scheme)
    }

    /**
     * Initializes a new instance of the [HttpCredentialsHeaderValue](httpcredentialsheadervalue.md) class with the scheme and user token information to use for authentication.
     * @param {HSTRING} scheme The scheme to use for authentication.
     * @param {HSTRING} token The user token information to use for authentication.
     * @returns {HttpCredentialsHeaderValue} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcredentialsheadervalue.#ctor
     */
    static CreateFromSchemeWithToken(scheme, token) {
        if (!HttpCredentialsHeaderValue.HasProp("__IHttpCredentialsHeaderValueFactory")) {
            activatableClassId := HSTRING.Create("Windows.Web.Http.Headers.HttpCredentialsHeaderValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHttpCredentialsHeaderValueFactory.IID)
            HttpCredentialsHeaderValue.__IHttpCredentialsHeaderValueFactory := IHttpCredentialsHeaderValueFactory(factoryPtr)
        }

        return HttpCredentialsHeaderValue.__IHttpCredentialsHeaderValueFactory.CreateFromSchemeWithToken(scheme, token)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets a set of name/value pairs included in the **Authorization** or **Proxy-Authorization** HTTP header.
     * @remarks
     * The Parameters property gets a set of name/value pairs of the credentials containing the authentication information of the user agent for the resource being requested.
     * 
     * An [HttpCredentialsHeaderValue](httpcredentialsheadervalue.md) object has a [Scheme](httpcredentialsheadervalue_scheme.md) and either a [Token](httpcredentialsheadervalue_token.md) or a Parameters list. So either the Parameters property is an empty collection or the [Token](httpcredentialsheadervalue_token.md) property is an empty string.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcredentialsheadervalue.parameters
     * @type {IVector<HttpNameValueHeaderValue>} 
     */
    Parameters {
        get => this.get_Parameters()
    }

    /**
     * Gets the scheme to use for authentication.
     * @remarks
     * The Scheme property scheme to use for authentication of the user agent for the resource being requested.
     * 
     * An [HttpCredentialsHeaderValue](httpcredentialsheadervalue.md) object has a Scheme and either a [Token](httpcredentialsheadervalue_token.md) or a [Parameters](httpcredentialsheadervalue_parameters.md) list. So either the [Parameters](httpcredentialsheadervalue_parameters.md) property is an empty collection or the [Token](httpcredentialsheadervalue_token.md) property is an empty string.
     * 
     * Each authentication scheme defines the syntax to use for authentication. Basic authentication, for example, uses base64 encoding of the **userid** and **passwd** elements in the [Token](httpcredentialsheadervalue_token.md) property. Digest authentication would use a [Parameters](httpcredentialsheadervalue_parameters.md) list of name/value pairs. Basic authentication and digest authentication are defined in IETF [RFC 2617](https://tools.ietf.org/html/rfc2617). Other schemes for authentication can be supported by the [HttpCredentialsHeaderValue](httpcredentialsheadervalue.md) class.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcredentialsheadervalue.scheme
     * @type {HSTRING} 
     */
    Scheme {
        get => this.get_Scheme()
    }

    /**
     * Gets the user token information used in the **Authorization** or **Proxy-Authorization** HTTP header.
     * @remarks
     * The Token property gets a simple string with the credentials containing the authentication information of the user agent for the resource being requested.
     * 
     * An [HttpCredentialsHeaderValue](httpcredentialsheadervalue.md) object has a [Scheme](httpcredentialsheadervalue_scheme.md) and either a Token or a [Parameters](httpcredentialsheadervalue_parameters.md) list. So either the [Parameters](httpcredentialsheadervalue_parameters.md) property is an empty collection or the Token property is an empty string.
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcredentialsheadervalue.token
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
        if (!this.HasProp("__IHttpCredentialsHeaderValue")) {
            if ((queryResult := this.QueryInterface(IHttpCredentialsHeaderValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpCredentialsHeaderValue := IHttpCredentialsHeaderValue(outPtr)
        }

        return this.__IHttpCredentialsHeaderValue.get_Parameters()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Scheme() {
        if (!this.HasProp("__IHttpCredentialsHeaderValue")) {
            if ((queryResult := this.QueryInterface(IHttpCredentialsHeaderValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpCredentialsHeaderValue := IHttpCredentialsHeaderValue(outPtr)
        }

        return this.__IHttpCredentialsHeaderValue.get_Scheme()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Token() {
        if (!this.HasProp("__IHttpCredentialsHeaderValue")) {
            if ((queryResult := this.QueryInterface(IHttpCredentialsHeaderValue.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpCredentialsHeaderValue := IHttpCredentialsHeaderValue(outPtr)
        }

        return this.__IHttpCredentialsHeaderValue.get_Token()
    }

    /**
     * Returns a string that represents the current [HttpCredentialsHeaderValue](httpcredentialsheadervalue.md) object.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.http.headers.httpcredentialsheadervalue.tostring
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

#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWebTokenResponse.ahk
#Include .\IWebTokenResponseFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Represents the response from a web account provider to a web token request.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.core.webtokenresponse
 * @namespace Windows.Security.Authentication.Web.Core
 * @version WindowsRuntime 1.4
 */
class WebTokenResponse extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWebTokenResponse

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWebTokenResponse.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes a new instance of the [WebTokenResponse](webtokenresponse.md) class with one input.
     * @param {HSTRING} token The token.
     * @returns {WebTokenResponse} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.core.webtokenresponse.#ctor
     */
    static CreateWithToken(token) {
        if (!WebTokenResponse.HasProp("__IWebTokenResponseFactory")) {
            activatableClassId := HSTRING.Create("Windows.Security.Authentication.Web.Core.WebTokenResponse")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebTokenResponseFactory.IID)
            WebTokenResponse.__IWebTokenResponseFactory := IWebTokenResponseFactory(factoryPtr)
        }

        return WebTokenResponse.__IWebTokenResponseFactory.CreateWithToken(token)
    }

    /**
     * Initializes a new instance of the [WebTokenResponse](webtokenresponse.md) class with two inputs.
     * @param {HSTRING} token The token.
     * @param {WebAccount} webAccount_ The [WebAccount](../windows.security.credentials/webaccount.md).
     * @returns {WebTokenResponse} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.core.webtokenresponse.#ctor
     */
    static CreateWithTokenAndAccount(token, webAccount_) {
        if (!WebTokenResponse.HasProp("__IWebTokenResponseFactory")) {
            activatableClassId := HSTRING.Create("Windows.Security.Authentication.Web.Core.WebTokenResponse")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebTokenResponseFactory.IID)
            WebTokenResponse.__IWebTokenResponseFactory := IWebTokenResponseFactory(factoryPtr)
        }

        return WebTokenResponse.__IWebTokenResponseFactory.CreateWithTokenAndAccount(token, webAccount_)
    }

    /**
     * Initializes a new instance of the [WebTokenResponse](webtokenresponse.md) class with three inputs.
     * @param {HSTRING} token The token.
     * @param {WebAccount} webAccount_ The [WebAccount](../windows.security.credentials/webaccount.md).
     * @param {WebProviderError} error The web provider error.
     * @returns {WebTokenResponse} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.core.webtokenresponse.#ctor
     */
    static CreateWithTokenAccountAndError(token, webAccount_, error) {
        if (!WebTokenResponse.HasProp("__IWebTokenResponseFactory")) {
            activatableClassId := HSTRING.Create("Windows.Security.Authentication.Web.Core.WebTokenResponse")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebTokenResponseFactory.IID)
            WebTokenResponse.__IWebTokenResponseFactory := IWebTokenResponseFactory(factoryPtr)
        }

        return WebTokenResponse.__IWebTokenResponseFactory.CreateWithTokenAccountAndError(token, webAccount_, error)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the authentication token.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.core.webtokenresponse.token
     * @type {HSTRING} 
     */
    Token {
        get => this.get_Token()
    }

    /**
     * Gets the error returned by the provider, if any.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.core.webtokenresponse.providererror
     * @type {WebProviderError} 
     */
    ProviderError {
        get => this.get_ProviderError()
    }

    /**
     * Gets the web account for the request.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.core.webtokenresponse.webaccount
     * @type {WebAccount} 
     */
    WebAccount {
        get => this.get_WebAccount()
    }

    /**
     * Gets the properties of the response
     * @remarks
     * The properties of a web token response are specific to individual providers. For more information on how to use them, consult the provider's documentation.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.core.webtokenresponse.properties
     * @type {IMap<HSTRING, HSTRING>} 
     */
    Properties {
        get => this.get_Properties()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [WebTokenResponse](webtokenresponse.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Security.Authentication.Web.Core.WebTokenResponse")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Token() {
        if (!this.HasProp("__IWebTokenResponse")) {
            if ((queryResult := this.QueryInterface(IWebTokenResponse.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebTokenResponse := IWebTokenResponse(outPtr)
        }

        return this.__IWebTokenResponse.get_Token()
    }

    /**
     * 
     * @returns {WebProviderError} 
     */
    get_ProviderError() {
        if (!this.HasProp("__IWebTokenResponse")) {
            if ((queryResult := this.QueryInterface(IWebTokenResponse.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebTokenResponse := IWebTokenResponse(outPtr)
        }

        return this.__IWebTokenResponse.get_ProviderError()
    }

    /**
     * 
     * @returns {WebAccount} 
     */
    get_WebAccount() {
        if (!this.HasProp("__IWebTokenResponse")) {
            if ((queryResult := this.QueryInterface(IWebTokenResponse.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebTokenResponse := IWebTokenResponse(outPtr)
        }

        return this.__IWebTokenResponse.get_WebAccount()
    }

    /**
     * 
     * @returns {IMap<HSTRING, HSTRING>} 
     */
    get_Properties() {
        if (!this.HasProp("__IWebTokenResponse")) {
            if ((queryResult := this.QueryInterface(IWebTokenResponse.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebTokenResponse := IWebTokenResponse(outPtr)
        }

        return this.__IWebTokenResponse.get_Properties()
    }

;@endregion Instance Methods
}

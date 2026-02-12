#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWebAuthenticationTransferTokenRequest.ahk
#Include .\IWebAuthenticationTransferTokenRequestFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * The request data for a web authentication operation that includes a transfer token.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.core.webauthenticationtransfertokenrequest
 * @namespace Windows.Security.Authentication.Web.Core
 * @version WindowsRuntime 1.4
 */
class WebAuthenticationTransferTokenRequest extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWebAuthenticationTransferTokenRequest

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWebAuthenticationTransferTokenRequest.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes a new instance of the [WebAuthenticationTransferTokenRequest](webauthenticationtransfertokenrequest.md) class.
     * @param {WebAccountProvider} provider The [WebAccountProvider](../windows.security.credentials/webaccountprovider.md) object that specifies the account provider.
     * @param {HSTRING} transferToken The transfer token blob.
     * @returns {WebAuthenticationTransferTokenRequest} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.core.webauthenticationtransfertokenrequest.#ctor
     */
    static Create(provider, transferToken) {
        if (!WebAuthenticationTransferTokenRequest.HasProp("__IWebAuthenticationTransferTokenRequestFactory")) {
            activatableClassId := HSTRING.Create("Windows.Security.Authentication.Web.Core.WebAuthenticationTransferTokenRequest")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebAuthenticationTransferTokenRequestFactory.IID)
            WebAuthenticationTransferTokenRequest.__IWebAuthenticationTransferTokenRequestFactory := IWebAuthenticationTransferTokenRequestFactory(factoryPtr)
        }

        return WebAuthenticationTransferTokenRequest.__IWebAuthenticationTransferTokenRequestFactory.Create(provider, transferToken)
    }

    /**
     * Initializes a new instance of the [WebAuthenticationTransferTokenRequest](webauthenticationtransfertokenrequest.md) class.
     * @param {WebAccountProvider} provider The [WebAccountProvider](../windows.security.credentials/webaccountprovider.md) object that specifies the account provider.
     * @param {HSTRING} transferToken The transfer token blob.
     * @param {HSTRING} correlationId_ The correlation ID for the request.
     * @returns {WebAuthenticationTransferTokenRequest} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.core.webauthenticationtransfertokenrequest.#ctor
     */
    static CreateWithCorrelationId(provider, transferToken, correlationId_) {
        if (!WebAuthenticationTransferTokenRequest.HasProp("__IWebAuthenticationTransferTokenRequestFactory")) {
            activatableClassId := HSTRING.Create("Windows.Security.Authentication.Web.Core.WebAuthenticationTransferTokenRequest")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebAuthenticationTransferTokenRequestFactory.IID)
            WebAuthenticationTransferTokenRequest.__IWebAuthenticationTransferTokenRequestFactory := IWebAuthenticationTransferTokenRequestFactory(factoryPtr)
        }

        return WebAuthenticationTransferTokenRequest.__IWebAuthenticationTransferTokenRequestFactory.CreateWithCorrelationId(provider, transferToken, correlationId_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * A property to get the [WebAccountProvider](../windows.security.credentials/webaccountprovider.md) object that specifies the account authentication provider.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.core.webauthenticationtransfertokenrequest.webaccountprovider
     * @type {WebAccountProvider} 
     */
    WebAccountProvider {
        get => this.get_WebAccountProvider()
    }

    /**
     * Provides access to the transfer token blob.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.core.webauthenticationtransfertokenrequest.transfertoken
     * @type {HSTRING} 
     */
    TransferToken {
        get => this.get_TransferToken()
        set => this.put_TransferToken(value)
    }

    /**
     * A dictionary of properties for the request.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.core.webauthenticationtransfertokenrequest.properties
     * @type {IMap<HSTRING, HSTRING>} 
     */
    Properties {
        get => this.get_Properties()
    }

    /**
     * The correlation identifier for the request, a unique identifier used for tracking authentication-related requests.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.core.webauthenticationtransfertokenrequest.correlationid
     * @type {HSTRING} 
     */
    CorrelationId {
        get => this.get_CorrelationId()
        set => this.put_CorrelationId(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {WebAccountProvider} 
     */
    get_WebAccountProvider() {
        if (!this.HasProp("__IWebAuthenticationTransferTokenRequest")) {
            if ((queryResult := this.QueryInterface(IWebAuthenticationTransferTokenRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebAuthenticationTransferTokenRequest := IWebAuthenticationTransferTokenRequest(outPtr)
        }

        return this.__IWebAuthenticationTransferTokenRequest.get_WebAccountProvider()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_TransferToken() {
        if (!this.HasProp("__IWebAuthenticationTransferTokenRequest")) {
            if ((queryResult := this.QueryInterface(IWebAuthenticationTransferTokenRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebAuthenticationTransferTokenRequest := IWebAuthenticationTransferTokenRequest(outPtr)
        }

        return this.__IWebAuthenticationTransferTokenRequest.get_TransferToken()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_TransferToken(value) {
        if (!this.HasProp("__IWebAuthenticationTransferTokenRequest")) {
            if ((queryResult := this.QueryInterface(IWebAuthenticationTransferTokenRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebAuthenticationTransferTokenRequest := IWebAuthenticationTransferTokenRequest(outPtr)
        }

        return this.__IWebAuthenticationTransferTokenRequest.put_TransferToken(value)
    }

    /**
     * 
     * @returns {IMap<HSTRING, HSTRING>} 
     */
    get_Properties() {
        if (!this.HasProp("__IWebAuthenticationTransferTokenRequest")) {
            if ((queryResult := this.QueryInterface(IWebAuthenticationTransferTokenRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebAuthenticationTransferTokenRequest := IWebAuthenticationTransferTokenRequest(outPtr)
        }

        return this.__IWebAuthenticationTransferTokenRequest.get_Properties()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CorrelationId() {
        if (!this.HasProp("__IWebAuthenticationTransferTokenRequest")) {
            if ((queryResult := this.QueryInterface(IWebAuthenticationTransferTokenRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebAuthenticationTransferTokenRequest := IWebAuthenticationTransferTokenRequest(outPtr)
        }

        return this.__IWebAuthenticationTransferTokenRequest.get_CorrelationId()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_CorrelationId(value) {
        if (!this.HasProp("__IWebAuthenticationTransferTokenRequest")) {
            if ((queryResult := this.QueryInterface(IWebAuthenticationTransferTokenRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebAuthenticationTransferTokenRequest := IWebAuthenticationTransferTokenRequest(outPtr)
        }

        return this.__IWebAuthenticationTransferTokenRequest.put_CorrelationId(value)
    }

;@endregion Instance Methods
}

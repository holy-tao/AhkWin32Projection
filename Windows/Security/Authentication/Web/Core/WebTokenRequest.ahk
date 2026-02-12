#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWebTokenRequest.ahk
#Include .\IWebTokenRequest2.ahk
#Include .\IWebTokenRequest3.ahk
#Include .\IWebTokenRequestFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Represents a request to an online identity provider for an authentication token.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.core.webtokenrequest
 * @namespace Windows.Security.Authentication.Web.Core
 * @version WindowsRuntime 1.4
 */
class WebTokenRequest extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWebTokenRequest

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWebTokenRequest.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes a new instance of the [WebTokenRequest](webtokenrequest.md) class with three inputs.
     * @param {WebAccountProvider} provider The web account provider the request is for.
     * @param {HSTRING} scope The scope of the request.
     * @param {HSTRING} clientId The client ID.
     * @returns {WebTokenRequest} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.core.webtokenrequest.#ctor
     */
    static Create(provider, scope, clientId) {
        if (!WebTokenRequest.HasProp("__IWebTokenRequestFactory")) {
            activatableClassId := HSTRING.Create("Windows.Security.Authentication.Web.Core.WebTokenRequest")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebTokenRequestFactory.IID)
            WebTokenRequest.__IWebTokenRequestFactory := IWebTokenRequestFactory(factoryPtr)
        }

        return WebTokenRequest.__IWebTokenRequestFactory.Create(provider, scope, clientId)
    }

    /**
     * Initializes a new instance of the [WebTokenRequest](webtokenrequest.md) class with four inputs.
     * @param {WebAccountProvider} provider The web account provider the request is for.
     * @param {HSTRING} scope The scope of the request.
     * @param {HSTRING} clientId The client ID.
     * @param {Integer} promptType The request prompt type.
     * @returns {WebTokenRequest} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.core.webtokenrequest.#ctor
     */
    static CreateWithPromptType(provider, scope, clientId, promptType) {
        if (!WebTokenRequest.HasProp("__IWebTokenRequestFactory")) {
            activatableClassId := HSTRING.Create("Windows.Security.Authentication.Web.Core.WebTokenRequest")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebTokenRequestFactory.IID)
            WebTokenRequest.__IWebTokenRequestFactory := IWebTokenRequestFactory(factoryPtr)
        }

        return WebTokenRequest.__IWebTokenRequestFactory.CreateWithPromptType(provider, scope, clientId, promptType)
    }

    /**
     * Initializes a new instance of the [WebTokenRequest](webtokenrequest.md) class with one input.
     * @param {WebAccountProvider} provider The web account provider the request is for.
     * @returns {WebTokenRequest} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.core.webtokenrequest.#ctor
     */
    static CreateWithProvider(provider) {
        if (!WebTokenRequest.HasProp("__IWebTokenRequestFactory")) {
            activatableClassId := HSTRING.Create("Windows.Security.Authentication.Web.Core.WebTokenRequest")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebTokenRequestFactory.IID)
            WebTokenRequest.__IWebTokenRequestFactory := IWebTokenRequestFactory(factoryPtr)
        }

        return WebTokenRequest.__IWebTokenRequestFactory.CreateWithProvider(provider)
    }

    /**
     * Initializes a new instance of the [WebTokenRequest](webtokenrequest.md) class with two inputs.
     * @param {WebAccountProvider} provider The web account provider the request is for.
     * @param {HSTRING} scope The scope of the request.
     * @returns {WebTokenRequest} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.core.webtokenrequest.#ctor
     */
    static CreateWithScope(provider, scope) {
        if (!WebTokenRequest.HasProp("__IWebTokenRequestFactory")) {
            activatableClassId := HSTRING.Create("Windows.Security.Authentication.Web.Core.WebTokenRequest")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebTokenRequestFactory.IID)
            WebTokenRequest.__IWebTokenRequestFactory := IWebTokenRequestFactory(factoryPtr)
        }

        return WebTokenRequest.__IWebTokenRequestFactory.CreateWithScope(provider, scope)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the web account provider for the request.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.core.webtokenrequest.webaccountprovider
     * @type {WebAccountProvider} 
     */
    WebAccountProvider {
        get => this.get_WebAccountProvider()
    }

    /**
     * Gets the scope of the request.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.core.webtokenrequest.scope
     * @type {HSTRING} 
     */
    Scope {
        get => this.get_Scope()
    }

    /**
     * Gets the Id of the client making the request.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.core.webtokenrequest.clientid
     * @type {HSTRING} 
     */
    ClientId {
        get => this.get_ClientId()
    }

    /**
     * Gets the prompt type of the request.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.core.webtokenrequest.prompttype
     * @type {Integer} 
     */
    PromptType {
        get => this.get_PromptType()
    }

    /**
     * Gets the properties of the request.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.core.webtokenrequest.properties
     * @type {IMap<HSTRING, HSTRING>} 
     */
    Properties {
        get => this.get_Properties()
    }

    /**
     * Gets the app properties of the request.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.core.webtokenrequest.appproperties
     * @type {IMap<HSTRING, HSTRING>} 
     */
    AppProperties {
        get => this.get_AppProperties()
    }

    /**
     * Gets and sets a correlation Id, a unique identifier used for tracking authentication-related requests.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.core.webtokenrequest.correlationid
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
        if (!this.HasProp("__IWebTokenRequest")) {
            if ((queryResult := this.QueryInterface(IWebTokenRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebTokenRequest := IWebTokenRequest(outPtr)
        }

        return this.__IWebTokenRequest.get_WebAccountProvider()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Scope() {
        if (!this.HasProp("__IWebTokenRequest")) {
            if ((queryResult := this.QueryInterface(IWebTokenRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebTokenRequest := IWebTokenRequest(outPtr)
        }

        return this.__IWebTokenRequest.get_Scope()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ClientId() {
        if (!this.HasProp("__IWebTokenRequest")) {
            if ((queryResult := this.QueryInterface(IWebTokenRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebTokenRequest := IWebTokenRequest(outPtr)
        }

        return this.__IWebTokenRequest.get_ClientId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PromptType() {
        if (!this.HasProp("__IWebTokenRequest")) {
            if ((queryResult := this.QueryInterface(IWebTokenRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebTokenRequest := IWebTokenRequest(outPtr)
        }

        return this.__IWebTokenRequest.get_PromptType()
    }

    /**
     * 
     * @returns {IMap<HSTRING, HSTRING>} 
     */
    get_Properties() {
        if (!this.HasProp("__IWebTokenRequest")) {
            if ((queryResult := this.QueryInterface(IWebTokenRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebTokenRequest := IWebTokenRequest(outPtr)
        }

        return this.__IWebTokenRequest.get_Properties()
    }

    /**
     * 
     * @returns {IMap<HSTRING, HSTRING>} 
     */
    get_AppProperties() {
        if (!this.HasProp("__IWebTokenRequest2")) {
            if ((queryResult := this.QueryInterface(IWebTokenRequest2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebTokenRequest2 := IWebTokenRequest2(outPtr)
        }

        return this.__IWebTokenRequest2.get_AppProperties()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CorrelationId() {
        if (!this.HasProp("__IWebTokenRequest3")) {
            if ((queryResult := this.QueryInterface(IWebTokenRequest3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebTokenRequest3 := IWebTokenRequest3(outPtr)
        }

        return this.__IWebTokenRequest3.get_CorrelationId()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_CorrelationId(value) {
        if (!this.HasProp("__IWebTokenRequest3")) {
            if ((queryResult := this.QueryInterface(IWebTokenRequest3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebTokenRequest3 := IWebTokenRequest3(outPtr)
        }

        return this.__IWebTokenRequest3.put_CorrelationId(value)
    }

;@endregion Instance Methods
}

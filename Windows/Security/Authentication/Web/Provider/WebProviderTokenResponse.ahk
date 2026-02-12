#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWebProviderTokenResponse.ahk
#Include .\IWebProviderTokenResponseFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Represents a web provider token response.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.provider.webprovidertokenresponse
 * @namespace Windows.Security.Authentication.Web.Provider
 * @version WindowsRuntime 1.4
 */
class WebProviderTokenResponse extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWebProviderTokenResponse

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWebProviderTokenResponse.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a new instance of the [WebProviderTokenResponse](webprovidertokenresponse.md) class.
     * @param {WebTokenResponse} webTokenResponse_ The web token response from the client.
     * @returns {WebProviderTokenResponse} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.provider.webprovidertokenresponse.#ctor
     */
    static Create(webTokenResponse_) {
        if (!WebProviderTokenResponse.HasProp("__IWebProviderTokenResponseFactory")) {
            activatableClassId := HSTRING.Create("Windows.Security.Authentication.Web.Provider.WebProviderTokenResponse")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebProviderTokenResponseFactory.IID)
            WebProviderTokenResponse.__IWebProviderTokenResponseFactory := IWebProviderTokenResponseFactory(factoryPtr)
        }

        return WebProviderTokenResponse.__IWebProviderTokenResponseFactory.Create(webTokenResponse_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the response from the provider to the client.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.provider.webprovidertokenresponse.clientresponse
     * @type {WebTokenResponse} 
     */
    ClientResponse {
        get => this.get_ClientResponse()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {WebTokenResponse} 
     */
    get_ClientResponse() {
        if (!this.HasProp("__IWebProviderTokenResponse")) {
            if ((queryResult := this.QueryInterface(IWebProviderTokenResponse.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebProviderTokenResponse := IWebProviderTokenResponse(outPtr)
        }

        return this.__IWebProviderTokenResponse.get_ClientResponse()
    }

;@endregion Instance Methods
}

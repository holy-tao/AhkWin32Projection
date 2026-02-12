#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWebProviderTokenRequest.ahk
#Include .\IWebProviderTokenRequest2.ahk
#Include .\IWebProviderTokenRequest3.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Represents a request for a token from a client to a provider.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.provider.webprovidertokenrequest
 * @namespace Windows.Security.Authentication.Web.Provider
 * @version WindowsRuntime 1.4
 */
class WebProviderTokenRequest extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWebProviderTokenRequest

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWebProviderTokenRequest.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the web token request made by the client.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.provider.webprovidertokenrequest.clientrequest
     * @type {WebTokenRequest} 
     */
    ClientRequest {
        get => this.get_ClientRequest()
    }

    /**
     * Gets the web accounts for the request.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.provider.webprovidertokenrequest.webaccounts
     * @type {IVectorView<WebAccount>} 
     */
    WebAccounts {
        get => this.get_WebAccounts()
    }

    /**
     * Gets the web account selection options.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.provider.webprovidertokenrequest.webaccountselectionoptions
     * @type {Integer} 
     */
    WebAccountSelectionOptions {
        get => this.get_WebAccountSelectionOptions()
    }

    /**
     * Gets the app callback Uri.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.provider.webprovidertokenrequest.applicationcallbackuri
     * @type {Uri} 
     */
    ApplicationCallbackUri {
        get => this.get_ApplicationCallbackUri()
    }

    /**
     * Gets the package family name of the calling application.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.provider.webprovidertokenrequest.applicationpackagefamilyname
     * @type {HSTRING} 
     */
    ApplicationPackageFamilyName {
        get => this.get_ApplicationPackageFamilyName()
    }

    /**
     * Gets the process name of the calling application.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.provider.webprovidertokenrequest.applicationprocessname
     * @type {HSTRING} 
     */
    ApplicationProcessName {
        get => this.get_ApplicationProcessName()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {WebTokenRequest} 
     */
    get_ClientRequest() {
        if (!this.HasProp("__IWebProviderTokenRequest")) {
            if ((queryResult := this.QueryInterface(IWebProviderTokenRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebProviderTokenRequest := IWebProviderTokenRequest(outPtr)
        }

        return this.__IWebProviderTokenRequest.get_ClientRequest()
    }

    /**
     * 
     * @returns {IVectorView<WebAccount>} 
     */
    get_WebAccounts() {
        if (!this.HasProp("__IWebProviderTokenRequest")) {
            if ((queryResult := this.QueryInterface(IWebProviderTokenRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebProviderTokenRequest := IWebProviderTokenRequest(outPtr)
        }

        return this.__IWebProviderTokenRequest.get_WebAccounts()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_WebAccountSelectionOptions() {
        if (!this.HasProp("__IWebProviderTokenRequest")) {
            if ((queryResult := this.QueryInterface(IWebProviderTokenRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebProviderTokenRequest := IWebProviderTokenRequest(outPtr)
        }

        return this.__IWebProviderTokenRequest.get_WebAccountSelectionOptions()
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_ApplicationCallbackUri() {
        if (!this.HasProp("__IWebProviderTokenRequest")) {
            if ((queryResult := this.QueryInterface(IWebProviderTokenRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebProviderTokenRequest := IWebProviderTokenRequest(outPtr)
        }

        return this.__IWebProviderTokenRequest.get_ApplicationCallbackUri()
    }

    /**
     * Gets a token binding key for the app asynchronously.
     * @param {Integer} keyType The type of key to get.
     * @param {Uri} target The target Uri.
     * @returns {IAsyncOperation<CryptographicKey>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.provider.webprovidertokenrequest.getapplicationtokenbindingkeyasync
     */
    GetApplicationTokenBindingKeyAsync(keyType, target) {
        if (!this.HasProp("__IWebProviderTokenRequest")) {
            if ((queryResult := this.QueryInterface(IWebProviderTokenRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebProviderTokenRequest := IWebProviderTokenRequest(outPtr)
        }

        return this.__IWebProviderTokenRequest.GetApplicationTokenBindingKeyAsync(keyType, target)
    }

    /**
     * Gets an app token binding key Id.
     * @param {Integer} keyType The type of token binding key.
     * @param {Uri} target The target Uri for the key.
     * @returns {IAsyncOperation<IBuffer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.provider.webprovidertokenrequest.getapplicationtokenbindingkeyidasync
     */
    GetApplicationTokenBindingKeyIdAsync(keyType, target) {
        if (!this.HasProp("__IWebProviderTokenRequest2")) {
            if ((queryResult := this.QueryInterface(IWebProviderTokenRequest2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebProviderTokenRequest2 := IWebProviderTokenRequest2(outPtr)
        }

        return this.__IWebProviderTokenRequest2.GetApplicationTokenBindingKeyIdAsync(keyType, target)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ApplicationPackageFamilyName() {
        if (!this.HasProp("__IWebProviderTokenRequest3")) {
            if ((queryResult := this.QueryInterface(IWebProviderTokenRequest3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebProviderTokenRequest3 := IWebProviderTokenRequest3(outPtr)
        }

        return this.__IWebProviderTokenRequest3.get_ApplicationPackageFamilyName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ApplicationProcessName() {
        if (!this.HasProp("__IWebProviderTokenRequest3")) {
            if ((queryResult := this.QueryInterface(IWebProviderTokenRequest3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebProviderTokenRequest3 := IWebProviderTokenRequest3(outPtr)
        }

        return this.__IWebProviderTokenRequest3.get_ApplicationProcessName()
    }

    /**
     * Determines if the calling application fulfills a given SSO capability.
     * @param {HSTRING} capabilityName The name of the capability to check for.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.provider.webprovidertokenrequest.checkapplicationforcapabilityasync
     */
    CheckApplicationForCapabilityAsync(capabilityName) {
        if (!this.HasProp("__IWebProviderTokenRequest3")) {
            if ((queryResult := this.QueryInterface(IWebProviderTokenRequest3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebProviderTokenRequest3 := IWebProviderTokenRequest3(outPtr)
        }

        return this.__IWebProviderTokenRequest3.CheckApplicationForCapabilityAsync(capabilityName)
    }

;@endregion Instance Methods
}

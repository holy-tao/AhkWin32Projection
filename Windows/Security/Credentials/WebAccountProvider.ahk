#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWebAccountProvider.ahk
#Include .\IWebAccountProvider2.ahk
#Include .\IWebAccountProvider3.ahk
#Include .\IWebAccountProvider4.ahk
#Include .\IWebAccountProviderFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a web account authentication provider.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.credentials.webaccountprovider
 * @namespace Windows.Security.Credentials
 * @version WindowsRuntime 1.4
 */
class WebAccountProvider extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWebAccountProvider

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWebAccountProvider.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates an instance of the [WebAccountProvider](webaccountprovider.md) class.
     * @param {HSTRING} id The web account provider id.
     * @param {HSTRING} displayName The display name for the web account provider.
     * @param {Uri} iconUri The [Uri](../windows.foundation/uri.md) of the icon image to display for the web account provider.
     * @returns {WebAccountProvider} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.credentials.webaccountprovider.#ctor
     */
    static CreateWebAccountProvider(id, displayName, iconUri) {
        if (!WebAccountProvider.HasProp("__IWebAccountProviderFactory")) {
            activatableClassId := HSTRING.Create("Windows.Security.Credentials.WebAccountProvider")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebAccountProviderFactory.IID)
            WebAccountProvider.__IWebAccountProviderFactory := IWebAccountProviderFactory(factoryPtr)
        }

        return WebAccountProvider.__IWebAccountProviderFactory.CreateWebAccountProvider(id, displayName, iconUri)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the web account provider id.
     * @see https://learn.microsoft.com/uwp/api/windows.security.credentials.webaccountprovider.id
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * Gets the display name for the web account provider.
     * @see https://learn.microsoft.com/uwp/api/windows.security.credentials.webaccountprovider.displayname
     * @type {HSTRING} 
     */
    DisplayName {
        get => this.get_DisplayName()
    }

    /**
     * Gets the [Uri](../windows.foundation/uri.md) of the icon image to display for the web account provider.
     * @see https://learn.microsoft.com/uwp/api/windows.security.credentials.webaccountprovider.iconuri
     * @type {Uri} 
     */
    IconUri {
        get => this.get_IconUri()
    }

    /**
     * Gets the display purpose of the web account provider.
     * @see https://learn.microsoft.com/uwp/api/windows.security.credentials.webaccountprovider.displaypurpose
     * @type {HSTRING} 
     */
    DisplayPurpose {
        get => this.get_DisplayPurpose()
    }

    /**
     * Gets the authority of the web account provider. Use authority to disambiguate between a single provider with multiple identities (such as a Microsoft account versus Microsoft Entra ID).
     * @see https://learn.microsoft.com/uwp/api/windows.security.credentials.webaccountprovider.authority
     * @type {HSTRING} 
     */
    Authority {
        get => this.get_Authority()
    }

    /**
     * Gets the user associated with the provider.
     * @see https://learn.microsoft.com/uwp/api/windows.security.credentials.webaccountprovider.user
     * @type {User} 
     */
    User {
        get => this.get_User()
    }

    /**
     * Gets the value describing whether the given ID provider supports system-wide authentication tokens.
     * @remarks
     * The device token feature is intended for cases in which a service needs to connect to cloud resources before a user ever signs into the device (for example, in out-of-box experiences where there are System Center Configuration Manager (SCCM) policies that must be applied right away). Only first-party ID providers (Xbox, MSA, AAD) allow device-wide tokens; other ID providers do not.
     * @see https://learn.microsoft.com/uwp/api/windows.security.credentials.webaccountprovider.issystemprovider
     * @type {Boolean} 
     */
    IsSystemProvider {
        get => this.get_IsSystemProvider()
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
    get_Id() {
        if (!this.HasProp("__IWebAccountProvider")) {
            if ((queryResult := this.QueryInterface(IWebAccountProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebAccountProvider := IWebAccountProvider(outPtr)
        }

        return this.__IWebAccountProvider.get_Id()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayName() {
        if (!this.HasProp("__IWebAccountProvider")) {
            if ((queryResult := this.QueryInterface(IWebAccountProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebAccountProvider := IWebAccountProvider(outPtr)
        }

        return this.__IWebAccountProvider.get_DisplayName()
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_IconUri() {
        if (!this.HasProp("__IWebAccountProvider")) {
            if ((queryResult := this.QueryInterface(IWebAccountProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebAccountProvider := IWebAccountProvider(outPtr)
        }

        return this.__IWebAccountProvider.get_IconUri()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayPurpose() {
        if (!this.HasProp("__IWebAccountProvider2")) {
            if ((queryResult := this.QueryInterface(IWebAccountProvider2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebAccountProvider2 := IWebAccountProvider2(outPtr)
        }

        return this.__IWebAccountProvider2.get_DisplayPurpose()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Authority() {
        if (!this.HasProp("__IWebAccountProvider2")) {
            if ((queryResult := this.QueryInterface(IWebAccountProvider2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebAccountProvider2 := IWebAccountProvider2(outPtr)
        }

        return this.__IWebAccountProvider2.get_Authority()
    }

    /**
     * 
     * @returns {User} 
     */
    get_User() {
        if (!this.HasProp("__IWebAccountProvider3")) {
            if ((queryResult := this.QueryInterface(IWebAccountProvider3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebAccountProvider3 := IWebAccountProvider3(outPtr)
        }

        return this.__IWebAccountProvider3.get_User()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSystemProvider() {
        if (!this.HasProp("__IWebAccountProvider4")) {
            if ((queryResult := this.QueryInterface(IWebAccountProvider4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebAccountProvider4 := IWebAccountProvider4(outPtr)
        }

        return this.__IWebAccountProvider4.get_IsSystemProvider()
    }

;@endregion Instance Methods
}

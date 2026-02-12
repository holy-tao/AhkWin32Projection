#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppBroadcastPlugIn.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides information about the app broadcast plugin.
  * 
  * > [!NOTE]
  * > This API requires the **appBroadcast** and **appBroadcastSettings** capability which is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastplugin
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class AppBroadcastPlugIn extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppBroadcastPlugIn

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppBroadcastPlugIn.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the unique ID of the app associated with the app broadcast plugin.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastplugin.appid
     * @type {HSTRING} 
     */
    AppId {
        get => this.get_AppId()
    }

    /**
     * Gets an object representing the provider settings for the app broadcast plugin.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastplugin.providersettings
     * @type {AppBroadcastProviderSettings} 
     */
    ProviderSettings {
        get => this.get_ProviderSettings()
    }

    /**
     * Gets a stream containing the logo image of the app broadcast plugin.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastplugin.logo
     * @type {IRandomAccessStreamReference} 
     */
    Logo {
        get => this.get_Logo()
    }

    /**
     * Gets the display name of the app broadcast plugin.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastplugin.displayname
     * @type {HSTRING} 
     */
    DisplayName {
        get => this.get_DisplayName()
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
    get_AppId() {
        if (!this.HasProp("__IAppBroadcastPlugIn")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastPlugIn.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastPlugIn := IAppBroadcastPlugIn(outPtr)
        }

        return this.__IAppBroadcastPlugIn.get_AppId()
    }

    /**
     * 
     * @returns {AppBroadcastProviderSettings} 
     */
    get_ProviderSettings() {
        if (!this.HasProp("__IAppBroadcastPlugIn")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastPlugIn.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastPlugIn := IAppBroadcastPlugIn(outPtr)
        }

        return this.__IAppBroadcastPlugIn.get_ProviderSettings()
    }

    /**
     * 
     * @returns {IRandomAccessStreamReference} 
     */
    get_Logo() {
        if (!this.HasProp("__IAppBroadcastPlugIn")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastPlugIn.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastPlugIn := IAppBroadcastPlugIn(outPtr)
        }

        return this.__IAppBroadcastPlugIn.get_Logo()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayName() {
        if (!this.HasProp("__IAppBroadcastPlugIn")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastPlugIn.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastPlugIn := IAppBroadcastPlugIn(outPtr)
        }

        return this.__IAppBroadcastPlugIn.get_DisplayName()
    }

;@endregion Instance Methods
}

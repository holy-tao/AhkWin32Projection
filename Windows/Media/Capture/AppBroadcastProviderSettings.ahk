#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppBroadcastProviderSettings.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides access to the settings of the remote broadcast provider service. These settings can be viewed and changed by the broadcast provider.
  * 
  * > [!NOTE]
  * > This API requires the **appBroadcast** and **appBroadcastSettings** capability which is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime.
 * @remarks
 * Get an instance of this class by calling [AppBroadcastManager.GetProviderSettings](appbroadcastmanager_getprovidersettings_921685894.md).
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastprovidersettings
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class AppBroadcastProviderSettings extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppBroadcastProviderSettings

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppBroadcastProviderSettings.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the default title for broadcasts.
     * @remarks
     * Set the title of the current broadcast by setting the [AppBroadcastBackgroundService.BroadcastTitle](appbroadcastbackgroundservice_broadcasttitle.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastprovidersettings.defaultbroadcasttitle
     * @type {HSTRING} 
     */
    DefaultBroadcastTitle {
        get => this.get_DefaultBroadcastTitle()
        set => this.put_DefaultBroadcastTitle(value)
    }

    /**
     * Gets or sets the audio encoding bitrate of the broadcast stream, in bits per second.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastprovidersettings.audioencodingbitrate
     * @type {Integer} 
     */
    AudioEncodingBitrate {
        get => this.get_AudioEncodingBitrate()
        set => this.put_AudioEncodingBitrate(value)
    }

    /**
     * Gets or sets a custom video encoding bitrate of the broadcast stream, in bits per second.
     * @remarks
     * If you specify a custom video encoding bitrate, you should set the [VideoEncodingBitrateMode](appbroadcastprovidersettings_videoencodingbitratemode.md) to [Custom](appbroadcastvideoencodingbitratemode.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastprovidersettings.customvideoencodingbitrate
     * @type {Integer} 
     */
    CustomVideoEncodingBitrate {
        get => this.get_CustomVideoEncodingBitrate()
        set => this.put_CustomVideoEncodingBitrate(value)
    }

    /**
     * Gets or sets a custom video encoding height of the broadcast stream.
     * @remarks
     * If you specify a custom video encoding height, you should set the [VideoEncodingResolutionMode](appbroadcastprovidersettings_videoencodingresolutionmode.md) to [Custom](appbroadcastvideoencodingresolutionmode.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastprovidersettings.customvideoencodingheight
     * @type {Integer} 
     */
    CustomVideoEncodingHeight {
        get => this.get_CustomVideoEncodingHeight()
        set => this.put_CustomVideoEncodingHeight(value)
    }

    /**
     * Gets or sets a custom video encoding width of the broadcast stream.
     * @remarks
     * If you specify a custom video encoding width, you should set the [VideoEncodingResolutionMode](appbroadcastprovidersettings_videoencodingresolutionmode.md) to [Custom](appbroadcastvideoencodingresolutionmode.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastprovidersettings.customvideoencodingwidth
     * @type {Integer} 
     */
    CustomVideoEncodingWidth {
        get => this.get_CustomVideoEncodingWidth()
        set => this.put_CustomVideoEncodingWidth(value)
    }

    /**
     * Gets or sets the video encoding bitrate mode for the remote broadcast provider service.
     * @remarks
     * If you set this value to [Custom](appbroadcastvideoencodingbitratemode.md), you should provide a value for the [CustomVideoEncodingBitrate](appbroadcastprovidersettings_customvideoencodingbitrate.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastprovidersettings.videoencodingbitratemode
     * @type {Integer} 
     */
    VideoEncodingBitrateMode {
        get => this.get_VideoEncodingBitrateMode()
        set => this.put_VideoEncodingBitrateMode(value)
    }

    /**
     * Gets or sets the video encoding resolution mode for the remote broadcast provider service.
     * @remarks
     * If you set this value to [Custom](appbroadcastvideoencodingbitratemode.md), you should provide a value for the [CustomVideoEncodingWidth](appbroadcastprovidersettings_customvideoencodingwidth.md) and [CustomVideoEncodingHeight](appbroadcastprovidersettings_customvideoencodingheight.md) properties.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastprovidersettings.videoencodingresolutionmode
     * @type {Integer} 
     */
    VideoEncodingResolutionMode {
        get => this.get_VideoEncodingResolutionMode()
        set => this.put_VideoEncodingResolutionMode(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_DefaultBroadcastTitle(value) {
        if (!this.HasProp("__IAppBroadcastProviderSettings")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastProviderSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastProviderSettings := IAppBroadcastProviderSettings(outPtr)
        }

        return this.__IAppBroadcastProviderSettings.put_DefaultBroadcastTitle(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DefaultBroadcastTitle() {
        if (!this.HasProp("__IAppBroadcastProviderSettings")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastProviderSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastProviderSettings := IAppBroadcastProviderSettings(outPtr)
        }

        return this.__IAppBroadcastProviderSettings.get_DefaultBroadcastTitle()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_AudioEncodingBitrate(value) {
        if (!this.HasProp("__IAppBroadcastProviderSettings")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastProviderSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastProviderSettings := IAppBroadcastProviderSettings(outPtr)
        }

        return this.__IAppBroadcastProviderSettings.put_AudioEncodingBitrate(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AudioEncodingBitrate() {
        if (!this.HasProp("__IAppBroadcastProviderSettings")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastProviderSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastProviderSettings := IAppBroadcastProviderSettings(outPtr)
        }

        return this.__IAppBroadcastProviderSettings.get_AudioEncodingBitrate()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_CustomVideoEncodingBitrate(value) {
        if (!this.HasProp("__IAppBroadcastProviderSettings")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastProviderSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastProviderSettings := IAppBroadcastProviderSettings(outPtr)
        }

        return this.__IAppBroadcastProviderSettings.put_CustomVideoEncodingBitrate(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CustomVideoEncodingBitrate() {
        if (!this.HasProp("__IAppBroadcastProviderSettings")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastProviderSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastProviderSettings := IAppBroadcastProviderSettings(outPtr)
        }

        return this.__IAppBroadcastProviderSettings.get_CustomVideoEncodingBitrate()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_CustomVideoEncodingHeight(value) {
        if (!this.HasProp("__IAppBroadcastProviderSettings")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastProviderSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastProviderSettings := IAppBroadcastProviderSettings(outPtr)
        }

        return this.__IAppBroadcastProviderSettings.put_CustomVideoEncodingHeight(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CustomVideoEncodingHeight() {
        if (!this.HasProp("__IAppBroadcastProviderSettings")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastProviderSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastProviderSettings := IAppBroadcastProviderSettings(outPtr)
        }

        return this.__IAppBroadcastProviderSettings.get_CustomVideoEncodingHeight()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_CustomVideoEncodingWidth(value) {
        if (!this.HasProp("__IAppBroadcastProviderSettings")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastProviderSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastProviderSettings := IAppBroadcastProviderSettings(outPtr)
        }

        return this.__IAppBroadcastProviderSettings.put_CustomVideoEncodingWidth(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CustomVideoEncodingWidth() {
        if (!this.HasProp("__IAppBroadcastProviderSettings")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastProviderSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastProviderSettings := IAppBroadcastProviderSettings(outPtr)
        }

        return this.__IAppBroadcastProviderSettings.get_CustomVideoEncodingWidth()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_VideoEncodingBitrateMode(value) {
        if (!this.HasProp("__IAppBroadcastProviderSettings")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastProviderSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastProviderSettings := IAppBroadcastProviderSettings(outPtr)
        }

        return this.__IAppBroadcastProviderSettings.put_VideoEncodingBitrateMode(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_VideoEncodingBitrateMode() {
        if (!this.HasProp("__IAppBroadcastProviderSettings")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastProviderSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastProviderSettings := IAppBroadcastProviderSettings(outPtr)
        }

        return this.__IAppBroadcastProviderSettings.get_VideoEncodingBitrateMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_VideoEncodingResolutionMode(value) {
        if (!this.HasProp("__IAppBroadcastProviderSettings")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastProviderSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastProviderSettings := IAppBroadcastProviderSettings(outPtr)
        }

        return this.__IAppBroadcastProviderSettings.put_VideoEncodingResolutionMode(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_VideoEncodingResolutionMode() {
        if (!this.HasProp("__IAppBroadcastProviderSettings")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastProviderSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastProviderSettings := IAppBroadcastProviderSettings(outPtr)
        }

        return this.__IAppBroadcastProviderSettings.get_VideoEncodingResolutionMode()
    }

;@endregion Instance Methods
}

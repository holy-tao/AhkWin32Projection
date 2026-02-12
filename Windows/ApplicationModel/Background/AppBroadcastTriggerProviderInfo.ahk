#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppBroadcastTriggerProviderInfo.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides information about the application that is broadcasting gameplay such as its logo, display name, and video characteristics.
 * @remarks
 * > [!IMPORTANT]
 * > Only first-party applications should use this class.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.appbroadcasttriggerproviderinfo
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class AppBroadcastTriggerProviderInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppBroadcastTriggerProviderInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppBroadcastTriggerProviderInfo.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets and sets the resource location for the UI friendly name of the provider that is broadcasting gameplay.
     * @remarks
     * > [!IMPORTANT]
     * > Only first-party applications should use this property.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.appbroadcasttriggerproviderinfo.displaynameresource
     * @type {HSTRING} 
     */
    DisplayNameResource {
        get => this.get_DisplayNameResource()
        set => this.put_DisplayNameResource(value)
    }

    /**
     * Gets and sets the resource location of the logo of the provider that is broadcasting gameplay.
     * @remarks
     * > [!IMPORTANT]
     * > Only first-party applications should use this property.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.appbroadcasttriggerproviderinfo.logoresource
     * @type {HSTRING} 
     */
    LogoResource {
        get => this.get_LogoResource()
        set => this.put_LogoResource(value)
    }

    /**
     * Gets and sets the amount of time between video key frames.
     * @remarks
     * > [!IMPORTANT]
     * > Only first-party applications should use this property.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.appbroadcasttriggerproviderinfo.videokeyframeinterval
     * @type {TimeSpan} 
     */
    VideoKeyFrameInterval {
        get => this.get_VideoKeyFrameInterval()
        set => this.put_VideoKeyFrameInterval(value)
    }

    /**
     * Gets and sets the maximum bitrate that the provider that is broadcasting gameplay can provide.
     * @remarks
     * > [!IMPORTANT]
     * > Only first-party applications should use this property.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.appbroadcasttriggerproviderinfo.maxvideobitrate
     * @type {Integer} 
     */
    MaxVideoBitrate {
        get => this.get_MaxVideoBitrate()
        set => this.put_MaxVideoBitrate(value)
    }

    /**
     * Gets and sets the maximum video width that the gameplay broadcast provider supports.
     * @remarks
     * > [!IMPORTANT]
     * > Only first-party applications should use this property.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.appbroadcasttriggerproviderinfo.maxvideowidth
     * @type {Integer} 
     */
    MaxVideoWidth {
        get => this.get_MaxVideoWidth()
        set => this.put_MaxVideoWidth(value)
    }

    /**
     * Gets and sets the maximum video height that the gameplay broadcast provider supports.
     * @remarks
     * > [!IMPORTANT]
     * > Only first-party applications should use this property.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.appbroadcasttriggerproviderinfo.maxvideoheight
     * @type {Integer} 
     */
    MaxVideoHeight {
        get => this.get_MaxVideoHeight()
        set => this.put_MaxVideoHeight(value)
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
    put_DisplayNameResource(value) {
        if (!this.HasProp("__IAppBroadcastTriggerProviderInfo")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastTriggerProviderInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastTriggerProviderInfo := IAppBroadcastTriggerProviderInfo(outPtr)
        }

        return this.__IAppBroadcastTriggerProviderInfo.put_DisplayNameResource(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayNameResource() {
        if (!this.HasProp("__IAppBroadcastTriggerProviderInfo")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastTriggerProviderInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastTriggerProviderInfo := IAppBroadcastTriggerProviderInfo(outPtr)
        }

        return this.__IAppBroadcastTriggerProviderInfo.get_DisplayNameResource()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_LogoResource(value) {
        if (!this.HasProp("__IAppBroadcastTriggerProviderInfo")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastTriggerProviderInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastTriggerProviderInfo := IAppBroadcastTriggerProviderInfo(outPtr)
        }

        return this.__IAppBroadcastTriggerProviderInfo.put_LogoResource(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_LogoResource() {
        if (!this.HasProp("__IAppBroadcastTriggerProviderInfo")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastTriggerProviderInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastTriggerProviderInfo := IAppBroadcastTriggerProviderInfo(outPtr)
        }

        return this.__IAppBroadcastTriggerProviderInfo.get_LogoResource()
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_VideoKeyFrameInterval(value) {
        if (!this.HasProp("__IAppBroadcastTriggerProviderInfo")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastTriggerProviderInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastTriggerProviderInfo := IAppBroadcastTriggerProviderInfo(outPtr)
        }

        return this.__IAppBroadcastTriggerProviderInfo.put_VideoKeyFrameInterval(value)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_VideoKeyFrameInterval() {
        if (!this.HasProp("__IAppBroadcastTriggerProviderInfo")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastTriggerProviderInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastTriggerProviderInfo := IAppBroadcastTriggerProviderInfo(outPtr)
        }

        return this.__IAppBroadcastTriggerProviderInfo.get_VideoKeyFrameInterval()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_MaxVideoBitrate(value) {
        if (!this.HasProp("__IAppBroadcastTriggerProviderInfo")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastTriggerProviderInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastTriggerProviderInfo := IAppBroadcastTriggerProviderInfo(outPtr)
        }

        return this.__IAppBroadcastTriggerProviderInfo.put_MaxVideoBitrate(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxVideoBitrate() {
        if (!this.HasProp("__IAppBroadcastTriggerProviderInfo")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastTriggerProviderInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastTriggerProviderInfo := IAppBroadcastTriggerProviderInfo(outPtr)
        }

        return this.__IAppBroadcastTriggerProviderInfo.get_MaxVideoBitrate()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_MaxVideoWidth(value) {
        if (!this.HasProp("__IAppBroadcastTriggerProviderInfo")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastTriggerProviderInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastTriggerProviderInfo := IAppBroadcastTriggerProviderInfo(outPtr)
        }

        return this.__IAppBroadcastTriggerProviderInfo.put_MaxVideoWidth(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxVideoWidth() {
        if (!this.HasProp("__IAppBroadcastTriggerProviderInfo")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastTriggerProviderInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastTriggerProviderInfo := IAppBroadcastTriggerProviderInfo(outPtr)
        }

        return this.__IAppBroadcastTriggerProviderInfo.get_MaxVideoWidth()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_MaxVideoHeight(value) {
        if (!this.HasProp("__IAppBroadcastTriggerProviderInfo")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastTriggerProviderInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastTriggerProviderInfo := IAppBroadcastTriggerProviderInfo(outPtr)
        }

        return this.__IAppBroadcastTriggerProviderInfo.put_MaxVideoHeight(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxVideoHeight() {
        if (!this.HasProp("__IAppBroadcastTriggerProviderInfo")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastTriggerProviderInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastTriggerProviderInfo := IAppBroadcastTriggerProviderInfo(outPtr)
        }

        return this.__IAppBroadcastTriggerProviderInfo.get_MaxVideoHeight()
    }

;@endregion Instance Methods
}

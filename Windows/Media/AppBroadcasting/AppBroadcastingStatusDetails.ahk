#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppBroadcastingStatusDetails.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides detailed information indicating why the current app can't currently begin broadcasting.
 * @remarks
 * Get an instance of this class by accessing the [AppBroadcastingStatus.Details](appbroadcastingstatus_details.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.media.appbroadcasting.appbroadcastingstatusdetails
 * @namespace Windows.Media.AppBroadcasting
 * @version WindowsRuntime 1.4
 */
class AppBroadcastingStatusDetails extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppBroadcastingStatusDetails

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppBroadcastingStatusDetails.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value that indicates whether another app is currently broadcasting.
     * @remarks
     * The current app can't begin broadcasting while another app is broadcasting.
     * @see https://learn.microsoft.com/uwp/api/windows.media.appbroadcasting.appbroadcastingstatusdetails.isanyappbroadcasting
     * @type {Boolean} 
     */
    IsAnyAppBroadcasting {
        get => this.get_IsAnyAppBroadcasting()
    }

    /**
     * Gets a value indicating whether the capture resource is currently unavailable.
     * @see https://learn.microsoft.com/uwp/api/windows.media.appbroadcasting.appbroadcastingstatusdetails.iscaptureresourceunavailable
     * @type {Boolean} 
     */
    IsCaptureResourceUnavailable {
        get => this.get_IsCaptureResourceUnavailable()
    }

    /**
     * Gets a value that indicates if a game stream is currently in progress.
     * @see https://learn.microsoft.com/uwp/api/windows.media.appbroadcasting.appbroadcastingstatusdetails.isgamestreaminprogress
     * @type {Boolean} 
     */
    IsGameStreamInProgress {
        get => this.get_IsGameStreamInProgress()
    }

    /**
     * Gets a value that indicates whether app broadcasting is unavailable because the GPU is constrained.
     * @remarks
     * Typically, if this value is true, it means that the GPU software does not include an H264 encoder.
     * @see https://learn.microsoft.com/uwp/api/windows.media.appbroadcasting.appbroadcastingstatusdetails.isgpuconstrained
     * @type {Boolean} 
     */
    IsGpuConstrained {
        get => this.get_IsGpuConstrained()
    }

    /**
     * Gets a value specifying if the current app's window is inactive.
     * @remarks
     * An app can only begin broadcasting when its window is the currently active window.
     * @see https://learn.microsoft.com/uwp/api/windows.media.appbroadcasting.appbroadcastingstatusdetails.isappinactive
     * @type {Boolean} 
     */
    IsAppInactive {
        get => this.get_IsAppInactive()
    }

    /**
     * Gets a value indicating whether broadcasting is blocked for the current app.
     * @remarks
     * Use the [AppBroadcastingUi](appbroadcastingui.md) to show the broadcasting system setup UI.
     * @see https://learn.microsoft.com/uwp/api/windows.media.appbroadcasting.appbroadcastingstatusdetails.isblockedforapp
     * @type {Boolean} 
     */
    IsBlockedForApp {
        get => this.get_IsBlockedForApp()
    }

    /**
     * Gets a value indicating if app broadcasting has been disabled by the user.
     * @remarks
     * Use the [AppBroadcastingUI](appbroadcastingui.md) to show the broadcasting system setup UI.
     * @see https://learn.microsoft.com/uwp/api/windows.media.appbroadcasting.appbroadcastingstatusdetails.isdisabledbyuser
     * @type {Boolean} 
     */
    IsDisabledByUser {
        get => this.get_IsDisabledByUser()
    }

    /**
     * Gets a value indicating whether app broadcasting is disabled by the system.
     * @remarks
     * Use the [AppBroadcastingUI](appbroadcastingui.md) to show the broadcasting system setup UI.
     * @see https://learn.microsoft.com/uwp/api/windows.media.appbroadcasting.appbroadcastingstatusdetails.isdisabledbysystem
     * @type {Boolean} 
     */
    IsDisabledBySystem {
        get => this.get_IsDisabledBySystem()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsAnyAppBroadcasting() {
        if (!this.HasProp("__IAppBroadcastingStatusDetails")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastingStatusDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastingStatusDetails := IAppBroadcastingStatusDetails(outPtr)
        }

        return this.__IAppBroadcastingStatusDetails.get_IsAnyAppBroadcasting()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsCaptureResourceUnavailable() {
        if (!this.HasProp("__IAppBroadcastingStatusDetails")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastingStatusDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastingStatusDetails := IAppBroadcastingStatusDetails(outPtr)
        }

        return this.__IAppBroadcastingStatusDetails.get_IsCaptureResourceUnavailable()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsGameStreamInProgress() {
        if (!this.HasProp("__IAppBroadcastingStatusDetails")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastingStatusDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastingStatusDetails := IAppBroadcastingStatusDetails(outPtr)
        }

        return this.__IAppBroadcastingStatusDetails.get_IsGameStreamInProgress()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsGpuConstrained() {
        if (!this.HasProp("__IAppBroadcastingStatusDetails")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastingStatusDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastingStatusDetails := IAppBroadcastingStatusDetails(outPtr)
        }

        return this.__IAppBroadcastingStatusDetails.get_IsGpuConstrained()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsAppInactive() {
        if (!this.HasProp("__IAppBroadcastingStatusDetails")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastingStatusDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastingStatusDetails := IAppBroadcastingStatusDetails(outPtr)
        }

        return this.__IAppBroadcastingStatusDetails.get_IsAppInactive()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsBlockedForApp() {
        if (!this.HasProp("__IAppBroadcastingStatusDetails")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastingStatusDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastingStatusDetails := IAppBroadcastingStatusDetails(outPtr)
        }

        return this.__IAppBroadcastingStatusDetails.get_IsBlockedForApp()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDisabledByUser() {
        if (!this.HasProp("__IAppBroadcastingStatusDetails")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastingStatusDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastingStatusDetails := IAppBroadcastingStatusDetails(outPtr)
        }

        return this.__IAppBroadcastingStatusDetails.get_IsDisabledByUser()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDisabledBySystem() {
        if (!this.HasProp("__IAppBroadcastingStatusDetails")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastingStatusDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastingStatusDetails := IAppBroadcastingStatusDetails(outPtr)
        }

        return this.__IAppBroadcastingStatusDetails.get_IsDisabledBySystem()
    }

;@endregion Instance Methods
}

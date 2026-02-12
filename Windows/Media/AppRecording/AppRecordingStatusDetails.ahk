#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppRecordingStatusDetails.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides detailed information indicating why the current app can't currently begin recording app content by calling [StartRecordingToFileAsymc](apprecordingmanager_startrecordingtofileasync_706691331.md) or [RecordTimespanToFileAsymc](apprecordingmanager_recordtimespantofileasync_583577299.md).
 * @remarks
 * Get an instance of this class by accessing the [AppRecordingStatus.Details](apprecordingstatus_details.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.media.apprecording.apprecordingstatusdetails
 * @namespace Windows.Media.AppRecording
 * @version WindowsRuntime 1.4
 */
class AppRecordingStatusDetails extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppRecordingStatusDetails

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppRecordingStatusDetails.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value that indicates whether another app is currently broadcasting.
     * @remarks
     * The current app can't begin recording while another app is broadcasting.
     * @see https://learn.microsoft.com/uwp/api/windows.media.apprecording.apprecordingstatusdetails.isanyappbroadcasting
     * @type {Boolean} 
     */
    IsAnyAppBroadcasting {
        get => this.get_IsAnyAppBroadcasting()
    }

    /**
     * Gets a value indicating whether the capture resource is currently unavailable.
     * @see https://learn.microsoft.com/uwp/api/windows.media.apprecording.apprecordingstatusdetails.iscaptureresourceunavailable
     * @type {Boolean} 
     */
    IsCaptureResourceUnavailable {
        get => this.get_IsCaptureResourceUnavailable()
    }

    /**
     * Gets a value that indicates if a game stream is currently in progress.
     * @see https://learn.microsoft.com/uwp/api/windows.media.apprecording.apprecordingstatusdetails.isgamestreaminprogress
     * @type {Boolean} 
     */
    IsGameStreamInProgress {
        get => this.get_IsGameStreamInProgress()
    }

    /**
     * Gets a value specifying wether recording a specified timespan of app content with [RecordTimespanToFileAsymc](apprecordingmanager_recordtimespantofileasync_583577299.md) is disabled.
     * @see https://learn.microsoft.com/uwp/api/windows.media.apprecording.apprecordingstatusdetails.istimespanrecordingdisabled
     * @type {Boolean} 
     */
    IsTimeSpanRecordingDisabled {
        get => this.get_IsTimeSpanRecordingDisabled()
    }

    /**
     * Gets a value that indicates whether app recording is unavailable because the GPU is constrained.
     * @remarks
     * Typically, if this value is true, it means that the GPU software does not include an H264 encoder.
     * @see https://learn.microsoft.com/uwp/api/windows.media.apprecording.apprecordingstatusdetails.isgpuconstrained
     * @type {Boolean} 
     */
    IsGpuConstrained {
        get => this.get_IsGpuConstrained()
    }

    /**
     * Gets a value specifying if the current app's window is inactive.
     * @remarks
     * An app can only begin recording when its window is the currently active window.
     * @see https://learn.microsoft.com/uwp/api/windows.media.apprecording.apprecordingstatusdetails.isappinactive
     * @type {Boolean} 
     */
    IsAppInactive {
        get => this.get_IsAppInactive()
    }

    /**
     * Gets a value indicating whether app recording is blocked for the current app.
     * @see https://learn.microsoft.com/uwp/api/windows.media.apprecording.apprecordingstatusdetails.isblockedforapp
     * @type {Boolean} 
     */
    IsBlockedForApp {
        get => this.get_IsBlockedForApp()
    }

    /**
     * Gets a value indicating if app recording has been disabled by the user.
     * @see https://learn.microsoft.com/uwp/api/windows.media.apprecording.apprecordingstatusdetails.isdisabledbyuser
     * @type {Boolean} 
     */
    IsDisabledByUser {
        get => this.get_IsDisabledByUser()
    }

    /**
     * Gets a value indicating whether app recording is disabled by the system.
     * @see https://learn.microsoft.com/uwp/api/windows.media.apprecording.apprecordingstatusdetails.isdisabledbysystem
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
        if (!this.HasProp("__IAppRecordingStatusDetails")) {
            if ((queryResult := this.QueryInterface(IAppRecordingStatusDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppRecordingStatusDetails := IAppRecordingStatusDetails(outPtr)
        }

        return this.__IAppRecordingStatusDetails.get_IsAnyAppBroadcasting()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsCaptureResourceUnavailable() {
        if (!this.HasProp("__IAppRecordingStatusDetails")) {
            if ((queryResult := this.QueryInterface(IAppRecordingStatusDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppRecordingStatusDetails := IAppRecordingStatusDetails(outPtr)
        }

        return this.__IAppRecordingStatusDetails.get_IsCaptureResourceUnavailable()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsGameStreamInProgress() {
        if (!this.HasProp("__IAppRecordingStatusDetails")) {
            if ((queryResult := this.QueryInterface(IAppRecordingStatusDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppRecordingStatusDetails := IAppRecordingStatusDetails(outPtr)
        }

        return this.__IAppRecordingStatusDetails.get_IsGameStreamInProgress()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsTimeSpanRecordingDisabled() {
        if (!this.HasProp("__IAppRecordingStatusDetails")) {
            if ((queryResult := this.QueryInterface(IAppRecordingStatusDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppRecordingStatusDetails := IAppRecordingStatusDetails(outPtr)
        }

        return this.__IAppRecordingStatusDetails.get_IsTimeSpanRecordingDisabled()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsGpuConstrained() {
        if (!this.HasProp("__IAppRecordingStatusDetails")) {
            if ((queryResult := this.QueryInterface(IAppRecordingStatusDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppRecordingStatusDetails := IAppRecordingStatusDetails(outPtr)
        }

        return this.__IAppRecordingStatusDetails.get_IsGpuConstrained()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsAppInactive() {
        if (!this.HasProp("__IAppRecordingStatusDetails")) {
            if ((queryResult := this.QueryInterface(IAppRecordingStatusDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppRecordingStatusDetails := IAppRecordingStatusDetails(outPtr)
        }

        return this.__IAppRecordingStatusDetails.get_IsAppInactive()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsBlockedForApp() {
        if (!this.HasProp("__IAppRecordingStatusDetails")) {
            if ((queryResult := this.QueryInterface(IAppRecordingStatusDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppRecordingStatusDetails := IAppRecordingStatusDetails(outPtr)
        }

        return this.__IAppRecordingStatusDetails.get_IsBlockedForApp()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDisabledByUser() {
        if (!this.HasProp("__IAppRecordingStatusDetails")) {
            if ((queryResult := this.QueryInterface(IAppRecordingStatusDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppRecordingStatusDetails := IAppRecordingStatusDetails(outPtr)
        }

        return this.__IAppRecordingStatusDetails.get_IsDisabledByUser()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDisabledBySystem() {
        if (!this.HasProp("__IAppRecordingStatusDetails")) {
            if ((queryResult := this.QueryInterface(IAppRecordingStatusDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppRecordingStatusDetails := IAppRecordingStatusDetails(outPtr)
        }

        return this.__IAppRecordingStatusDetails.get_IsDisabledBySystem()
    }

;@endregion Instance Methods
}

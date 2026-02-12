#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppRecordingStatus.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides information about whether the current app is currently able to initiate an app recording by calling [StartRecordingToFileAsync](apprecordingmanager_startrecordingtofileasync_706691331.md) or [RecordTimespanToFileAsync](apprecordingmanager_recordtimespantofileasync_583577299.md), and if not, provides details about the reasons that app recording is unavailable.
 * @remarks
 * Get an instance of this class by calling [AppRecordingManager.GetStatus](apprecordingmanager_getstatus_169641651.md).
 * @see https://learn.microsoft.com/uwp/api/windows.media.apprecording.apprecordingstatus
 * @namespace Windows.Media.AppRecording
 * @version WindowsRuntime 1.4
 */
class AppRecordingStatus extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppRecordingStatus

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppRecordingStatus.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value that indicates whether the current app can currently record the audio and video content of the app by calling [StartRecordingToFileAsymc](apprecordingmanager_startrecordingtofileasync_706691331.md).
     * @remarks
     * If this value is false, check the [Details](apprecordingstatus_details.md) to get detailed information on why the app can't currently record.
     * @see https://learn.microsoft.com/uwp/api/windows.media.apprecording.apprecordingstatus.canrecord
     * @type {Boolean} 
     */
    CanRecord {
        get => this.get_CanRecord()
    }

    /**
     * Gets a value that indicates whether the current app can currently record a timespan of the audio and video content of the app by calling [RecordTimespanToFileAsync](apprecordingmanager_recordtimespantofileasync_583577299.md).
     * @remarks
     * If this value is false, check the [Details](apprecordingstatus_details.md) to get detailed information on why the app can't currently record a timspan.
     * @see https://learn.microsoft.com/uwp/api/windows.media.apprecording.apprecordingstatus.canrecordtimespan
     * @type {Boolean} 
     */
    CanRecordTimeSpan {
        get => this.get_CanRecordTimeSpan()
    }

    /**
     * Gets a value that indicates the duration of the historical app recording buffer.
     * @remarks
     * The timespan returned by this property specifies the allowed range of the *startTime* parameter to the [RecordTimespanToFileAsymc](apprecordingmanager_recordtimespantofileasync_583577299.md) method.
     * @see https://learn.microsoft.com/uwp/api/windows.media.apprecording.apprecordingstatus.historicalbufferduration
     * @type {TimeSpan} 
     */
    HistoricalBufferDuration {
        get => this.get_HistoricalBufferDuration()
    }

    /**
     * Gets an [AppRecordingStatusDetails](apprecordingstatusdetails.md) object that provides detailed information indicating why the current app can't currently begin recording.
     * @see https://learn.microsoft.com/uwp/api/windows.media.apprecording.apprecordingstatus.details
     * @type {AppRecordingStatusDetails} 
     */
    Details {
        get => this.get_Details()
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
    get_CanRecord() {
        if (!this.HasProp("__IAppRecordingStatus")) {
            if ((queryResult := this.QueryInterface(IAppRecordingStatus.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppRecordingStatus := IAppRecordingStatus(outPtr)
        }

        return this.__IAppRecordingStatus.get_CanRecord()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanRecordTimeSpan() {
        if (!this.HasProp("__IAppRecordingStatus")) {
            if ((queryResult := this.QueryInterface(IAppRecordingStatus.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppRecordingStatus := IAppRecordingStatus(outPtr)
        }

        return this.__IAppRecordingStatus.get_CanRecordTimeSpan()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_HistoricalBufferDuration() {
        if (!this.HasProp("__IAppRecordingStatus")) {
            if ((queryResult := this.QueryInterface(IAppRecordingStatus.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppRecordingStatus := IAppRecordingStatus(outPtr)
        }

        return this.__IAppRecordingStatus.get_HistoricalBufferDuration()
    }

    /**
     * 
     * @returns {AppRecordingStatusDetails} 
     */
    get_Details() {
        if (!this.HasProp("__IAppRecordingStatus")) {
            if ((queryResult := this.QueryInterface(IAppRecordingStatus.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppRecordingStatus := IAppRecordingStatus(outPtr)
        }

        return this.__IAppRecordingStatus.get_Details()
    }

;@endregion Instance Methods
}

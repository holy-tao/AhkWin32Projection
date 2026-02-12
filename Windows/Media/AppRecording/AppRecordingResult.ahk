#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppRecordingResult.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the results of an app recording operation started with a call to [RecordTimeSpanToFileAsync](apprecordingmanager_recordtimespantofileasync_583577299.md) or [StartRecordingToFileAsync](apprecordingmanager_startrecordingtofileasync_706691331.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.apprecording.apprecordingresult
 * @namespace Windows.Media.AppRecording
 * @version WindowsRuntime 1.4
 */
class AppRecordingResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppRecordingResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppRecordingResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value that indicates if the app recording operations succeeded.
     * @see https://learn.microsoft.com/uwp/api/windows.media.apprecording.apprecordingresult.succeeded
     * @type {Boolean} 
     */
    Succeeded {
        get => this.get_Succeeded()
    }

    /**
     * Gets the extended error code associated returned by the app recording operation.
     * @see https://learn.microsoft.com/uwp/api/windows.media.apprecording.apprecordingresult.extendederror
     * @type {HRESULT} 
     */
    ExtendedError {
        get => this.get_ExtendedError()
    }

    /**
     * Gets the duration of the recorded file.
     * @remarks
     * [RecordTimeSpanToFileAsync](apprecordingmanager_recordtimespantofileasync_583577299.md) allows you to specify a requested duration for the app recording, but it is possible a recording to complete successfully, but for a shorter duration than requested, such as if the allocated storage space for recordings is filled. Check the value of the [IsFileTruncated](apprecordingresult_isfiletruncated.md) property to determine if the file was truncated.
     * @see https://learn.microsoft.com/uwp/api/windows.media.apprecording.apprecordingresult.duration
     * @type {TimeSpan} 
     */
    Duration {
        get => this.get_Duration()
    }

    /**
     * Gets a value that indicates if the saved app recording was truncated.
     * @remarks
     * [RecordTimeSpanToFileAsync](apprecordingmanager_recordtimespantofileasync_583577299.md) allows you to specify a requested duration for the app recording, but it is possible a recording to complete successfully, but for a shorter duration than requested, such as if the allocated storage space for recordings is filled. Check the value of the [Duration](apprecordingresult_duration.md) property to determine the actual duration of the recorded file.
     * @see https://learn.microsoft.com/uwp/api/windows.media.apprecording.apprecordingresult.isfiletruncated
     * @type {Boolean} 
     */
    IsFileTruncated {
        get => this.get_IsFileTruncated()
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
    get_Succeeded() {
        if (!this.HasProp("__IAppRecordingResult")) {
            if ((queryResult := this.QueryInterface(IAppRecordingResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppRecordingResult := IAppRecordingResult(outPtr)
        }

        return this.__IAppRecordingResult.get_Succeeded()
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    get_ExtendedError() {
        if (!this.HasProp("__IAppRecordingResult")) {
            if ((queryResult := this.QueryInterface(IAppRecordingResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppRecordingResult := IAppRecordingResult(outPtr)
        }

        return this.__IAppRecordingResult.get_ExtendedError()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_Duration() {
        if (!this.HasProp("__IAppRecordingResult")) {
            if ((queryResult := this.QueryInterface(IAppRecordingResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppRecordingResult := IAppRecordingResult(outPtr)
        }

        return this.__IAppRecordingResult.get_Duration()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsFileTruncated() {
        if (!this.HasProp("__IAppRecordingResult")) {
            if ((queryResult := this.QueryInterface(IAppRecordingResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppRecordingResult := IAppRecordingResult(outPtr)
        }

        return this.__IAppRecordingResult.get_IsFileTruncated()
    }

;@endregion Instance Methods
}

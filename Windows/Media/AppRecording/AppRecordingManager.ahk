#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppRecordingManager.ahk
#Include .\IAppRecordingManagerStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Enables a UWP app to save recordings and screenshots of its content.
 * @remarks
 * Get an instance of this class by calling [GetDefault](apprecordingmanager_getdefault_846721868.md).
 * @see https://learn.microsoft.com/uwp/api/windows.media.apprecording.apprecordingmanager
 * @namespace Windows.Media.AppRecording
 * @version WindowsRuntime 1.4
 */
class AppRecordingManager extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppRecordingManager

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppRecordingManager.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets an instance of the **AppRecordingManager** class.
     * @returns {AppRecordingManager} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.apprecording.apprecordingmanager.getdefault
     */
    static GetDefault() {
        if (!AppRecordingManager.HasProp("__IAppRecordingManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.AppRecording.AppRecordingManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppRecordingManagerStatics.IID)
            AppRecordingManager.__IAppRecordingManagerStatics := IAppRecordingManagerStatics(factoryPtr)
        }

        return AppRecordingManager.__IAppRecordingManagerStatics.GetDefault()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets a list of strings representing the media encoding subtypes supported for the [SaveScreenshotToFilesAsync](apprecordingmanager_savescreenshottofilesasync_1063354614.md) method.
     * @see https://learn.microsoft.com/uwp/api/windows.media.apprecording.apprecordingmanager.supportedscreenshotmediaencodingsubtypes
     * @type {IVectorView<HSTRING>} 
     */
    SupportedScreenshotMediaEncodingSubtypes {
        get => this.get_SupportedScreenshotMediaEncodingSubtypes()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Gets an object that provides information about whether the current app is currently able to initiate an app recording, and if not, provides details about the reasons that app recording is unavailable.
     * @returns {AppRecordingStatus} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.apprecording.apprecordingmanager.getstatus
     */
    GetStatus() {
        if (!this.HasProp("__IAppRecordingManager")) {
            if ((queryResult := this.QueryInterface(IAppRecordingManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppRecordingManager := IAppRecordingManager(outPtr)
        }

        return this.__IAppRecordingManager.GetStatus()
    }

    /**
     * Writes audio and video content of the current app to the specified destination file, beginning at the current time and ending when the operation is cancelled or storage space has been exceeded.
     * @param {StorageFile} file_ The file to which the recorded media is written.
     * @returns {IAsyncOperation<AppRecordingResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.apprecording.apprecordingmanager.startrecordingtofileasync
     */
    StartRecordingToFileAsync(file_) {
        if (!this.HasProp("__IAppRecordingManager")) {
            if ((queryResult := this.QueryInterface(IAppRecordingManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppRecordingManager := IAppRecordingManager(outPtr)
        }

        return this.__IAppRecordingManager.StartRecordingToFileAsync(file_)
    }

    /**
     * Writes audio and video content of the current app from the historical buffer, with a time range defined by the specified start time and duration, to the specified destination file.
     * @remarks
     * The stored file containing the app recording is created as an MP4 with h.264 video and AAC audio. Video files recorded using **AppRecordingManager** are not ingested into first-party experiences like GameDVR or the XBox app.
     * 
     * Before calling this method, call GetStatus and check the value of the [CanRecordTimeSpan](apprecordingstatus_canrecordtimespan.md) to determine if the current app is currently able to make a time span recording.
     * 
     * Use [StartRecordingToFileAsync](apprecordingmanager_startrecordingtofileasync_706691331.md) to begin an app recording at the current time.
     * @param {DateTime} startTime The time at which the content to be recorded started. This value must be within the duration of the historical buffer, which can be determined by calling [AppRecordingManager.GetStatus](apprecordingmanager_getstatus_169641651.md) and then checking the value of the [AppRecordingStatus.HistoricalBufferDuration](apprecordingstatus_historicalbufferduration.md) property.
     * @param {TimeSpan} duration_ The requested duration of the app recording. An app recording can succeed, but record a shorter duration than specified with this parameter if the allocated storage for recordings is reached. To determine the duration of the file that was actually recorded, check the value [AppRecordingResult.Duration](apprecordingresult_duration.md) property of the object returned from this operation.
     * @param {StorageFile} file_ The file to which the recorded media is written.
     * @returns {IAsyncOperation<AppRecordingResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.apprecording.apprecordingmanager.recordtimespantofileasync
     */
    RecordTimeSpanToFileAsync(startTime, duration_, file_) {
        if (!this.HasProp("__IAppRecordingManager")) {
            if ((queryResult := this.QueryInterface(IAppRecordingManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppRecordingManager := IAppRecordingManager(outPtr)
        }

        return this.__IAppRecordingManager.RecordTimeSpanToFileAsync(startTime, duration_, file_)
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_SupportedScreenshotMediaEncodingSubtypes() {
        if (!this.HasProp("__IAppRecordingManager")) {
            if ((queryResult := this.QueryInterface(IAppRecordingManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppRecordingManager := IAppRecordingManager(outPtr)
        }

        return this.__IAppRecordingManager.get_SupportedScreenshotMediaEncodingSubtypes()
    }

    /**
     * Asynchronously saves an image file containing the current contents of the calling app.
     * @remarks
     * Images files saved using **AppRecordingManager** are not ingested into first-party experiences like GameDVR or the XBox app.
     * @param {StorageFolder} folder_ The path to which the recorded media file is written.
     * @param {HSTRING} filenamePrefix The prefix of the filename used for saved images. The system appends the appropriate extension to the filename for each format specified in the *requestedFormats* parameter.
     * @param {Integer} option A value that specifies options for saving the screenshot. To help the system perform the proper colorspace conversions, apps should specify [HdrContentVisible](apprecordingsavescreenshotoption.md) if the content to be saved includes HDR content. Otherwise, apps should specify **None**.
     * @param {IIterable<HSTRING>} requestedFormats A list of strings specifying the formats in which screenshot images should be saved. Get a list of the supported values for this parameter with the [SupportedScreenshotMediaEncodingSubtypes](apprecordingmanager_supportedscreenshotmediaencodingsubtypes.md) property.
     * @returns {IAsyncOperation<AppRecordingSaveScreenshotResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.apprecording.apprecordingmanager.savescreenshottofilesasync
     */
    SaveScreenshotToFilesAsync(folder_, filenamePrefix, option, requestedFormats) {
        if (!this.HasProp("__IAppRecordingManager")) {
            if ((queryResult := this.QueryInterface(IAppRecordingManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppRecordingManager := IAppRecordingManager(outPtr)
        }

        return this.__IAppRecordingManager.SaveScreenshotToFilesAsync(folder_, filenamePrefix, option, requestedFormats)
    }

;@endregion Instance Methods
}

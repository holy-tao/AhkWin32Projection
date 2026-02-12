#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ILowLagMediaRecording.ahk
#Include .\ILowLagMediaRecording2.ahk
#Include .\ILowLagMediaRecording3.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides methods for taking a low lag media recording.
 * @remarks
 * Use the following methods on the [MediaCapture](mediacapture.md) class to initialize the recording, which must be called before [StartAsync](lowlagmediarecording_startasync_1931900819.md): [PrepareLowLagRecordToStreamAsync](mediacapture_preparelowlagrecordtostreamasync_1450185294.md), [PrepareLowLagRecordToStorageFileAsync](mediacapture_preparelowlagrecordtostoragefileasync_1085563722.md), and [PrepareLowLagRecordToCustomSinkAsync](mediacapture_preparelowlagrecordtocustomsinkasync_1787918353.md). These are asynchronous methods which return a LowLagMediaRecording object when they are finished.
 * 
 * [StopAsync](lowlagmediarecording_stopasync_1648475005.md) stops the operation, which can be restarted with [StartAsync](lowlagmediarecording_startasync_1931900819.md).
 * 
 * [FinishAsync](lowlagmediarecording_finishasync_1182664592.md) stops the media recording operation and releases the LowLagMediaRecording object and resources used by the media recording operation. If you want to restart the recording after calling [FinishAsync](lowlagmediarecording_finishasync_1182664592.md), you will need to call one of the **PrepareLowLagRecord** methods to initialize a new LowLagMediaRecording object.
 * 
 * If the media type is changed or an effect is added, you must call [PrepareLowLagRecordToStreamAsync](mediacapture_preparelowlagrecordtostreamasync_1450185294.md), [PrepareLowLagRecordToStorageFileAsync](mediacapture_preparelowlagrecordtostoragefileasync_1085563722.md), or [PrepareLowLagRecordToCustomSinkAsync](mediacapture_preparelowlagrecordtocustomsinkasync_1787918353.md) to create a new LowLagMediaRecording object.
 * 
 * For how-to guidance for using **LowLagMediaCapture** to capture video, see [Basic photo, video, and audio capture with MediaCapture in a WinUI 3 app](/windows/apps/develop/camera/basic-photo-capture).
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.lowlagmediarecording
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class LowLagMediaRecording extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ILowLagMediaRecording

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ILowLagMediaRecording.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Asynchronously starts the low lag media recording.
     * @remarks
     * Before calling StartAsync, you must initialize the [LowLagMediaRecording](lowlagmediarecording.md) object by calling one of the prepare method on [MediaCapture](mediacapture.md): [PrepareLowLagRecordToStreamAsync](mediacapture_preparelowlagrecordtostreamasync_1450185294.md), [PrepareLowLagRecordToStorageFileAsync](mediacapture_preparelowlagrecordtostoragefileasync_1085563722.md), and [PrepareLowLagRecordToCustomSinkAsync](/uwp/api/windows.media.capture.mediacapture.preparelowlagrecordtocustomsinkasync).
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.lowlagmediarecording.startasync
     */
    StartAsync() {
        if (!this.HasProp("__ILowLagMediaRecording")) {
            if ((queryResult := this.QueryInterface(ILowLagMediaRecording.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILowLagMediaRecording := ILowLagMediaRecording(outPtr)
        }

        return this.__ILowLagMediaRecording.StartAsync()
    }

    /**
     * Asynchronously stops the low lag media recording.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.lowlagmediarecording.stopasync
     */
    StopAsync() {
        if (!this.HasProp("__ILowLagMediaRecording")) {
            if ((queryResult := this.QueryInterface(ILowLagMediaRecording.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILowLagMediaRecording := ILowLagMediaRecording(outPtr)
        }

        return this.__ILowLagMediaRecording.StopAsync()
    }

    /**
     * Asynchronously releases the [LowLagMediaRecording](lowlagmediarecording.md) object and resources used by the media recording operation.
     * @remarks
     * FinishAsync stops the media recording operation and releases the [LowLagMediaRecording](lowlagmediarecording.md) object and resources used by the media recording operation. If you want to restart the recording after calling FinishAsync, you will need to call one of the **PrepareLowLagRecord** methods to initialize a new [LowLagMediaRecording](lowlagmediarecording.md) object.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.lowlagmediarecording.finishasync
     */
    FinishAsync() {
        if (!this.HasProp("__ILowLagMediaRecording")) {
            if ((queryResult := this.QueryInterface(ILowLagMediaRecording.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILowLagMediaRecording := ILowLagMediaRecording(outPtr)
        }

        return this.__ILowLagMediaRecording.FinishAsync()
    }

    /**
     * Pauses an ongoing low lag media record operation.
     * @param {Integer} behavior A value indicating whether the media capture hardware resources should be preserved or released while recording is paused.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.lowlagmediarecording.pauseasync
     */
    PauseAsync(behavior) {
        if (!this.HasProp("__ILowLagMediaRecording2")) {
            if ((queryResult := this.QueryInterface(ILowLagMediaRecording2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILowLagMediaRecording2 := ILowLagMediaRecording2(outPtr)
        }

        return this.__ILowLagMediaRecording2.PauseAsync(behavior)
    }

    /**
     * Resumes a paused low lag recording operation.
     * @remarks
     * Pause a low lag media recording operation by calling [PauseAsync](lowlagmediarecording_pauseasync_622665789.md).
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.lowlagmediarecording.resumeasync
     */
    ResumeAsync() {
        if (!this.HasProp("__ILowLagMediaRecording2")) {
            if ((queryResult := this.QueryInterface(ILowLagMediaRecording2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILowLagMediaRecording2 := ILowLagMediaRecording2(outPtr)
        }

        return this.__ILowLagMediaRecording2.ResumeAsync()
    }

    /**
     * Pauses an ongoing low lag media record operation and provides a [MediaCapturePauseResult](mediacapturepauseresult.md) that can be used to help the user align the camera with the last captured frame when resuming recording.
     * @param {Integer} behavior A value indicating whether the media capture hardware resources should be preserved or released while recording is paused.
     * @returns {IAsyncOperation<MediaCapturePauseResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.lowlagmediarecording.pausewithresultasync
     */
    PauseWithResultAsync(behavior) {
        if (!this.HasProp("__ILowLagMediaRecording3")) {
            if ((queryResult := this.QueryInterface(ILowLagMediaRecording3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILowLagMediaRecording3 := ILowLagMediaRecording3(outPtr)
        }

        return this.__ILowLagMediaRecording3.PauseWithResultAsync(behavior)
    }

    /**
     * Asynchronously stops the low lag media recording and provides a [MediaCaptureStopResult](mediacapturestopresult.md) that can be used to help the user align the camera with the last captured frame when restarting recording.
     * @returns {IAsyncOperation<MediaCaptureStopResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.lowlagmediarecording.stopwithresultasync
     */
    StopWithResultAsync() {
        if (!this.HasProp("__ILowLagMediaRecording3")) {
            if ((queryResult := this.QueryInterface(ILowLagMediaRecording3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILowLagMediaRecording3 := ILowLagMediaRecording3(outPtr)
        }

        return this.__ILowLagMediaRecording3.StopWithResultAsync()
    }

;@endregion Instance Methods
}

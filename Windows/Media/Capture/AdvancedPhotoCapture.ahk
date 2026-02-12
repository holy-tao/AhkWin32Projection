#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAdvancedPhotoCapture.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\AdvancedPhotoCapture.ahk
#Include .\OptionalReferencePhotoCapturedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Provides methods for capturing photos using system-provided computational photography techniques.
 * @remarks
 * Get an instance of this class by calling [MediaCapture.PrepareAdvancedPhotoCaptureAsync](mediacapture_prepareadvancedphotocaptureasync_1274714827.md).
 * 
 * For how-to guidance for using **AdvancedPhotoCapture**, see [High dynamic range (HDR) and low-light photo capture](/windows/apps/develop/camera/hdr-low-light-photo-capture).
 * 
 * > [!NOTE] 
 * > Starting with Windows 10, version 1709, recording video and using AdvancedPhotoCapture concurrently is supported.  This is not supported in previous versions. This change means that you can have a prepared **[LowLagMediaRecording](/uwp/api/windows.media.capture.lowlagmediarecording)** and **[AdvancedPhotoCapture](/uwp/api/windows.media.capture.advancedphotocapture)** at the same time. You can start or stop video recording between calls to **[MediaCapture.PrepareAdvancedPhotoCaptureAsync](/uwp/api/windows.media.capture.mediacapture#Windows_Media_Capture_MediaCapture_PrepareAdvancedPhotoCaptureAsync_Windows_Media_MediaProperties_ImageEncodingProperties_)** and **[AdvancedPhotoCapture.FinishAsync](/uwp/api/windows.media.capture.advancedphotocapture.FinishAsync)**. You can also call **[AdvancedPhotoCapture.CaptureAsync](/uwp/api/windows.media.capture.advancedphotocapture.CaptureAsync)** while video is recording. However, some **AdvancedPhotoCapture** scenarios, like capturing an HDR photo while recording video would cause some video frames to be altered by the HDR capture, resulting in a negative user experience. For this reason, the list of modes returned by the **[AdvancedPhotoControl.SupportedModes](/uwp/api/windows.media.devices.advancedphotocontrol.SupportedModes)** will be different while video is recording. You should check this value immediately after starting or stopping video recording to ensure that the desired mode is supported in the current video recording state.
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.advancedphotocapture
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class AdvancedPhotoCapture extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAdvancedPhotoCapture

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAdvancedPhotoCapture.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnOptionalReferencePhotoCapturedToken")) {
            this.remove_OptionalReferencePhotoCaptured(this.__OnOptionalReferencePhotoCapturedToken)
            this.__OnOptionalReferencePhotoCaptured.iface.Dispose()
        }

        if(this.HasProp("__OnAllPhotosCapturedToken")) {
            this.remove_AllPhotosCaptured(this.__OnAllPhotosCapturedToken)
            this.__OnAllPhotosCaptured.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * Asynchronously performs an advanced photo capture passing the provided app-defined context object to the result of the operation.
     * @remarks
     * [MediaCapture.PrepareAdvancedPhotoCaptureAsync](mediacapture_prepareadvancedphotocaptureasync_1274714827.md) must be called before calling **CaptureAsync**.
     * 
     * Concurrently recording video and photo capture using [AdvancedPhotoCapture](advancedphotocapture.md) is not supported.
     * @returns {IAsyncOperation<AdvancedCapturedPhoto>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.advancedphotocapture.captureasync
     */
    CaptureAsync() {
        if (!this.HasProp("__IAdvancedPhotoCapture")) {
            if ((queryResult := this.QueryInterface(IAdvancedPhotoCapture.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdvancedPhotoCapture := IAdvancedPhotoCapture(outPtr)
        }

        return this.__IAdvancedPhotoCapture.CaptureAsync()
    }

    /**
     * Asynchronously performs an advanced photo capture.
     * @remarks
     * [MediaCapture.PrepareAdvancedPhotoCaptureAsync](mediacapture_prepareadvancedphotocaptureasync_1274714827.md) must be called before calling **CaptureAsync**.
     * 
     * Concurrently recording video and photo capture using [AdvancedPhotoCapture](advancedphotocapture.md) is not supported.
     * @param {IInspectable} context_ 
     * @returns {IAsyncOperation<AdvancedCapturedPhoto>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.advancedphotocapture.captureasync
     */
    CaptureWithContextAsync(context_) {
        if (!this.HasProp("__IAdvancedPhotoCapture")) {
            if ((queryResult := this.QueryInterface(IAdvancedPhotoCapture.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdvancedPhotoCapture := IAdvancedPhotoCapture(outPtr)
        }

        return this.__IAdvancedPhotoCapture.CaptureWithContextAsync(context_)
    }

    /**
     * 
     * @param {TypedEventHandler<AdvancedPhotoCapture, OptionalReferencePhotoCapturedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_OptionalReferencePhotoCaptured(handler) {
        if (!this.HasProp("__IAdvancedPhotoCapture")) {
            if ((queryResult := this.QueryInterface(IAdvancedPhotoCapture.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdvancedPhotoCapture := IAdvancedPhotoCapture(outPtr)
        }

        return this.__IAdvancedPhotoCapture.add_OptionalReferencePhotoCaptured(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_OptionalReferencePhotoCaptured(token) {
        if (!this.HasProp("__IAdvancedPhotoCapture")) {
            if ((queryResult := this.QueryInterface(IAdvancedPhotoCapture.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdvancedPhotoCapture := IAdvancedPhotoCapture(outPtr)
        }

        return this.__IAdvancedPhotoCapture.remove_OptionalReferencePhotoCaptured(token)
    }

    /**
     * 
     * @param {TypedEventHandler<AdvancedPhotoCapture, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_AllPhotosCaptured(handler) {
        if (!this.HasProp("__IAdvancedPhotoCapture")) {
            if ((queryResult := this.QueryInterface(IAdvancedPhotoCapture.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdvancedPhotoCapture := IAdvancedPhotoCapture(outPtr)
        }

        return this.__IAdvancedPhotoCapture.add_AllPhotosCaptured(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_AllPhotosCaptured(token) {
        if (!this.HasProp("__IAdvancedPhotoCapture")) {
            if ((queryResult := this.QueryInterface(IAdvancedPhotoCapture.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdvancedPhotoCapture := IAdvancedPhotoCapture(outPtr)
        }

        return this.__IAdvancedPhotoCapture.remove_AllPhotosCaptured(token)
    }

    /**
     * Asynchronously releases the [AdvancedPhotoCapture](advancedphotocapture.md) object and resources used by the advanced photo capture operation.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.advancedphotocapture.finishasync
     */
    FinishAsync() {
        if (!this.HasProp("__IAdvancedPhotoCapture")) {
            if ((queryResult := this.QueryInterface(IAdvancedPhotoCapture.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdvancedPhotoCapture := IAdvancedPhotoCapture(outPtr)
        }

        return this.__IAdvancedPhotoCapture.FinishAsync()
    }

;@endregion Instance Methods
}

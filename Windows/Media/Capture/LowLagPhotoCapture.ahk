#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ILowLagPhotoCapture.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides methods for taking a low shutter lag photo.
 * @remarks
 * Use [MediaCapture.PrepareLowLagPhotoCaptureAsync](mediacapture_preparelowlagphotocaptureasync_1426375994.md) to initialize the capture. This is an asynchronous calls which returns a LowLagPhotoCapture object when it is finished. This must be called before [CaptureAsync](lowlagphotocapture_captureasync_2078018041.md).
 * 
 * [FinishAsync](lowlagphotosequencecapture_finishasync_1182664592.md) stops the photo capture operation and releases the LowLagPhotoCapture object and resources used by the capture photo operation. After starting a low lag photo capture, you must stop the photo capture by calling [FinishAsync](lowlagmediarecording_finishasync_1182664592.md) before your app attempts to record video with the [MediaCapture](mediacapture.md) object.
 * 
 * If the media type is changed or an effect is added, you must call [MediaCapture.PrepareLowLagPhotoCaptureAsync](mediacapture_preparelowlagphotocaptureasync_1426375994.md) to create a new LowLagPhotoCapture object.
 * 
 * For how-to guidance for using **LowLagPhotoCapture** to capture photos, see [Basic photo, video, and audio capture with MediaCapture in a WinUI 3 app](/windows/apps/develop/camera/basic-photo-capture).
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.lowlagphotocapture
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class LowLagPhotoCapture extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ILowLagPhotoCapture

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ILowLagPhotoCapture.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Asynchronously captures a low shutter lag photo.
     * @remarks
     * [MediaCapture.PrepareLowLagPhotoCaptureAsync](mediacapture_preparelowlagphotocaptureasync_1426375994.md) must be called before CaptureAsync.
     * 
     * When this asynchronous method completes, a [CapturedPhoto](capturedphoto.md) object is returned which contains the captured photo.
     * @returns {IAsyncOperation<CapturedPhoto>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.lowlagphotocapture.captureasync
     */
    CaptureAsync() {
        if (!this.HasProp("__ILowLagPhotoCapture")) {
            if ((queryResult := this.QueryInterface(ILowLagPhotoCapture.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILowLagPhotoCapture := ILowLagPhotoCapture(outPtr)
        }

        return this.__ILowLagPhotoCapture.CaptureAsync()
    }

    /**
     * Asynchronously releases the [LowLagPhotoCapture](lowlagphotocapture.md) object and resources used by the capture photo operation.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.lowlagphotocapture.finishasync
     */
    FinishAsync() {
        if (!this.HasProp("__ILowLagPhotoCapture")) {
            if ((queryResult := this.QueryInterface(ILowLagPhotoCapture.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILowLagPhotoCapture := ILowLagPhotoCapture(outPtr)
        }

        return this.__ILowLagPhotoCapture.FinishAsync()
    }

;@endregion Instance Methods
}

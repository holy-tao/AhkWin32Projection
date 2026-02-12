#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ILowLagPhotoSequenceCapture.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\LowLagPhotoSequenceCapture.ahk
#Include .\PhotoCapturedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Provides methods for taking a rapid sequence of low shutter lag photos.
 * @remarks
 * Photo sequence mode takes a rapid sequence of photos. A key scenario for photo sequence is getting photos in the past, that is prior to when the user takes a photo. If you want to take a sequence of photos that each have different settings, such as exposure or flash, use [VariablePhotoSequenceCapture](../windows.media.capture.core/variablephotosequencecapture.md).
 * 
 * You can access the [LowLagPhotoSequenceControl](../windows.media.devices/lowlagphotosequencecontrol.md) for the capture device through [MediaCapture.VideoDeviceController](mediacapture_videodevicecontroller.md). [LowLagPhotoSequenceControl](../windows.media.devices/lowlagphotosequencecontrol.md) is used to manage settings related to the photo sequence session.
 * 
 * You can find out if the device supports photo sequence mode by checking [LowLagPhotoSequenceControl.Supported](../windows.media.devices/lowlagphotosequencecontrol_supported.md).
 * 
 * Use [MediaCapture.PrepareLowLagPhotoSequenceCaptureAsync](mediacapture_preparelowlagphotosequencecaptureasync_2130225421.md) to initialize the photo sequence capture. This is an asynchronous call which returns a LowLagPhotoSequenceCapture object when it is finished. This must be called before [StartAsync](lowlagphotosequencecapture_startasync_1931900819.md).
 * 
 * To start capturing photos, call [StartAsync](lowlagphotosequencecapture_startasync_1931900819.md). The app will continue to receive photos from the device until the operation is stopped.
 * 
 * [StopAsync](lowlagphotosequencecapture_stopasync_1648475005.md) stops the operation, which can be restarted with [StartAsync](lowlagphotosequencecapture_startasync_1931900819.md).
 * 
 * Add a handler to the [PhotoCaptured](lowlagphotosequencecapture_photocaptured.md) event in order to get the captured photos in the sequence. [PhotoCapturedEventArgs](photocapturedeventargs.md) provides the data for the captured frames. [PhotoCapturedEventArgs.Frame](photocapturedeventargs_frame.md) contains the captured photo and [PhotoCapturedEventArgs.Thumbnail](photocapturedeventargs_thumbnail.md) contains the thumbnail.
 * 
 * [FinishAsync](lowlagphotosequencecapture_finishasync_1182664592.md) stops the photo sequence capture operation and releases the LowLagPhotoSequenceCapture object and resources used by the photo sequence operation. If you want to restart the photo sequence operation after calling [FinishAsync](lowlagphotosequencecapture_finishasync_1182664592.md), you must call [MediaCapture.PrepareLowLagPhotoSequenceCaptureAsync](mediacapture_preparelowlagphotosequencecaptureasync_2130225421.md) to initialize a new LowLagPhotoSequenceCapture object.
 * 
 * If the media type is changed or an effect is added, you must call [MediaCapture.PrepareLowLagPhotoSequenceCaptureAsync](mediacapture_preparelowlagphotosequencecaptureasync_2130225421.md) to create a new [LowLagPhotoCapture](lowlagphotocapture.md) object.
 * 
 * [LowLagPhotoSequenceControl.GetCurrentFrameRate](../windows.media.devices/lowlagphotosequencecontrol_getcurrentframerate_279282429.md) specifies the frame rate at which the photos are taken.
 * 
 * [PhotoCapturedEventArgs.CaptureTimeOffset](photocapturedeventargs_capturetimeoffset.md) can be used to tell whether a frame was in the future, greater than 0, or in the past, less than 0.
 * 
 * If the app wants to limit how many frames it gets per second, it can use [LowLagPhotoSequenceControl.PhotosPerSecondLimit](../windows.media.devices/lowlagphotosequencecontrol_photospersecondlimit.md). This can be useful in situations where the sensor on the device can handle 30fps, but the app only needs 4fps.
 * 
 * To enable thumbnails, set [LowLagPhotoSequenceControl.ThumbnailEnabled](../windows.media.devices/lowlagphotosequencecontrol_thumbnailenabled.md) to **true**.
 * 
 * You can set the desired thumbnail size through [LowLagPhotoSequenceControl.DesiredThumbnailSize](../windows.media.devices/lowlagphotosequencecontrol_desiredthumbnailsize.md) and set the thumbnail format through [LowLagPhotoSequenceControl.ThumbnailFormat](../windows.media.devices/lowlagphotosequencecontrol_thumbnailformat.md).
 * 
 * The number of past photos cannot be more than [LowLagPhotoSequenceControl.MaxPastPhotos](../windows.media.devices/lowlagphotosequencecontrol_maxpastphotos.md), which is the maximum number of past photos that is supported by the driver. The number of past photos returned will be the smaller of the following values: [LowLagPhotoSequenceControl.PastPhotoLimit](../windows.media.devices/lowlagphotosequencecontrol_pastphotolimit.md), [LowLagPhotoSequenceControl.MaxPastPhotos](../windows.media.devices/lowlagphotosequencecontrol_maxpastphotos.md), or the current number of available past photos.
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.lowlagphotosequencecapture
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class LowLagPhotoSequenceCapture extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ILowLagPhotoSequenceCapture

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ILowLagPhotoSequenceCapture.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnPhotoCapturedToken")) {
            this.remove_PhotoCaptured(this.__OnPhotoCapturedToken)
            this.__OnPhotoCaptured.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * Asynchronously starts capturing photos.
     * @remarks
     * [MediaCapture.PrepareLowLagPhotoSequenceCaptureAsync](mediacapture_preparelowlagphotosequencecaptureasync_2130225421.md) must be called before StartAsync.
     * 
     * Add a handler to the [PhotoCaptured](lowlagphotosequencecapture_photocaptured.md) event in order to get the captured photos in the sequence. [PhotoCapturedEventArgs](photocapturedeventargs.md) provides the data for the captured frames. [PhotoCapturedEventArgs.Frame](photocapturedeventargs_frame.md) contains the captured photo and [PhotoCapturedEventArgs.Thumbnail](photocapturedeventargs_thumbnail.md) contains the thumbnail.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.lowlagphotosequencecapture.startasync
     */
    StartAsync() {
        if (!this.HasProp("__ILowLagPhotoSequenceCapture")) {
            if ((queryResult := this.QueryInterface(ILowLagPhotoSequenceCapture.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILowLagPhotoSequenceCapture := ILowLagPhotoSequenceCapture(outPtr)
        }

        return this.__ILowLagPhotoSequenceCapture.StartAsync()
    }

    /**
     * Asynchronously stops capturing photos.
     * @remarks
     * StopAsync stops the operation, which can be restarted with [StartAsync](lowlagphotosequencecapture_startasync_1931900819.md).
     * 
     * [FinishAsync](lowlagphotosequencecapture_finishasync_1182664592.md) stops the photo sequence capture operation and releases the [LowLagPhotoSequenceCapture](lowlagphotosequencecapture.md) object and resources used by the photo sequence operation. If you want to restart the photo sequence operation after calling [FinishAsync](lowlagphotosequencecapture_finishasync_1182664592.md), you must call [MediaCapture.PrepareLowLagPhotoSequenceCaptureAsync](mediacapture_preparelowlagphotosequencecaptureasync_2130225421.md) to initialize a new [LowLagPhotoSequenceCapture](lowlagphotosequencecapture.md) object.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.lowlagphotosequencecapture.stopasync
     */
    StopAsync() {
        if (!this.HasProp("__ILowLagPhotoSequenceCapture")) {
            if ((queryResult := this.QueryInterface(ILowLagPhotoSequenceCapture.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILowLagPhotoSequenceCapture := ILowLagPhotoSequenceCapture(outPtr)
        }

        return this.__ILowLagPhotoSequenceCapture.StopAsync()
    }

    /**
     * Asynchronously releases the [LowLagPhotoSequenceCapture](lowlagphotosequencecapture.md) object and resources used by the photo sequence capture operation.
     * @remarks
     * FinishAsync stops the photo sequence capture operation and releases the [LowLagPhotoSequenceCapture](lowlagphotosequencecapture.md) object and resources used by the photo sequence operation. If you want to restart the photo sequence operation after calling FinishAsync, you must call [MediaCapture.PrepareLowLagPhotoSequenceCaptureAsync](mediacapture_preparelowlagphotosequencecaptureasync_2130225421.md) to initialize a new [LowLagPhotoSequenceCapture](lowlagphotosequencecapture.md) object.
     * 
     * [StopAsync](lowlagphotosequencecapture_stopasync_1648475005.md) stops the operation, which can be restarted with [StartAsync](lowlagphotosequencecapture_startasync_1931900819.md).
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.lowlagphotosequencecapture.finishasync
     */
    FinishAsync() {
        if (!this.HasProp("__ILowLagPhotoSequenceCapture")) {
            if ((queryResult := this.QueryInterface(ILowLagPhotoSequenceCapture.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILowLagPhotoSequenceCapture := ILowLagPhotoSequenceCapture(outPtr)
        }

        return this.__ILowLagPhotoSequenceCapture.FinishAsync()
    }

    /**
     * 
     * @param {TypedEventHandler<LowLagPhotoSequenceCapture, PhotoCapturedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PhotoCaptured(handler) {
        if (!this.HasProp("__ILowLagPhotoSequenceCapture")) {
            if ((queryResult := this.QueryInterface(ILowLagPhotoSequenceCapture.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILowLagPhotoSequenceCapture := ILowLagPhotoSequenceCapture(outPtr)
        }

        return this.__ILowLagPhotoSequenceCapture.add_PhotoCaptured(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PhotoCaptured(token) {
        if (!this.HasProp("__ILowLagPhotoSequenceCapture")) {
            if ((queryResult := this.QueryInterface(ILowLagPhotoSequenceCapture.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILowLagPhotoSequenceCapture := ILowLagPhotoSequenceCapture(outPtr)
        }

        return this.__ILowLagPhotoSequenceCapture.remove_PhotoCaptured(token)
    }

;@endregion Instance Methods
}

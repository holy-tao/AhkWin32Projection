#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ILowLagPhotoSequenceControl.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides functionality for managing the low shutter lag photo sequence mode on the capture device.
 * @remarks
 * Photo sequence mode takes a rapid sequence of photos. A key scenario for photo sequence is getting photos in the past, that is prior to when the user takes a photo.
 * 
 * You can access the LowLagPhotoSequenceControl for the capture device through [MediaCapture.VideoDeviceController](../windows.media.capture/mediacapture_videodevicecontroller.md).
 * 
 * You can find out if the device supports photo sequence mode by checking [LowLagPhotoSequenceControl.Supported](lowlagphotosequencecontrol_supported.md).
 * 
 * To initiate photo sequence mode, call [MediaCapture.PrepareLowLagPhotoSequenceCaptureAsync](../windows.media.capture/mediacapture_preparelowlagphotosequencecaptureasync_2130225421.md). To start capturing photos, call [StartAsync](../windows.media.capture/lowlagphotosequencecapture_startasync_1931900819.md). To stop capturing photos, call [StopAsync](../windows.media.capture/lowlagphotosequencecapture_stopasync_1648475005.md). The app will continue to receive photos from the device until the operation is stopped.
 * 
 * [GetCurrentFrameRate](lowlagphotosequencecontrol_getcurrentframerate_279282429.md) specifies the frame rate at which the photos are taken.
 * 
 * [PhotoCapturedEventArgs.CaptureTimeOffset](../windows.media.capture/photocapturedeventargs_capturetimeoffset.md) can be used to tell whether a frame was in the future, greater than 0, or in the past, less than 0.
 * 
 * If the app wants to limit how many frames it gets per second, it can use [LowLagPhotoSequence.PhotosPerSecondLimit](lowlagphotosequencecontrol_photospersecondlimit.md). This can be useful in situations where the sensor on the device can handle 30fps, but the app only needs 4fps.
 * 
 * Thumbnails are supported for a low shutter lag single photos and photo sequences.
 * 
 * To enable thumbnails, set [ThumbnailEnabled](lowlagphotosequencecontrol_thumbnailenabled.md) to **true**.
 * 
 * You can set the desired thumbnail size through [DesiredThumbnailSize](lowlagphotosequencecontrol_desiredthumbnailsize.md) and set the thumbnail format through [ThumbnailFormat](lowlagphotosequencecontrol_thumbnailformat.md).
 * 
 * The number of past photos cannot be more than [MaxPastPhotos](lowlagphotosequencecontrol_maxpastphotos.md), which is the maximum number of past photos that is supported by the driver. The number of past photos returned will be the smaller of the following values: [PastPhotoLimit](lowlagphotosequencecontrol_pastphotolimit.md), [MaxPastPhotos](lowlagphotosequencecontrol_maxpastphotos.md), or the current number of available past photos.
 * @see https://learn.microsoft.com/uwp/api/windows.media.devices.lowlagphotosequencecontrol
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class LowLagPhotoSequenceControl extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ILowLagPhotoSequenceControl

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ILowLagPhotoSequenceControl.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value that specifies if the capture device supports low shutter lag photo sequence mode.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.lowlagphotosequencecontrol.supported
     * @type {Boolean} 
     */
    Supported {
        get => this.get_Supported()
    }

    /**
     * Gets the maximum number of past photos that can be stored.
     * @remarks
     * The [PastPhotoLimit](lowlagphotosequencecontrol_pastphotolimit.md) sets the actual number of past photos that are stored.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.lowlagphotosequencecontrol.maxpastphotos
     * @type {Integer} 
     */
    MaxPastPhotos {
        get => this.get_MaxPastPhotos()
    }

    /**
     * Gets the maximum number of photos that can be taken per second.
     * @remarks
     * The [PhotosPerSecondLimit](lowlagphotosequencecontrol_photospersecondlimit.md) sets the actual frame rate that photos are taken.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.lowlagphotosequencecontrol.maxphotospersecond
     * @type {Float} 
     */
    MaxPhotosPerSecond {
        get => this.get_MaxPhotosPerSecond()
    }

    /**
     * Gets or sets a value that specifies the number of past photos to store.
     * @remarks
     * To determine the maximum number of past photos that can be stored, check the [MaxPastPhotos](lowlagphotosequencecontrol_maxpastphotos.md) property.
     * 
     * The actual number of past photos cannot be more than [MaxPastPhotos](lowlagphotosequencecontrol_maxpastphotos.md), which is the maximum number of past photos that is supported by the driver. The number of past photos returned will be the smaller of the following values: PastPhotoLimit, [MaxPastPhotos](lowlagphotosequencecontrol_maxpastphotos.md), or the current number of available past photos.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.lowlagphotosequencecontrol.pastphotolimit
     * @type {Integer} 
     */
    PastPhotoLimit {
        get => this.get_PastPhotoLimit()
        set => this.put_PastPhotoLimit(value)
    }

    /**
     * Gets or sets the number of photos that are taken per second.
     * @remarks
     * To determine the maximum number photos per second supported by capture device, check the [MaxPhotosPerSecond](lowlagphotosequencecontrol_maxphotospersecond.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.lowlagphotosequencecontrol.photospersecondlimit
     * @type {Float} 
     */
    PhotosPerSecondLimit {
        get => this.get_PhotosPerSecondLimit()
        set => this.put_PhotosPerSecondLimit(value)
    }

    /**
     * Gets a value that enables and disables thumbnail support in photo sequence mode.
     * @remarks
     * Thumbnails are supported for a low shutter lag single photos and photo sequences.
     * 
     * To enable thumbnails, set ThumbnailEnabled to **true**.
     * 
     * You can set the desired thumbnail size through [DesiredThumbnailSize](lowlagphotosequencecontrol_desiredthumbnailsize.md) and set the thumbnail format through [ThumbnailFormat](lowlagphotosequencecontrol_thumbnailformat.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.lowlagphotosequencecontrol.thumbnailenabled
     * @type {Boolean} 
     */
    ThumbnailEnabled {
        get => this.get_ThumbnailEnabled()
        set => this.put_ThumbnailEnabled(value)
    }

    /**
     * Gets or sets the media format for the thumbnails.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.lowlagphotosequencecontrol.thumbnailformat
     * @type {Integer} 
     */
    ThumbnailFormat {
        get => this.get_ThumbnailFormat()
        set => this.put_ThumbnailFormat(value)
    }

    /**
     * Gets or sets the desired size for thumbnails, which is the largest length of the image, either width or height.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.lowlagphotosequencecontrol.desiredthumbnailsize
     * @type {Integer} 
     */
    DesiredThumbnailSize {
        get => this.get_DesiredThumbnailSize()
        set => this.put_DesiredThumbnailSize(value)
    }

    /**
     * Gets a value that specifies if hardware acceleration is supported for thumbnails in photo sequence mode.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.lowlagphotosequencecontrol.hardwareacceleratedthumbnailsupported
     * @type {Integer} 
     */
    HardwareAcceleratedThumbnailSupported {
        get => this.get_HardwareAcceleratedThumbnailSupported()
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
    get_Supported() {
        if (!this.HasProp("__ILowLagPhotoSequenceControl")) {
            if ((queryResult := this.QueryInterface(ILowLagPhotoSequenceControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILowLagPhotoSequenceControl := ILowLagPhotoSequenceControl(outPtr)
        }

        return this.__ILowLagPhotoSequenceControl.get_Supported()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxPastPhotos() {
        if (!this.HasProp("__ILowLagPhotoSequenceControl")) {
            if ((queryResult := this.QueryInterface(ILowLagPhotoSequenceControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILowLagPhotoSequenceControl := ILowLagPhotoSequenceControl(outPtr)
        }

        return this.__ILowLagPhotoSequenceControl.get_MaxPastPhotos()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MaxPhotosPerSecond() {
        if (!this.HasProp("__ILowLagPhotoSequenceControl")) {
            if ((queryResult := this.QueryInterface(ILowLagPhotoSequenceControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILowLagPhotoSequenceControl := ILowLagPhotoSequenceControl(outPtr)
        }

        return this.__ILowLagPhotoSequenceControl.get_MaxPhotosPerSecond()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PastPhotoLimit() {
        if (!this.HasProp("__ILowLagPhotoSequenceControl")) {
            if ((queryResult := this.QueryInterface(ILowLagPhotoSequenceControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILowLagPhotoSequenceControl := ILowLagPhotoSequenceControl(outPtr)
        }

        return this.__ILowLagPhotoSequenceControl.get_PastPhotoLimit()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_PastPhotoLimit(value) {
        if (!this.HasProp("__ILowLagPhotoSequenceControl")) {
            if ((queryResult := this.QueryInterface(ILowLagPhotoSequenceControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILowLagPhotoSequenceControl := ILowLagPhotoSequenceControl(outPtr)
        }

        return this.__ILowLagPhotoSequenceControl.put_PastPhotoLimit(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_PhotosPerSecondLimit() {
        if (!this.HasProp("__ILowLagPhotoSequenceControl")) {
            if ((queryResult := this.QueryInterface(ILowLagPhotoSequenceControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILowLagPhotoSequenceControl := ILowLagPhotoSequenceControl(outPtr)
        }

        return this.__ILowLagPhotoSequenceControl.get_PhotosPerSecondLimit()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_PhotosPerSecondLimit(value) {
        if (!this.HasProp("__ILowLagPhotoSequenceControl")) {
            if ((queryResult := this.QueryInterface(ILowLagPhotoSequenceControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILowLagPhotoSequenceControl := ILowLagPhotoSequenceControl(outPtr)
        }

        return this.__ILowLagPhotoSequenceControl.put_PhotosPerSecondLimit(value)
    }

    /**
     * Gets the highest frame rate supported when video and photos sequences are being captured concurrently.
     * @remarks
     * The [ConcurrentRecordAndPhotoSequenceSupported](../windows.media.capture/mediacapturesettings_concurrentrecordandphotosequencesupported.md) property on the [MediaCapture](../windows.media.capture/mediacapture.md) class specifies if the capture device supports capturing videos and photo sequences at the same time.
     * @param {IMediaEncodingProperties} captureProperties The media encoding properties.
     * @returns {MediaRatio} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.lowlagphotosequencecontrol.gethighestconcurrentframerate
     */
    GetHighestConcurrentFrameRate(captureProperties) {
        if (!this.HasProp("__ILowLagPhotoSequenceControl")) {
            if ((queryResult := this.QueryInterface(ILowLagPhotoSequenceControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILowLagPhotoSequenceControl := ILowLagPhotoSequenceControl(outPtr)
        }

        return this.__ILowLagPhotoSequenceControl.GetHighestConcurrentFrameRate(captureProperties)
    }

    /**
     * Gets the current frame rate at which pictures can be taken.
     * @returns {MediaRatio} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.lowlagphotosequencecontrol.getcurrentframerate
     */
    GetCurrentFrameRate() {
        if (!this.HasProp("__ILowLagPhotoSequenceControl")) {
            if ((queryResult := this.QueryInterface(ILowLagPhotoSequenceControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILowLagPhotoSequenceControl := ILowLagPhotoSequenceControl(outPtr)
        }

        return this.__ILowLagPhotoSequenceControl.GetCurrentFrameRate()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ThumbnailEnabled() {
        if (!this.HasProp("__ILowLagPhotoSequenceControl")) {
            if ((queryResult := this.QueryInterface(ILowLagPhotoSequenceControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILowLagPhotoSequenceControl := ILowLagPhotoSequenceControl(outPtr)
        }

        return this.__ILowLagPhotoSequenceControl.get_ThumbnailEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_ThumbnailEnabled(value) {
        if (!this.HasProp("__ILowLagPhotoSequenceControl")) {
            if ((queryResult := this.QueryInterface(ILowLagPhotoSequenceControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILowLagPhotoSequenceControl := ILowLagPhotoSequenceControl(outPtr)
        }

        return this.__ILowLagPhotoSequenceControl.put_ThumbnailEnabled(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ThumbnailFormat() {
        if (!this.HasProp("__ILowLagPhotoSequenceControl")) {
            if ((queryResult := this.QueryInterface(ILowLagPhotoSequenceControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILowLagPhotoSequenceControl := ILowLagPhotoSequenceControl(outPtr)
        }

        return this.__ILowLagPhotoSequenceControl.get_ThumbnailFormat()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ThumbnailFormat(value) {
        if (!this.HasProp("__ILowLagPhotoSequenceControl")) {
            if ((queryResult := this.QueryInterface(ILowLagPhotoSequenceControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILowLagPhotoSequenceControl := ILowLagPhotoSequenceControl(outPtr)
        }

        return this.__ILowLagPhotoSequenceControl.put_ThumbnailFormat(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DesiredThumbnailSize() {
        if (!this.HasProp("__ILowLagPhotoSequenceControl")) {
            if ((queryResult := this.QueryInterface(ILowLagPhotoSequenceControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILowLagPhotoSequenceControl := ILowLagPhotoSequenceControl(outPtr)
        }

        return this.__ILowLagPhotoSequenceControl.get_DesiredThumbnailSize()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_DesiredThumbnailSize(value) {
        if (!this.HasProp("__ILowLagPhotoSequenceControl")) {
            if ((queryResult := this.QueryInterface(ILowLagPhotoSequenceControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILowLagPhotoSequenceControl := ILowLagPhotoSequenceControl(outPtr)
        }

        return this.__ILowLagPhotoSequenceControl.put_DesiredThumbnailSize(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HardwareAcceleratedThumbnailSupported() {
        if (!this.HasProp("__ILowLagPhotoSequenceControl")) {
            if ((queryResult := this.QueryInterface(ILowLagPhotoSequenceControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILowLagPhotoSequenceControl := ILowLagPhotoSequenceControl(outPtr)
        }

        return this.__ILowLagPhotoSequenceControl.get_HardwareAcceleratedThumbnailSupported()
    }

;@endregion Instance Methods
}

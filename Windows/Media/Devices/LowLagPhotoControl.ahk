#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ILowLagPhotoControl.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides functionality for managing the low shutter lag photo capture mode on the capture device.
 * @remarks
 * You can access the LowLagPhotoControl for the capture device through [MediaCapture.VideoDeviceController](../windows.media.capture/mediacapture_videodevicecontroller.md).
 * 
 * Thumbnails are supported for a low shutter lag single photos and photo sequences.
 * 
 * To enable thumbnails, set [ThumbnailEnabled](lowlagphotocontrol_thumbnailenabled.md) to **true**.
 * 
 * You can set the desired thumbnail size through [DesiredThumbnailSize](lowlagphotocontrol_desiredthumbnailsize.md) and set the thumbnail format through [ThumbnailFormat](lowlagphotocontrol_thumbnailformat.md).
 * @see https://learn.microsoft.com/uwp/api/windows.media.devices.lowlagphotocontrol
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class LowLagPhotoControl extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ILowLagPhotoControl

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ILowLagPhotoControl.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value that enables and disables thumbnail support.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.lowlagphotocontrol.thumbnailenabled
     * @type {Boolean} 
     */
    ThumbnailEnabled {
        get => this.get_ThumbnailEnabled()
        set => this.put_ThumbnailEnabled(value)
    }

    /**
     * Gets or sets the media format for the thumbnails.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.lowlagphotocontrol.thumbnailformat
     * @type {Integer} 
     */
    ThumbnailFormat {
        get => this.get_ThumbnailFormat()
        set => this.put_ThumbnailFormat(value)
    }

    /**
     * Gets or sets the desired size for thumbnails, which is the largest length of the image, either width or height.
     * @remarks
     * The actual dimension of the thumbnail is not guaranteed to be the value specified by DesiredThumbnailSize, but the system will attempt to create thumbnails as close as possible to this value.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.lowlagphotocontrol.desiredthumbnailsize
     * @type {Integer} 
     */
    DesiredThumbnailSize {
        get => this.get_DesiredThumbnailSize()
        set => this.put_DesiredThumbnailSize(value)
    }

    /**
     * Gets a value that specifies if hardware acceleration is supported for thumbnails.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.lowlagphotocontrol.hardwareacceleratedthumbnailsupported
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
     * Gets the highest frame rate supported when video and photos are being captured concurrently.
     * @remarks
     * The [ConcurrentRecordAndPhotoSupported](../windows.media.capture/mediacapturesettings_concurrentrecordandphotosupported.md) property on the [MediaCapture](../windows.media.capture/mediacapture.md) class specifies if the capture device supports capturing videos and photos at the same time.
     * @param {IMediaEncodingProperties} captureProperties The media encoding properties.
     * @returns {MediaRatio} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.lowlagphotocontrol.gethighestconcurrentframerate
     */
    GetHighestConcurrentFrameRate(captureProperties) {
        if (!this.HasProp("__ILowLagPhotoControl")) {
            if ((queryResult := this.QueryInterface(ILowLagPhotoControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILowLagPhotoControl := ILowLagPhotoControl(outPtr)
        }

        return this.__ILowLagPhotoControl.GetHighestConcurrentFrameRate(captureProperties)
    }

    /**
     * Gets the current frame rate at which pictures can be taken.
     * @returns {MediaRatio} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.lowlagphotocontrol.getcurrentframerate
     */
    GetCurrentFrameRate() {
        if (!this.HasProp("__ILowLagPhotoControl")) {
            if ((queryResult := this.QueryInterface(ILowLagPhotoControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILowLagPhotoControl := ILowLagPhotoControl(outPtr)
        }

        return this.__ILowLagPhotoControl.GetCurrentFrameRate()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ThumbnailEnabled() {
        if (!this.HasProp("__ILowLagPhotoControl")) {
            if ((queryResult := this.QueryInterface(ILowLagPhotoControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILowLagPhotoControl := ILowLagPhotoControl(outPtr)
        }

        return this.__ILowLagPhotoControl.get_ThumbnailEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_ThumbnailEnabled(value) {
        if (!this.HasProp("__ILowLagPhotoControl")) {
            if ((queryResult := this.QueryInterface(ILowLagPhotoControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILowLagPhotoControl := ILowLagPhotoControl(outPtr)
        }

        return this.__ILowLagPhotoControl.put_ThumbnailEnabled(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ThumbnailFormat() {
        if (!this.HasProp("__ILowLagPhotoControl")) {
            if ((queryResult := this.QueryInterface(ILowLagPhotoControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILowLagPhotoControl := ILowLagPhotoControl(outPtr)
        }

        return this.__ILowLagPhotoControl.get_ThumbnailFormat()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ThumbnailFormat(value) {
        if (!this.HasProp("__ILowLagPhotoControl")) {
            if ((queryResult := this.QueryInterface(ILowLagPhotoControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILowLagPhotoControl := ILowLagPhotoControl(outPtr)
        }

        return this.__ILowLagPhotoControl.put_ThumbnailFormat(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DesiredThumbnailSize() {
        if (!this.HasProp("__ILowLagPhotoControl")) {
            if ((queryResult := this.QueryInterface(ILowLagPhotoControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILowLagPhotoControl := ILowLagPhotoControl(outPtr)
        }

        return this.__ILowLagPhotoControl.get_DesiredThumbnailSize()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_DesiredThumbnailSize(value) {
        if (!this.HasProp("__ILowLagPhotoControl")) {
            if ((queryResult := this.QueryInterface(ILowLagPhotoControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILowLagPhotoControl := ILowLagPhotoControl(outPtr)
        }

        return this.__ILowLagPhotoControl.put_DesiredThumbnailSize(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HardwareAcceleratedThumbnailSupported() {
        if (!this.HasProp("__ILowLagPhotoControl")) {
            if ((queryResult := this.QueryInterface(ILowLagPhotoControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILowLagPhotoControl := ILowLagPhotoControl(outPtr)
        }

        return this.__ILowLagPhotoControl.get_HardwareAcceleratedThumbnailSupported()
    }

;@endregion Instance Methods
}

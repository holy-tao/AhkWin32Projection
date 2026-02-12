#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPhotoConfirmationControl.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides functionality for controlling the photo confirmation settings on a capture device.
 * @remarks
 * Get an instance of this class by accessing the [VideoDeviceController.PhotoConfirmationControl](videodevicecontroller_photoconfirmationcontrol.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.media.devices.photoconfirmationcontrol
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class PhotoConfirmationControl extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPhotoConfirmationControl

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPhotoConfirmationControl.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value indicating whether photo confirmation is supported by the capture device.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.photoconfirmationcontrol.supported
     * @type {Boolean} 
     */
    Supported {
        get => this.get_Supported()
    }

    /**
     * Gets or sets a value indicating whether photo confirmation is enabled.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.photoconfirmationcontrol.enabled
     * @type {Boolean} 
     */
    Enabled {
        get => this.get_Enabled()
        set => this.put_Enabled(value)
    }

    /**
     * Gets or sets the desired pixel format for photo confirmation frames.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.photoconfirmationcontrol.pixelformat
     * @type {Integer} 
     */
    PixelFormat {
        get => this.get_PixelFormat()
        set => this.put_PixelFormat(value)
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
        if (!this.HasProp("__IPhotoConfirmationControl")) {
            if ((queryResult := this.QueryInterface(IPhotoConfirmationControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoConfirmationControl := IPhotoConfirmationControl(outPtr)
        }

        return this.__IPhotoConfirmationControl.get_Supported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Enabled() {
        if (!this.HasProp("__IPhotoConfirmationControl")) {
            if ((queryResult := this.QueryInterface(IPhotoConfirmationControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoConfirmationControl := IPhotoConfirmationControl(outPtr)
        }

        return this.__IPhotoConfirmationControl.get_Enabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Enabled(value) {
        if (!this.HasProp("__IPhotoConfirmationControl")) {
            if ((queryResult := this.QueryInterface(IPhotoConfirmationControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoConfirmationControl := IPhotoConfirmationControl(outPtr)
        }

        return this.__IPhotoConfirmationControl.put_Enabled(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PixelFormat() {
        if (!this.HasProp("__IPhotoConfirmationControl")) {
            if ((queryResult := this.QueryInterface(IPhotoConfirmationControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoConfirmationControl := IPhotoConfirmationControl(outPtr)
        }

        return this.__IPhotoConfirmationControl.get_PixelFormat()
    }

    /**
     * 
     * @param {Integer} format 
     * @returns {HRESULT} 
     */
    put_PixelFormat(format) {
        if (!this.HasProp("__IPhotoConfirmationControl")) {
            if ((queryResult := this.QueryInterface(IPhotoConfirmationControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhotoConfirmationControl := IPhotoConfirmationControl(outPtr)
        }

        return this.__IPhotoConfirmationControl.put_PixelFormat(format)
    }

;@endregion Instance Methods
}

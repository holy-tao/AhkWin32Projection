#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICameraCaptureUIPhotoCaptureSettings.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides settings for capturing photos with [CameraCaptureUI](cameracaptureui.md). The settings include aspect ratio, image size, format, resolution, and whether or not cropping is allowed by the user interface (UI).
 * @remarks
 * To get an instance of this object, retrieve the [PhotoSettings](cameracaptureui_photosettings.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.cameracaptureuiphotocapturesettings
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class CameraCaptureUIPhotoCaptureSettings extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICameraCaptureUIPhotoCaptureSettings

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICameraCaptureUIPhotoCaptureSettings.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Determines the format that captured photos will be stored in.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.cameracaptureuiphotocapturesettings.format
     * @type {Integer} 
     */
    Format {
        get => this.get_Format()
        set => this.put_Format(value)
    }

    /**
     * Determines the maximum resolution the user will be able to select.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.cameracaptureuiphotocapturesettings.maxresolution
     * @type {Integer} 
     */
    MaxResolution {
        get => this.get_MaxResolution()
        set => this.put_MaxResolution(value)
    }

    /**
     * The exact size in pixels of the captured photo.
     * @remarks
     * Imaging cropping in the [CameraCaptureUI](cameracaptureui.md) is not supported for devices in the Mobile device family. The value of the **CroppedSizeInPixels** property is ignored when your app is running on these devices.
     * 
     * If size is provided, the user interface for cropping photos will force the user to crop the photo to the specified size.
     * 
     * If a size is specified that is larger than any available resolution, then the captured photo will be scaled to a large enough size first.
     * 
     * Setting this property requires that the [MaxResolution](cameracaptureuiphotocapturesettings_maxresolution.md) property is set to **HighestAvailable** and the [AllowCropping](cameracaptureuiphotocapturesettings_allowcropping.md) property is set to True.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.cameracaptureuiphotocapturesettings.croppedsizeinpixels
     * @type {SIZE} 
     */
    CroppedSizeInPixels {
        get => this.get_CroppedSizeInPixels()
        set => this.put_CroppedSizeInPixels(value)
    }

    /**
     * The aspect ratio of the captured photo.
     * @remarks
     * Imaging cropping in the [CameraCaptureUI](cameracaptureui.md) is not supported for devices in the Mobile device family. The value of the **CroppedAspectRatio** property is ignored when your app is running on these devices.
     * 
     * If a non-zero value is provided, the user interface will force the user to crop the photo to the specified aspect ratio.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.cameracaptureuiphotocapturesettings.croppedaspectratio
     * @type {SIZE} 
     */
    CroppedAspectRatio {
        get => this.get_CroppedAspectRatio()
        set => this.put_CroppedAspectRatio(value)
    }

    /**
     * Determines whether photo cropping will be enabled in the user interface for capture a photo.
     * @remarks
     * Imaging cropping in the **CameraCaptureUI** is not supported for devices in the Mobile device family. The value of the **AllowCropping** property is ignored when your app is running on these devices.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.cameracaptureuiphotocapturesettings.allowcropping
     * @type {Boolean} 
     */
    AllowCropping {
        get => this.get_AllowCropping()
        set => this.put_AllowCropping(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Format() {
        if (!this.HasProp("__ICameraCaptureUIPhotoCaptureSettings")) {
            if ((queryResult := this.QueryInterface(ICameraCaptureUIPhotoCaptureSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICameraCaptureUIPhotoCaptureSettings := ICameraCaptureUIPhotoCaptureSettings(outPtr)
        }

        return this.__ICameraCaptureUIPhotoCaptureSettings.get_Format()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Format(value) {
        if (!this.HasProp("__ICameraCaptureUIPhotoCaptureSettings")) {
            if ((queryResult := this.QueryInterface(ICameraCaptureUIPhotoCaptureSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICameraCaptureUIPhotoCaptureSettings := ICameraCaptureUIPhotoCaptureSettings(outPtr)
        }

        return this.__ICameraCaptureUIPhotoCaptureSettings.put_Format(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxResolution() {
        if (!this.HasProp("__ICameraCaptureUIPhotoCaptureSettings")) {
            if ((queryResult := this.QueryInterface(ICameraCaptureUIPhotoCaptureSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICameraCaptureUIPhotoCaptureSettings := ICameraCaptureUIPhotoCaptureSettings(outPtr)
        }

        return this.__ICameraCaptureUIPhotoCaptureSettings.get_MaxResolution()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_MaxResolution(value) {
        if (!this.HasProp("__ICameraCaptureUIPhotoCaptureSettings")) {
            if ((queryResult := this.QueryInterface(ICameraCaptureUIPhotoCaptureSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICameraCaptureUIPhotoCaptureSettings := ICameraCaptureUIPhotoCaptureSettings(outPtr)
        }

        return this.__ICameraCaptureUIPhotoCaptureSettings.put_MaxResolution(value)
    }

    /**
     * 
     * @returns {SIZE} 
     */
    get_CroppedSizeInPixels() {
        if (!this.HasProp("__ICameraCaptureUIPhotoCaptureSettings")) {
            if ((queryResult := this.QueryInterface(ICameraCaptureUIPhotoCaptureSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICameraCaptureUIPhotoCaptureSettings := ICameraCaptureUIPhotoCaptureSettings(outPtr)
        }

        return this.__ICameraCaptureUIPhotoCaptureSettings.get_CroppedSizeInPixels()
    }

    /**
     * 
     * @param {SIZE} value 
     * @returns {HRESULT} 
     */
    put_CroppedSizeInPixels(value) {
        if (!this.HasProp("__ICameraCaptureUIPhotoCaptureSettings")) {
            if ((queryResult := this.QueryInterface(ICameraCaptureUIPhotoCaptureSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICameraCaptureUIPhotoCaptureSettings := ICameraCaptureUIPhotoCaptureSettings(outPtr)
        }

        return this.__ICameraCaptureUIPhotoCaptureSettings.put_CroppedSizeInPixels(value)
    }

    /**
     * 
     * @returns {SIZE} 
     */
    get_CroppedAspectRatio() {
        if (!this.HasProp("__ICameraCaptureUIPhotoCaptureSettings")) {
            if ((queryResult := this.QueryInterface(ICameraCaptureUIPhotoCaptureSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICameraCaptureUIPhotoCaptureSettings := ICameraCaptureUIPhotoCaptureSettings(outPtr)
        }

        return this.__ICameraCaptureUIPhotoCaptureSettings.get_CroppedAspectRatio()
    }

    /**
     * 
     * @param {SIZE} value 
     * @returns {HRESULT} 
     */
    put_CroppedAspectRatio(value) {
        if (!this.HasProp("__ICameraCaptureUIPhotoCaptureSettings")) {
            if ((queryResult := this.QueryInterface(ICameraCaptureUIPhotoCaptureSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICameraCaptureUIPhotoCaptureSettings := ICameraCaptureUIPhotoCaptureSettings(outPtr)
        }

        return this.__ICameraCaptureUIPhotoCaptureSettings.put_CroppedAspectRatio(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AllowCropping() {
        if (!this.HasProp("__ICameraCaptureUIPhotoCaptureSettings")) {
            if ((queryResult := this.QueryInterface(ICameraCaptureUIPhotoCaptureSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICameraCaptureUIPhotoCaptureSettings := ICameraCaptureUIPhotoCaptureSettings(outPtr)
        }

        return this.__ICameraCaptureUIPhotoCaptureSettings.get_AllowCropping()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AllowCropping(value) {
        if (!this.HasProp("__ICameraCaptureUIPhotoCaptureSettings")) {
            if ((queryResult := this.QueryInterface(ICameraCaptureUIPhotoCaptureSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICameraCaptureUIPhotoCaptureSettings := ICameraCaptureUIPhotoCaptureSettings(outPtr)
        }

        return this.__ICameraCaptureUIPhotoCaptureSettings.put_AllowCropping(value)
    }

;@endregion Instance Methods
}

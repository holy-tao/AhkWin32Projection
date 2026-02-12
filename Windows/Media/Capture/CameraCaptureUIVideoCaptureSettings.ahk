#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICameraCaptureUIVideoCaptureSettings.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides settings for capturing videos. The settings include format, maximum resolution, maximum duration, and whether or not to allow trimming.
 * @remarks
 * To get an instance of this object, retrieve the [VideoSettings](cameracaptureui_videosettings.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.cameracaptureuivideocapturesettings
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class CameraCaptureUIVideoCaptureSettings extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICameraCaptureUIVideoCaptureSettings

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICameraCaptureUIVideoCaptureSettings.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Determines the format for storing captured videos.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.cameracaptureuivideocapturesettings.format
     * @type {Integer} 
     */
    Format {
        get => this.get_Format()
        set => this.put_Format(value)
    }

    /**
     * Determines the maximum resolution that the user can select.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.cameracaptureuivideocapturesettings.maxresolution
     * @type {Integer} 
     */
    MaxResolution {
        get => this.get_MaxResolution()
        set => this.put_MaxResolution(value)
    }

    /**
     * Determines the maximum duration of a video.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.cameracaptureuivideocapturesettings.maxdurationinseconds
     * @type {Float} 
     */
    MaxDurationInSeconds {
        get => this.get_MaxDurationInSeconds()
        set => this.put_MaxDurationInSeconds(value)
    }

    /**
     * Determines whether or not the video trimming user interface will be enabled.
     * @remarks
     * Video trimming in the **CameraCaptureUI** is not supported for devices in the Mobile device family. The value of the **AllowTrimming** property is ignored when your app is running on these devices.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.cameracaptureuivideocapturesettings.allowtrimming
     * @type {Boolean} 
     */
    AllowTrimming {
        get => this.get_AllowTrimming()
        set => this.put_AllowTrimming(value)
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
        if (!this.HasProp("__ICameraCaptureUIVideoCaptureSettings")) {
            if ((queryResult := this.QueryInterface(ICameraCaptureUIVideoCaptureSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICameraCaptureUIVideoCaptureSettings := ICameraCaptureUIVideoCaptureSettings(outPtr)
        }

        return this.__ICameraCaptureUIVideoCaptureSettings.get_Format()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Format(value) {
        if (!this.HasProp("__ICameraCaptureUIVideoCaptureSettings")) {
            if ((queryResult := this.QueryInterface(ICameraCaptureUIVideoCaptureSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICameraCaptureUIVideoCaptureSettings := ICameraCaptureUIVideoCaptureSettings(outPtr)
        }

        return this.__ICameraCaptureUIVideoCaptureSettings.put_Format(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxResolution() {
        if (!this.HasProp("__ICameraCaptureUIVideoCaptureSettings")) {
            if ((queryResult := this.QueryInterface(ICameraCaptureUIVideoCaptureSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICameraCaptureUIVideoCaptureSettings := ICameraCaptureUIVideoCaptureSettings(outPtr)
        }

        return this.__ICameraCaptureUIVideoCaptureSettings.get_MaxResolution()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_MaxResolution(value) {
        if (!this.HasProp("__ICameraCaptureUIVideoCaptureSettings")) {
            if ((queryResult := this.QueryInterface(ICameraCaptureUIVideoCaptureSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICameraCaptureUIVideoCaptureSettings := ICameraCaptureUIVideoCaptureSettings(outPtr)
        }

        return this.__ICameraCaptureUIVideoCaptureSettings.put_MaxResolution(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MaxDurationInSeconds() {
        if (!this.HasProp("__ICameraCaptureUIVideoCaptureSettings")) {
            if ((queryResult := this.QueryInterface(ICameraCaptureUIVideoCaptureSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICameraCaptureUIVideoCaptureSettings := ICameraCaptureUIVideoCaptureSettings(outPtr)
        }

        return this.__ICameraCaptureUIVideoCaptureSettings.get_MaxDurationInSeconds()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_MaxDurationInSeconds(value) {
        if (!this.HasProp("__ICameraCaptureUIVideoCaptureSettings")) {
            if ((queryResult := this.QueryInterface(ICameraCaptureUIVideoCaptureSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICameraCaptureUIVideoCaptureSettings := ICameraCaptureUIVideoCaptureSettings(outPtr)
        }

        return this.__ICameraCaptureUIVideoCaptureSettings.put_MaxDurationInSeconds(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AllowTrimming() {
        if (!this.HasProp("__ICameraCaptureUIVideoCaptureSettings")) {
            if ((queryResult := this.QueryInterface(ICameraCaptureUIVideoCaptureSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICameraCaptureUIVideoCaptureSettings := ICameraCaptureUIVideoCaptureSettings(outPtr)
        }

        return this.__ICameraCaptureUIVideoCaptureSettings.get_AllowTrimming()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AllowTrimming(value) {
        if (!this.HasProp("__ICameraCaptureUIVideoCaptureSettings")) {
            if ((queryResult := this.QueryInterface(ICameraCaptureUIVideoCaptureSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICameraCaptureUIVideoCaptureSettings := ICameraCaptureUIVideoCaptureSettings(outPtr)
        }

        return this.__ICameraCaptureUIVideoCaptureSettings.put_AllowTrimming(value)
    }

;@endregion Instance Methods
}

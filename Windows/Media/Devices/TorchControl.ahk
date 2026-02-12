#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ITorchControl.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides functionality for controlling the torch LED settings on a capture device.
 * @remarks
 * The TorchControl enables apps to manage the torch LED on a device. This can used in capture apps or in non-capture app to do things like brighten a room.
 * 
 * You can find out if a device supports this control by checking [TorchControl.Supported](torchcontrol_supported.md).
 * 
 * You can access the TorchControl for the capture device through [MediaCapture.VideoDeviceController](../windows.media.capture/mediacapture_videodevicecontroller.md).
 * 
 * For how-to guidance for using the **TorchControl**, see [Camera-independent Flashlight](/windows/uwp/audio-video-camera/camera-independent-flashlight).
 * @see https://learn.microsoft.com/uwp/api/windows.media.devices.torchcontrol
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class TorchControl extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITorchControl

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITorchControl.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value that specifies if the capture device supports the torch control.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.torchcontrol.supported
     * @type {Boolean} 
     */
    Supported {
        get => this.get_Supported()
    }

    /**
     * Gets a value that specifics if the device allows the torch LED power settings to be changed.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.torchcontrol.powersupported
     * @type {Boolean} 
     */
    PowerSupported {
        get => this.get_PowerSupported()
    }

    /**
     * Gets or sets a value that enables and disables the torch LED on the device.
     * @remarks
     * On some devices the torch will not emit light, even if **Enabled** is set to true, unless the device has a preview stream running and is actively capturing video. The recommended order of operations is to turn on the video preview, then turn on the torch by setting **Enabled** to true, and then initiate video capture. On some devices the torch will light up after the preview is started. On other devices, the torch may not light up until video capture is started.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.torchcontrol.enabled
     * @type {Boolean} 
     */
    Enabled {
        get => this.get_Enabled()
        set => this.put_Enabled(value)
    }

    /**
     * Gets or sets the intensity of the torch LED.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.torchcontrol.powerpercent
     * @type {Float} 
     */
    PowerPercent {
        get => this.get_PowerPercent()
        set => this.put_PowerPercent(value)
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
        if (!this.HasProp("__ITorchControl")) {
            if ((queryResult := this.QueryInterface(ITorchControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITorchControl := ITorchControl(outPtr)
        }

        return this.__ITorchControl.get_Supported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_PowerSupported() {
        if (!this.HasProp("__ITorchControl")) {
            if ((queryResult := this.QueryInterface(ITorchControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITorchControl := ITorchControl(outPtr)
        }

        return this.__ITorchControl.get_PowerSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Enabled() {
        if (!this.HasProp("__ITorchControl")) {
            if ((queryResult := this.QueryInterface(ITorchControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITorchControl := ITorchControl(outPtr)
        }

        return this.__ITorchControl.get_Enabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Enabled(value) {
        if (!this.HasProp("__ITorchControl")) {
            if ((queryResult := this.QueryInterface(ITorchControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITorchControl := ITorchControl(outPtr)
        }

        return this.__ITorchControl.put_Enabled(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_PowerPercent() {
        if (!this.HasProp("__ITorchControl")) {
            if ((queryResult := this.QueryInterface(ITorchControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITorchControl := ITorchControl(outPtr)
        }

        return this.__ITorchControl.get_PowerPercent()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_PowerPercent(value) {
        if (!this.HasProp("__ITorchControl")) {
            if ((queryResult := this.QueryInterface(ITorchControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITorchControl := ITorchControl(outPtr)
        }

        return this.__ITorchControl.put_PowerPercent(value)
    }

;@endregion Instance Methods
}

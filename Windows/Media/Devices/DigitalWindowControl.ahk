#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDigitalWindowControl.ahk
#Include ..\..\..\Guid.ahk

/**
 * Allows apps to capture a subregion of the capture device's sensor. For cameras that offer high-resolution native sensors, this feature enables digital pan, tilt, and zoom  and allow apps to obtain higher detail images of such objects without the need to change media resolutions.
 * @remarks
 * Access the **DigitalWindowControl** for the capture device by accessing the [MediaCapture.VideoDeviceController](../windows.media.capture/mediacapture_videodevicecontroller.md) property and then the [VideoDeviceController.DigitalWindowControl](videodevicecontroller_digitalwindowcontrol.md) property. Determine if the controls is supported by the capture device by checking [DigitalWindowControl.IsSupported](digitalwindowcontrol_issupported.md).
 * 
 * For more information on using the **DigitalWindowControl** in your app, see [Manual camera controls for photo and video capture](/windows/uwp/audio-video-camera/capture-device-controls-for-photo-and-video-capture).
 * @see https://learn.microsoft.com/uwp/api/windows.media.devices.digitalwindowcontrol
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class DigitalWindowControl extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDigitalWindowControl

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDigitalWindowControl.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a boolean value that indicates whether [DigitalWindowControl](digitalwindowcontrol.md) is supported on the capture device.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.digitalwindowcontrol.issupported
     * @type {Boolean} 
     */
    IsSupported {
        get => this.get_IsSupported()
    }

    /**
     * Gets an array of values from the [DigitalWindowMode](digitalwindowmode.md) enumeration indicating the modes supported by the capture device.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.digitalwindowcontrol.supportedmodes
     */
    SupportedModes {
        get => this.get_SupportedModes()
    }

    /**
     * Gets a value from the [DigitalWindowMode](digitalwindowmode.md) enumeration specifying the current mode of the [DigitalWindowControl](digitalwindowcontrol.md).
     * @remarks
     * Set the mode of the **DigitalWindowControl** by calling [DigitalWindowControl.Configure](digitalwindowcontrol_configure_1826541684.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.digitalwindowcontrol.currentmode
     * @type {Integer} 
     */
    CurrentMode {
        get => this.get_CurrentMode()
    }

    /**
     * Gets a read-only list of [DigitalWindowCapability](digitalwindowcapability.md) objects describing the capabilities of the capture device.
     * @remarks
     * The digital window capabilities of the capture device may vary depending on the resolution at which frames are captured. The **DigitalWindowCapability** objects returned by this method specify the width and height for which the capabilities are supported. To get the capabilities for a specific resolution, call [DigitalWindowControl.GetCapabilityForSize](digitalwindowcontrol_getcapabilityforsize_1381309850.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.digitalwindowcontrol.supportedcapabilities
     * @type {IVectorView<DigitalWindowCapability>} 
     */
    SupportedCapabilities {
        get => this.get_SupportedCapabilities()
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
    get_IsSupported() {
        if (!this.HasProp("__IDigitalWindowControl")) {
            if ((queryResult := this.QueryInterface(IDigitalWindowControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDigitalWindowControl := IDigitalWindowControl(outPtr)
        }

        return this.__IDigitalWindowControl.get_IsSupported()
    }

    /**
     * 
     * @param {Pointer<Pointer>} value 
     * @returns {HRESULT} 
     */
    get_SupportedModes(value) {
        if (!this.HasProp("__IDigitalWindowControl")) {
            if ((queryResult := this.QueryInterface(IDigitalWindowControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDigitalWindowControl := IDigitalWindowControl(outPtr)
        }

        return this.__IDigitalWindowControl.get_SupportedModes(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CurrentMode() {
        if (!this.HasProp("__IDigitalWindowControl")) {
            if ((queryResult := this.QueryInterface(IDigitalWindowControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDigitalWindowControl := IDigitalWindowControl(outPtr)
        }

        return this.__IDigitalWindowControl.get_CurrentMode()
    }

    /**
     * Gets a [DigitalWindowBounds](digitalwindowbounds.md) object representing the bounds of the current digital window.
     * @remarks
     * Set the digital window bounds by calling [DigitalWindowControl.Configure](digitalwindowcontrol_configure_1826541684.md).
     * @returns {DigitalWindowBounds} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.digitalwindowcontrol.getbounds
     */
    GetBounds() {
        if (!this.HasProp("__IDigitalWindowControl")) {
            if ((queryResult := this.QueryInterface(IDigitalWindowControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDigitalWindowControl := IDigitalWindowControl(outPtr)
        }

        return this.__IDigitalWindowControl.GetBounds()
    }

    /**
     * Configures the [DigitalWindowControl](digitalwindowcontrol.md) to use the specified mode.
     * @remarks
     * The other overload of the [Configure](digitalwindowcontrol_configure_1826541684.md) method allows you to configure the bounds of the digital window.
     * @param {Integer} digitalWindowMode_ A value from the [DigitalWindowMode](digitalwindowmode.md) enumeration specifying the mode that the control is configured to use.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.digitalwindowcontrol.configure
     */
    Configure(digitalWindowMode_) {
        if (!this.HasProp("__IDigitalWindowControl")) {
            if ((queryResult := this.QueryInterface(IDigitalWindowControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDigitalWindowControl := IDigitalWindowControl(outPtr)
        }

        return this.__IDigitalWindowControl.Configure(digitalWindowMode_)
    }

    /**
     * Configures the [DigitalWindowControl](digitalwindowcontrol.md) to use the specified mode and bounds.
     * @param {Integer} digitalWindowMode_ A value from the [DigitalWindowMode](digitalwindowmode.md) enumeration specifying the mode that the control is configured to use.
     * @param {DigitalWindowBounds} digitalWindowBounds_ A [DigitalWindowBounds](digitalwindowbounds.md) object that defines the bounds of the digital window.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.digitalwindowcontrol.configure
     */
    ConfigureWithBounds(digitalWindowMode_, digitalWindowBounds_) {
        if (!this.HasProp("__IDigitalWindowControl")) {
            if ((queryResult := this.QueryInterface(IDigitalWindowControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDigitalWindowControl := IDigitalWindowControl(outPtr)
        }

        return this.__IDigitalWindowControl.ConfigureWithBounds(digitalWindowMode_, digitalWindowBounds_)
    }

    /**
     * 
     * @returns {IVectorView<DigitalWindowCapability>} 
     */
    get_SupportedCapabilities() {
        if (!this.HasProp("__IDigitalWindowControl")) {
            if ((queryResult := this.QueryInterface(IDigitalWindowControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDigitalWindowControl := IDigitalWindowControl(outPtr)
        }

        return this.__IDigitalWindowControl.get_SupportedCapabilities()
    }

    /**
     * Gets a [DigitalWindowCapability](digitalwindowcapability.md) object that specifies the digital window capabilities of the capture device for the specified capture resolution.
     * @param {Integer} width The width of the capture resolution for which capabilities are retrieved.
     * @param {Integer} height The height of the capture resolution for which capabilities are retrieved.
     * @returns {DigitalWindowCapability} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.digitalwindowcontrol.getcapabilityforsize
     */
    GetCapabilityForSize(width, height) {
        if (!this.HasProp("__IDigitalWindowControl")) {
            if ((queryResult := this.QueryInterface(IDigitalWindowControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDigitalWindowControl := IDigitalWindowControl(outPtr)
        }

        return this.__IDigitalWindowControl.GetCapabilityForSize(width, height)
    }

;@endregion Instance Methods
}

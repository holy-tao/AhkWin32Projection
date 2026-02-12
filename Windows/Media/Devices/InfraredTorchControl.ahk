#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IInfraredTorchControl.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides functionality for controlling the infrared torch LED settings on a capture device.
 * @remarks
 * The InfraredTorchControl enables apps to control the power and behavior of the Infrared LED. 
 * 
 * You can find out if a device supports this control by checking [InfraredTorchControl.IsSupported](infraredtorchcontrol_issupported.md).
 * 
 * You can access the InfraredTorchControl for the capture device through [MediaCapture.VideoDeviceController](../windows.media.capture/mediacapture_videodevicecontroller.md).
 * @see https://learn.microsoft.com/uwp/api/windows.media.devices.infraredtorchcontrol
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class InfraredTorchControl extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IInfraredTorchControl

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IInfraredTorchControl.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value that indicates if the capture device supports the [InfraredTorchControl](infraredtorchcontrol.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.infraredtorchcontrol.issupported
     * @type {Boolean} 
     */
    IsSupported {
        get => this.get_IsSupported()
    }

    /**
     * SupportedModes property is used to find out modes that the infrared LED supports.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.infraredtorchcontrol.supportedmodes
     * @type {IVectorView<Integer>} 
     */
    SupportedModes {
        get => this.get_SupportedModes()
    }

    /**
     * Gets the current operation mode of the infrared LED.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.infraredtorchcontrol.currentmode
     * @type {Integer} 
     */
    CurrentMode {
        get => this.get_CurrentMode()
        set => this.put_CurrentMode(value)
    }

    /**
     * Gets the minimum infrared LED power value supported by the capture device.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.infraredtorchcontrol.minpower
     * @type {Integer} 
     */
    MinPower {
        get => this.get_MinPower()
    }

    /**
     * Gets the maximum infrared LED power value supported by the capture device.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.infraredtorchcontrol.maxpower
     * @type {Integer} 
     */
    MaxPower {
        get => this.get_MaxPower()
    }

    /**
     * Gets the supported power step value.
     * @remarks
     * Determines step size value that must be honored when setting new [InfraredTorchControl.Power](infraredtorchcontrol_power.md) values.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.infraredtorchcontrol.powerstep
     * @type {Integer} 
     */
    PowerStep {
        get => this.get_PowerStep()
    }

    /**
     * Gets or sets the current infrared LED power value.
     * @remarks
     * The power value shall satisfy this condition: **[MinPower](infraredtorchcontrol_minpower.md) ≤ [Power Value ≤ [MaxPower](infraredtorchcontrol_maxpower.md)** where **([Power Value - [Min](infraredtorchcontrol_minpower.md)) mod [PowerStep](infraredtorchcontrol_powerstep.md) = 0**.
     * 
     * E.g., if [PowerStep](infraredtorchcontrol_powerstep.md) is 5 and current [Power Value is 50 accepted new values are in 5 increment or decrement as long they are in valid range determined by [MinPower](infraredtorchcontrol_minpower.md) and [MaxPower](infraredtorchcontrol_maxpower.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.infraredtorchcontrol.power
     * @type {Integer} 
     */
    Power {
        get => this.get_Power()
        set => this.put_Power(value)
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
        if (!this.HasProp("__IInfraredTorchControl")) {
            if ((queryResult := this.QueryInterface(IInfraredTorchControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInfraredTorchControl := IInfraredTorchControl(outPtr)
        }

        return this.__IInfraredTorchControl.get_IsSupported()
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    get_SupportedModes() {
        if (!this.HasProp("__IInfraredTorchControl")) {
            if ((queryResult := this.QueryInterface(IInfraredTorchControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInfraredTorchControl := IInfraredTorchControl(outPtr)
        }

        return this.__IInfraredTorchControl.get_SupportedModes()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CurrentMode() {
        if (!this.HasProp("__IInfraredTorchControl")) {
            if ((queryResult := this.QueryInterface(IInfraredTorchControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInfraredTorchControl := IInfraredTorchControl(outPtr)
        }

        return this.__IInfraredTorchControl.get_CurrentMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_CurrentMode(value) {
        if (!this.HasProp("__IInfraredTorchControl")) {
            if ((queryResult := this.QueryInterface(IInfraredTorchControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInfraredTorchControl := IInfraredTorchControl(outPtr)
        }

        return this.__IInfraredTorchControl.put_CurrentMode(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MinPower() {
        if (!this.HasProp("__IInfraredTorchControl")) {
            if ((queryResult := this.QueryInterface(IInfraredTorchControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInfraredTorchControl := IInfraredTorchControl(outPtr)
        }

        return this.__IInfraredTorchControl.get_MinPower()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxPower() {
        if (!this.HasProp("__IInfraredTorchControl")) {
            if ((queryResult := this.QueryInterface(IInfraredTorchControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInfraredTorchControl := IInfraredTorchControl(outPtr)
        }

        return this.__IInfraredTorchControl.get_MaxPower()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PowerStep() {
        if (!this.HasProp("__IInfraredTorchControl")) {
            if ((queryResult := this.QueryInterface(IInfraredTorchControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInfraredTorchControl := IInfraredTorchControl(outPtr)
        }

        return this.__IInfraredTorchControl.get_PowerStep()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Power() {
        if (!this.HasProp("__IInfraredTorchControl")) {
            if ((queryResult := this.QueryInterface(IInfraredTorchControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInfraredTorchControl := IInfraredTorchControl(outPtr)
        }

        return this.__IInfraredTorchControl.get_Power()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Power(value) {
        if (!this.HasProp("__IInfraredTorchControl")) {
            if ((queryResult := this.QueryInterface(IInfraredTorchControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInfraredTorchControl := IInfraredTorchControl(outPtr)
        }

        return this.__IInfraredTorchControl.put_Power(value)
    }

;@endregion Instance Methods
}

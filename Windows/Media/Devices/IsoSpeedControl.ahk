#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IIsoSpeedControl.ahk
#Include .\IIsoSpeedControl2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides functionality for controlling the ISO film speed settings on a capture device.
 * @remarks
 * You can find out if a device supports this control by checking [IsoSpeedControl.Supported](isospeedcontrol_supported.md).
 * 
 * You can access the IsoSpeedControl for the capture device through [MediaCapture.VideoDeviceController](../windows.media.capture/mediacapture_videodevicecontroller.md).
 * 
 * The IsoSpeedControl enables apps to manage the ISO speed settings on a device. For example, in low-light conditions, apps may prefer higher noise level in return for higher overall brightness. The ISO speed control lets apps adjust tradeoffs such as this.
 * 
 * Use [SetPresetAsync](isospeedcontrol_setpresetasync_1340401685.md) to set the ISO level to one of the [IsoSpeedPreset](isospeedpreset.md) values.
 * 
 * [SupportedPresets](isospeedcontrol_supportedpresets.md) lists the preset values that are support on the device.
 * 
 * For how-to guidance for using the **FocusControl**, see [Manual camera controls for photo and video capture](/windows/uwp/audio-video-camera/capture-device-controls-for-photo-and-video-capture).
 * @see https://learn.microsoft.com/uwp/api/windows.media.devices.isospeedcontrol
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class IsoSpeedControl extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IIsoSpeedControl

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IIsoSpeedControl.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value the specifies if the capture device supports the ISO speed control.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.isospeedcontrol.supported
     * @type {Boolean} 
     */
    Supported {
        get => this.get_Supported()
    }

    /**
     * Gets the ISO presets that the capture device supports.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.isospeedcontrol.supportedpresets
     * @type {IVectorView<Integer>} 
     */
    SupportedPresets {
        get => this.get_SupportedPresets()
    }

    /**
     * Gets the ISO film speed preset.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.isospeedcontrol.preset
     * @type {Integer} 
     */
    Preset {
        get => this.get_Preset()
    }

    /**
     * Gets the minimum ISO speed supported by the capture device.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.isospeedcontrol.min
     * @type {Integer} 
     */
    Min {
        get => this.get_Min()
    }

    /**
     * Gets the maximum ISO speed supported by the capture device.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.isospeedcontrol.max
     * @type {Integer} 
     */
    Max {
        get => this.get_Max()
    }

    /**
     * Gets the smallest ISO speed increment supported by the capture device.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.isospeedcontrol.step
     * @type {Integer} 
     */
    Step {
        get => this.get_Step()
    }

    /**
     * Gets the current ISO speed value.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.isospeedcontrol.value
     * @type {Integer} 
     */
    Value {
        get => this.get_Value()
    }

    /**
     * Gets a value indicating whether auto ISO speed is enabled.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.isospeedcontrol.auto
     * @type {Boolean} 
     */
    Auto {
        get => this.get_Auto()
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
        if (!this.HasProp("__IIsoSpeedControl")) {
            if ((queryResult := this.QueryInterface(IIsoSpeedControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIsoSpeedControl := IIsoSpeedControl(outPtr)
        }

        return this.__IIsoSpeedControl.get_Supported()
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    get_SupportedPresets() {
        if (!this.HasProp("__IIsoSpeedControl")) {
            if ((queryResult := this.QueryInterface(IIsoSpeedControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIsoSpeedControl := IIsoSpeedControl(outPtr)
        }

        return this.__IIsoSpeedControl.get_SupportedPresets()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Preset() {
        if (!this.HasProp("__IIsoSpeedControl")) {
            if ((queryResult := this.QueryInterface(IIsoSpeedControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIsoSpeedControl := IIsoSpeedControl(outPtr)
        }

        return this.__IIsoSpeedControl.get_Preset()
    }

    /**
     * Asynchronously sets the ISO film speed [Preset](isospeedcontrol_preset.md).
     * @param {Integer} preset The ISO preset value to set the [Preset](isospeedcontrol_preset.md) property to.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.isospeedcontrol.setpresetasync
     */
    SetPresetAsync(preset) {
        if (!this.HasProp("__IIsoSpeedControl")) {
            if ((queryResult := this.QueryInterface(IIsoSpeedControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIsoSpeedControl := IIsoSpeedControl(outPtr)
        }

        return this.__IIsoSpeedControl.SetPresetAsync(preset)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Min() {
        if (!this.HasProp("__IIsoSpeedControl2")) {
            if ((queryResult := this.QueryInterface(IIsoSpeedControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIsoSpeedControl2 := IIsoSpeedControl2(outPtr)
        }

        return this.__IIsoSpeedControl2.get_Min()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Max() {
        if (!this.HasProp("__IIsoSpeedControl2")) {
            if ((queryResult := this.QueryInterface(IIsoSpeedControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIsoSpeedControl2 := IIsoSpeedControl2(outPtr)
        }

        return this.__IIsoSpeedControl2.get_Max()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Step() {
        if (!this.HasProp("__IIsoSpeedControl2")) {
            if ((queryResult := this.QueryInterface(IIsoSpeedControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIsoSpeedControl2 := IIsoSpeedControl2(outPtr)
        }

        return this.__IIsoSpeedControl2.get_Step()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Value() {
        if (!this.HasProp("__IIsoSpeedControl2")) {
            if ((queryResult := this.QueryInterface(IIsoSpeedControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIsoSpeedControl2 := IIsoSpeedControl2(outPtr)
        }

        return this.__IIsoSpeedControl2.get_Value()
    }

    /**
     * Sets the ISO speed value.
     * @param {Integer} isoSpeed The ISO speed value.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.isospeedcontrol.setvalueasync
     */
    SetValueAsync(isoSpeed) {
        if (!this.HasProp("__IIsoSpeedControl2")) {
            if ((queryResult := this.QueryInterface(IIsoSpeedControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIsoSpeedControl2 := IIsoSpeedControl2(outPtr)
        }

        return this.__IIsoSpeedControl2.SetValueAsync(isoSpeed)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Auto() {
        if (!this.HasProp("__IIsoSpeedControl2")) {
            if ((queryResult := this.QueryInterface(IIsoSpeedControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIsoSpeedControl2 := IIsoSpeedControl2(outPtr)
        }

        return this.__IIsoSpeedControl2.get_Auto()
    }

    /**
     * Sets the ISO speed to automatic.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.isospeedcontrol.setautoasync
     */
    SetAutoAsync() {
        if (!this.HasProp("__IIsoSpeedControl2")) {
            if ((queryResult := this.QueryInterface(IIsoSpeedControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIsoSpeedControl2 := IIsoSpeedControl2(outPtr)
        }

        return this.__IIsoSpeedControl2.SetAutoAsync()
    }

;@endregion Instance Methods
}

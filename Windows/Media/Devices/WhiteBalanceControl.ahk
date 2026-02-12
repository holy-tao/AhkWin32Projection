#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWhiteBalanceControl.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides functionality for controlling the white balance settings on a capture device.
 * @remarks
 * The WhiteBalanceControl gives apps additional control over the white balance settings on a device. You can use one of the [ColorTemperaturePreset](colortemperaturepreset.md) values by calling [SetPresetAsync](whitebalancecontrol_setpresetasync_1724838565.md). Or call [SetValueAsync](whitebalancecontrol_setvalueasync_2096210171.md) to set a specific [Value](whitebalancecontrol_value.md) between the [Min](whitebalancecontrol_min.md) and [Max ](whitebalancecontrol_max.md).
 * 
 * You can find out if a device supports this control by checking [WhiteBalanceControl.Supported](whitebalancecontrol_supported.md).
 * 
 * If the device does not support the WhiteBalanceControl, you can still use the [WhiteBalance](videodevicecontroller_whitebalance.md) on the [VideoCaptureDevice](https://msdn.microsoft.com/library/afba2768-11a0-4105-a5b1-c48bc961e9ed) to set the value for the white balance color temperature.
 * 
 * You can access the WhiteBalanceControl for the capture device through [MediaCapture.VideoDeviceController](../windows.media.capture/mediacapture_videodevicecontroller.md).
 * 
 * White balance is specified as a color temperature in degrees Kelvin.
 * 
 * For how-to guidance for using the **FocusControl**, see [Manual camera controls for photo and video capture](/windows/uwp/audio-video-camera/capture-device-controls-for-photo-and-video-capture).
 * @see https://learn.microsoft.com/uwp/api/windows.media.devices.whitebalancecontrol
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class WhiteBalanceControl extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWhiteBalanceControl

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWhiteBalanceControl.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value that specifies if the capture device supports the white balance control.
     * @remarks
     * If the device does not support the [WhiteBalanceControl](whitebalancecontrol.md), you can still use the [WhiteBalance](videodevicecontroller_whitebalance.md) on the [VideoDeviceController](videodevicecontroller_md) to set the white balance color temperature.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.whitebalancecontrol.supported
     * @type {Boolean} 
     */
    Supported {
        get => this.get_Supported()
    }

    /**
     * Gets the color temperature preset.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.whitebalancecontrol.preset
     * @type {Integer} 
     */
    Preset {
        get => this.get_Preset()
    }

    /**
     * Gets the minimum white balance value.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.whitebalancecontrol.min
     * @type {Integer} 
     */
    Min {
        get => this.get_Min()
    }

    /**
     * Gets the maximum white balance value.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.whitebalancecontrol.max
     * @type {Integer} 
     */
    Max {
        get => this.get_Max()
    }

    /**
     * Gets the step value.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.whitebalancecontrol.step
     * @type {Integer} 
     */
    Step {
        get => this.get_Step()
    }

    /**
     * Gets the color temperature value.
     * @remarks
     * White balance is specified as a color temperature in degrees Kelvin.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.whitebalancecontrol.value
     * @type {Integer} 
     */
    Value {
        get => this.get_Value()
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
        if (!this.HasProp("__IWhiteBalanceControl")) {
            if ((queryResult := this.QueryInterface(IWhiteBalanceControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWhiteBalanceControl := IWhiteBalanceControl(outPtr)
        }

        return this.__IWhiteBalanceControl.get_Supported()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Preset() {
        if (!this.HasProp("__IWhiteBalanceControl")) {
            if ((queryResult := this.QueryInterface(IWhiteBalanceControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWhiteBalanceControl := IWhiteBalanceControl(outPtr)
        }

        return this.__IWhiteBalanceControl.get_Preset()
    }

    /**
     * Asynchronously sets the color temperature [Preset](whitebalancecontrol_preset.md).
     * @remarks
     * Adjusting the white balance is only supported while the preview stream is running. Check to make sure that the preview stream is running before setting the white balance value or preset.
     * 
     * The [ColorTemperaturePreset.Auto](colortemperaturepreset.md) preset value instructs the system to automatically adjust the white balance level. For some scenarios, such as capturing a photo sequence where the white balance levels should be the same for each frame, you may want to lock the control to the current automatic value. To do this, call SetPresetAsync and specify the **Manual** preset and do not set a value on the control using [SetValueAsync](whitebalancecontrol_setvalueasync_2096210171.md). This will cause the device to lock the current value. Do not attempt to read the current control value and then pass the returned value into [SetValueAsync](whitebalancecontrol_setvalueasync_2096210171.md) because this value is not guaranteed to be correct.
     * @param {Integer} preset The color temperate preset to set the [Preset](whitebalancecontrol_preset.md) property to.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.whitebalancecontrol.setpresetasync
     */
    SetPresetAsync(preset) {
        if (!this.HasProp("__IWhiteBalanceControl")) {
            if ((queryResult := this.QueryInterface(IWhiteBalanceControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWhiteBalanceControl := IWhiteBalanceControl(outPtr)
        }

        return this.__IWhiteBalanceControl.SetPresetAsync(preset)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Min() {
        if (!this.HasProp("__IWhiteBalanceControl")) {
            if ((queryResult := this.QueryInterface(IWhiteBalanceControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWhiteBalanceControl := IWhiteBalanceControl(outPtr)
        }

        return this.__IWhiteBalanceControl.get_Min()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Max() {
        if (!this.HasProp("__IWhiteBalanceControl")) {
            if ((queryResult := this.QueryInterface(IWhiteBalanceControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWhiteBalanceControl := IWhiteBalanceControl(outPtr)
        }

        return this.__IWhiteBalanceControl.get_Max()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Step() {
        if (!this.HasProp("__IWhiteBalanceControl")) {
            if ((queryResult := this.QueryInterface(IWhiteBalanceControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWhiteBalanceControl := IWhiteBalanceControl(outPtr)
        }

        return this.__IWhiteBalanceControl.get_Step()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Value() {
        if (!this.HasProp("__IWhiteBalanceControl")) {
            if ((queryResult := this.QueryInterface(IWhiteBalanceControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWhiteBalanceControl := IWhiteBalanceControl(outPtr)
        }

        return this.__IWhiteBalanceControl.get_Value()
    }

    /**
     * Asynchronously sets the color temperature [Value](whitebalancecontrol_value.md).
     * @remarks
     * White balance is specified as a color temperature in degrees Kelvin.
     * 
     * Adjusting the white balance is only supported while the preview stream is running. Check to make sure that the preview stream is running before setting the white balance value or preset.
     * 
     * The [ColorTemperaturePreset.Auto](colortemperaturepreset.md) preset value instructs the system to automatically adjust the white balance level. For some scenarios, such as capturing a photo sequence where the white balance levels should be the same for each frame, you may want to lock the control to the current automatic value. To do this, call [SetPresetAsync](whitebalancecontrol_setpresetasync_1724838565.md) and specify the **Manual** preset and do not set a value on the control using SetValueAsync. This will cause the device to lock the current value. Do not attempt to read the current control value and then pass the returned value into SetValueAsync because this value is not guaranteed to be correct.
     * @param {Integer} temperature The temperature value to set the [Value](whitebalancecontrol_value.md) property to.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.whitebalancecontrol.setvalueasync
     */
    SetValueAsync(temperature) {
        if (!this.HasProp("__IWhiteBalanceControl")) {
            if ((queryResult := this.QueryInterface(IWhiteBalanceControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWhiteBalanceControl := IWhiteBalanceControl(outPtr)
        }

        return this.__IWhiteBalanceControl.SetValueAsync(temperature)
    }

;@endregion Instance Methods
}

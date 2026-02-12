#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IFlashControl.ahk
#Include .\IFlashControl2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides functionality for controlling the flash settings on a capture device.
 * @remarks
 * The FlashControl enable apps to manage the flash on a device. This can be used in a photo app to handle low-light conditions or for [RedEyeReduction](flashcontrol_redeyereduction.md).
 * 
 * You can find out if a device supports this control by checking [FlashControl.Supported](flashcontrol_supported.md).
 * 
 * You can access the FlashControl for the capture device through [MediaCapture.VideoDeviceController](../windows.media.capture/mediacapture_videodevicecontroller.md).
 * 
 * For how-to guidance for using the **FlashControl**, see [Manual camera controls for photo and video capture](/windows/uwp/audio-video-camera/capture-device-controls-for-photo-and-video-capture).
 * @see https://learn.microsoft.com/uwp/api/windows.media.devices.flashcontrol
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class FlashControl extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IFlashControl

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IFlashControl.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value that specifies if the capture device supports the flash control.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.flashcontrol.supported
     * @type {Boolean} 
     */
    Supported {
        get => this.get_Supported()
    }

    /**
     * Gets a value that specifics if the device allows the torch LED power settings to be changed.
     * @remarks
     * You should check the value of the [FlashControl](flashcontrol.md) object's [Supported](flashcontrol_supported.md) property before attempting to access this property. If [Supported](flashcontrol_supported.md) is false, attempting to access this property will throw an exception.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.flashcontrol.powersupported
     * @type {Boolean} 
     */
    PowerSupported {
        get => this.get_PowerSupported()
    }

    /**
     * Gets a value that specifies if the capture device supports red eye reduction.
     * @remarks
     * You should check the value of the [FlashControl](flashcontrol.md) object's [Supported](flashcontrol_supported.md) property before attempting to access this property. If [Supported](flashcontrol_supported.md) is false, attempting to access this property will throw an exception.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.flashcontrol.redeyereductionsupported
     * @type {Boolean} 
     */
    RedEyeReductionSupported {
        get => this.get_RedEyeReductionSupported()
    }

    /**
     * Gets a value that specifies if the flash on the capture device is enabled or disabled.
     * @remarks
     * You should check the value of the [FlashControl](flashcontrol.md) object's [Supported](flashcontrol_supported.md) property before attempting to access this property. If [Supported](flashcontrol_supported.md) is false, attempting to access this property will throw an exception.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.flashcontrol.enabled
     * @type {Boolean} 
     */
    Enabled {
        get => this.get_Enabled()
        set => this.put_Enabled(value)
    }

    /**
     * Gets or sets a value that specifies if flash is automatically set. This value also determines if the focus assist light operates automatically or by default whenever [AssistantLightEnabled](flashcontrol_assistantlightenabled.md) is set.
     * @remarks
     * You should check the value of the [FlashControl](flashcontrol.md) object's [Supported](flashcontrol_supported.md) property before attempting to access this property. If [Supported](flashcontrol_supported.md) is false, attempting to access this property will throw an exception.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.flashcontrol.auto
     * @type {Boolean} 
     */
    Auto {
        get => this.get_Auto()
        set => this.put_Auto(value)
    }

    /**
     * Gets a value that specifies if the red eye reduction is enabled or disabled.
     * @remarks
     * You should check the value of the [FlashControl](flashcontrol.md) object's [RedEyeReductionSupported](flashcontrol_redeyereductionsupported.md) property before attempting to access this property. If [RedEyeReductionSupported](flashcontrol_redeyereductionsupported.md) is false, attempting to access this property will throw an exception.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.flashcontrol.redeyereduction
     * @type {Boolean} 
     */
    RedEyeReduction {
        get => this.get_RedEyeReduction()
        set => this.put_RedEyeReduction(value)
    }

    /**
     * Gets or sets the intensity of the flash.
     * @remarks
     * You should check the value of the [FlashControl](flashcontrol.md) object's [PowerSupported](flashcontrol_powersupported.md) property before attempting to access this property. If [PowerSupported](flashcontrol_powersupported.md) is false, attempting to access this property will throw an exception.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.flashcontrol.powerpercent
     * @type {Float} 
     */
    PowerPercent {
        get => this.get_PowerPercent()
        set => this.put_PowerPercent(value)
    }

    /**
     * Gets a value indicating whether focus assist light is supported by the capture device.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.flashcontrol.assistantlightsupported
     * @type {Boolean} 
     */
    AssistantLightSupported {
        get => this.get_AssistantLightSupported()
    }

    /**
     * Gets or sets a value indicating whether focus assist light is enabled on the capture device.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.flashcontrol.assistantlightenabled
     * @type {Boolean} 
     */
    AssistantLightEnabled {
        get => this.get_AssistantLightEnabled()
        set => this.put_AssistantLightEnabled(value)
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
        if (!this.HasProp("__IFlashControl")) {
            if ((queryResult := this.QueryInterface(IFlashControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFlashControl := IFlashControl(outPtr)
        }

        return this.__IFlashControl.get_Supported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_PowerSupported() {
        if (!this.HasProp("__IFlashControl")) {
            if ((queryResult := this.QueryInterface(IFlashControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFlashControl := IFlashControl(outPtr)
        }

        return this.__IFlashControl.get_PowerSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_RedEyeReductionSupported() {
        if (!this.HasProp("__IFlashControl")) {
            if ((queryResult := this.QueryInterface(IFlashControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFlashControl := IFlashControl(outPtr)
        }

        return this.__IFlashControl.get_RedEyeReductionSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Enabled() {
        if (!this.HasProp("__IFlashControl")) {
            if ((queryResult := this.QueryInterface(IFlashControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFlashControl := IFlashControl(outPtr)
        }

        return this.__IFlashControl.get_Enabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Enabled(value) {
        if (!this.HasProp("__IFlashControl")) {
            if ((queryResult := this.QueryInterface(IFlashControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFlashControl := IFlashControl(outPtr)
        }

        return this.__IFlashControl.put_Enabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Auto() {
        if (!this.HasProp("__IFlashControl")) {
            if ((queryResult := this.QueryInterface(IFlashControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFlashControl := IFlashControl(outPtr)
        }

        return this.__IFlashControl.get_Auto()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Auto(value) {
        if (!this.HasProp("__IFlashControl")) {
            if ((queryResult := this.QueryInterface(IFlashControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFlashControl := IFlashControl(outPtr)
        }

        return this.__IFlashControl.put_Auto(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_RedEyeReduction() {
        if (!this.HasProp("__IFlashControl")) {
            if ((queryResult := this.QueryInterface(IFlashControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFlashControl := IFlashControl(outPtr)
        }

        return this.__IFlashControl.get_RedEyeReduction()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_RedEyeReduction(value) {
        if (!this.HasProp("__IFlashControl")) {
            if ((queryResult := this.QueryInterface(IFlashControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFlashControl := IFlashControl(outPtr)
        }

        return this.__IFlashControl.put_RedEyeReduction(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_PowerPercent() {
        if (!this.HasProp("__IFlashControl")) {
            if ((queryResult := this.QueryInterface(IFlashControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFlashControl := IFlashControl(outPtr)
        }

        return this.__IFlashControl.get_PowerPercent()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_PowerPercent(value) {
        if (!this.HasProp("__IFlashControl")) {
            if ((queryResult := this.QueryInterface(IFlashControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFlashControl := IFlashControl(outPtr)
        }

        return this.__IFlashControl.put_PowerPercent(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AssistantLightSupported() {
        if (!this.HasProp("__IFlashControl2")) {
            if ((queryResult := this.QueryInterface(IFlashControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFlashControl2 := IFlashControl2(outPtr)
        }

        return this.__IFlashControl2.get_AssistantLightSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AssistantLightEnabled() {
        if (!this.HasProp("__IFlashControl2")) {
            if ((queryResult := this.QueryInterface(IFlashControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFlashControl2 := IFlashControl2(outPtr)
        }

        return this.__IFlashControl2.get_AssistantLightEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AssistantLightEnabled(value) {
        if (!this.HasProp("__IFlashControl2")) {
            if ((queryResult := this.QueryInterface(IFlashControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFlashControl2 := IFlashControl2(outPtr)
        }

        return this.__IFlashControl2.put_AssistantLightEnabled(value)
    }

;@endregion Instance Methods
}

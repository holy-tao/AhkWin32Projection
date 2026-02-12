#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IFocusControl.ahk
#Include .\IFocusControl2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides functionality for controlling the focus settings on a capture device.
 * @remarks
 * You can find out if a device supports this control by checking [FocusControl.Supported](focuscontrol_supported.md).
 * 
 * If the device does not support the FocusControl, you can still use the [Focus](videodevicecontroller_focus.md) property on the [VideoCaptureDevice](https://msdn.microsoft.com/library/afba2768-11a0-4105-a5b1-c48bc961e9ed) to set the focus value.
 * 
 * You can access the FocusControl for the capture device through [MediaCapture.VideoDeviceController](../windows.media.capture/mediacapture_videodevicecontroller.md).
 * 
 * The FocusControl gives apps additional control over the focus settings on a device.
 * 
 * You can use one of the [FocusPreset](focuspreset.md) values by calling [SetPresetAsync](focuscontrol_setpresetasync_183048954.md). Or call [SetValueAsync](focuscontrol_setvalueasync_2096210171.md) to set a specific [Value](focuscontrol_value.md) between the [Min](focuscontrol_min.md) and [Max](focuscontrol_max.md).
 * 
 * For how-to guidance for using the **FocusControl**, see [Manual camera controls for photo and video capture](/windows/uwp/audio-video-camera/capture-device-controls-for-photo-and-video-capture).
 * @see https://learn.microsoft.com/uwp/api/windows.media.devices.focuscontrol
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class FocusControl extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IFocusControl

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IFocusControl.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value that specifies if the capture device supports the focus control.
     * @remarks
     * If the device does not support the [FocusControl](focuscontrol.md), you can still use the [Focus](videodevicecontroller_focus.md) property on the [VideoDeviceController](videodevicecontroller_md) to set the focus value.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.focuscontrol.supported
     * @type {Boolean} 
     */
    Supported {
        get => this.get_Supported()
    }

    /**
     * Gets the focus presets that the capture device supports.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.focuscontrol.supportedpresets
     * @type {IVectorView<Integer>} 
     */
    SupportedPresets {
        get => this.get_SupportedPresets()
    }

    /**
     * Gets the focus preset.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.focuscontrol.preset
     * @type {Integer} 
     */
    Preset {
        get => this.get_Preset()
    }

    /**
     * Gets the minimum focus length.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.focuscontrol.min
     * @type {Integer} 
     */
    Min {
        get => this.get_Min()
    }

    /**
     * Gets the maximum focus length.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.focuscontrol.max
     * @type {Integer} 
     */
    Max {
        get => this.get_Max()
    }

    /**
     * Gets the smallest focus increment supported by the capture device.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.focuscontrol.step
     * @type {Integer} 
     */
    Step {
        get => this.get_Step()
    }

    /**
     * Gets the current value that the focus is set to.
     * @remarks
     * To set a focus value, call [SetValueAsync](focuscontrol_setvalueasync_2096210171.md) specifying a value between the [Min](focuscontrol_min.md) and [Max](focuscontrol_max.md) focus values.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.focuscontrol.value
     * @type {Integer} 
     */
    Value {
        get => this.get_Value()
    }

    /**
     * Gets a value that specifics if the capture device supports the [FocusChanged](../windows.media.capture/mediacapture_focuschanged.md) event.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.focuscontrol.focuschangedsupported
     * @type {Boolean} 
     */
    FocusChangedSupported {
        get => this.get_FocusChangedSupported()
    }

    /**
     * Gets a value that indicates whether [WaitForFocus](focussettings_waitforfocus.md) is supported by the capture device.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.focuscontrol.waitforfocussupported
     * @type {Boolean} 
     */
    WaitForFocusSupported {
        get => this.get_WaitForFocusSupported()
    }

    /**
     * Gets a list of values indicating the focus modes that are supported by the capture device.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.focuscontrol.supportedfocusmodes
     * @type {IVectorView<Integer>} 
     */
    SupportedFocusModes {
        get => this.get_SupportedFocusModes()
    }

    /**
     * Gets a list of values indicating the manual focus distances that are supported by the capture device.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.focuscontrol.supportedfocusdistances
     * @type {IVectorView<Integer>} 
     */
    SupportedFocusDistances {
        get => this.get_SupportedFocusDistances()
    }

    /**
     * Gets a list of values indicating the auto focus ranges that are supported by the capture device.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.focuscontrol.supportedfocusranges
     * @type {IVectorView<Integer>} 
     */
    SupportedFocusRanges {
        get => this.get_SupportedFocusRanges()
    }

    /**
     * Gets the capture device's current focus mode.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.focuscontrol.mode
     * @type {Integer} 
     */
    Mode {
        get => this.get_Mode()
    }

    /**
     * Gets a [MediaCaptureFocusState](mediacapturefocusstate.md) value indicating the current focus state of the capture device.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.focuscontrol.focusstate
     * @type {Integer} 
     */
    FocusState {
        get => this.get_FocusState()
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
        if (!this.HasProp("__IFocusControl")) {
            if ((queryResult := this.QueryInterface(IFocusControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFocusControl := IFocusControl(outPtr)
        }

        return this.__IFocusControl.get_Supported()
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    get_SupportedPresets() {
        if (!this.HasProp("__IFocusControl")) {
            if ((queryResult := this.QueryInterface(IFocusControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFocusControl := IFocusControl(outPtr)
        }

        return this.__IFocusControl.get_SupportedPresets()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Preset() {
        if (!this.HasProp("__IFocusControl")) {
            if ((queryResult := this.QueryInterface(IFocusControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFocusControl := IFocusControl(outPtr)
        }

        return this.__IFocusControl.get_Preset()
    }

    /**
     * Asynchronously sets the focus [Preset](focuscontrol_preset.md), specifying if the operation must complete before the device is focused.
     * @param {Integer} preset The focus preset to set the [Preset](focuscontrol_preset.md) property to.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.focuscontrol.setpresetasync
     */
    SetPresetAsync(preset) {
        if (!this.HasProp("__IFocusControl")) {
            if ((queryResult := this.QueryInterface(IFocusControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFocusControl := IFocusControl(outPtr)
        }

        return this.__IFocusControl.SetPresetAsync(preset)
    }

    /**
     * Asynchronously sets the focus [Preset](focuscontrol_preset.md).
     * @param {Integer} preset The focus preset to set the [Preset](focuscontrol_preset.md) property to.
     * @param {Boolean} completeBeforeFocus 
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.focuscontrol.setpresetasync
     */
    SetPresetWithCompletionOptionAsync(preset, completeBeforeFocus) {
        if (!this.HasProp("__IFocusControl")) {
            if ((queryResult := this.QueryInterface(IFocusControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFocusControl := IFocusControl(outPtr)
        }

        return this.__IFocusControl.SetPresetWithCompletionOptionAsync(preset, completeBeforeFocus)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Min() {
        if (!this.HasProp("__IFocusControl")) {
            if ((queryResult := this.QueryInterface(IFocusControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFocusControl := IFocusControl(outPtr)
        }

        return this.__IFocusControl.get_Min()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Max() {
        if (!this.HasProp("__IFocusControl")) {
            if ((queryResult := this.QueryInterface(IFocusControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFocusControl := IFocusControl(outPtr)
        }

        return this.__IFocusControl.get_Max()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Step() {
        if (!this.HasProp("__IFocusControl")) {
            if ((queryResult := this.QueryInterface(IFocusControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFocusControl := IFocusControl(outPtr)
        }

        return this.__IFocusControl.get_Step()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Value() {
        if (!this.HasProp("__IFocusControl")) {
            if ((queryResult := this.QueryInterface(IFocusControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFocusControl := IFocusControl(outPtr)
        }

        return this.__IFocusControl.get_Value()
    }

    /**
     * Asynchronously sets the focus [Value](whitebalancecontrol_value.md).
     * @param {Integer} focus The value to set the focus to. The minimum and maximum values are specified by [Min](focuscontrol_min.md) and [Max](focuscontrol_max.md).
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.focuscontrol.setvalueasync
     */
    SetValueAsync(focus) {
        if (!this.HasProp("__IFocusControl")) {
            if ((queryResult := this.QueryInterface(IFocusControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFocusControl := IFocusControl(outPtr)
        }

        return this.__IFocusControl.SetValueAsync(focus)
    }

    /**
     * Asynchronously focuses the device.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.focuscontrol.focusasync
     */
    FocusAsync() {
        if (!this.HasProp("__IFocusControl")) {
            if ((queryResult := this.QueryInterface(IFocusControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFocusControl := IFocusControl(outPtr)
        }

        return this.__IFocusControl.FocusAsync()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_FocusChangedSupported() {
        if (!this.HasProp("__IFocusControl2")) {
            if ((queryResult := this.QueryInterface(IFocusControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFocusControl2 := IFocusControl2(outPtr)
        }

        return this.__IFocusControl2.get_FocusChangedSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_WaitForFocusSupported() {
        if (!this.HasProp("__IFocusControl2")) {
            if ((queryResult := this.QueryInterface(IFocusControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFocusControl2 := IFocusControl2(outPtr)
        }

        return this.__IFocusControl2.get_WaitForFocusSupported()
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    get_SupportedFocusModes() {
        if (!this.HasProp("__IFocusControl2")) {
            if ((queryResult := this.QueryInterface(IFocusControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFocusControl2 := IFocusControl2(outPtr)
        }

        return this.__IFocusControl2.get_SupportedFocusModes()
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    get_SupportedFocusDistances() {
        if (!this.HasProp("__IFocusControl2")) {
            if ((queryResult := this.QueryInterface(IFocusControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFocusControl2 := IFocusControl2(outPtr)
        }

        return this.__IFocusControl2.get_SupportedFocusDistances()
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    get_SupportedFocusRanges() {
        if (!this.HasProp("__IFocusControl2")) {
            if ((queryResult := this.QueryInterface(IFocusControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFocusControl2 := IFocusControl2(outPtr)
        }

        return this.__IFocusControl2.get_SupportedFocusRanges()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Mode() {
        if (!this.HasProp("__IFocusControl2")) {
            if ((queryResult := this.QueryInterface(IFocusControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFocusControl2 := IFocusControl2(outPtr)
        }

        return this.__IFocusControl2.get_Mode()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FocusState() {
        if (!this.HasProp("__IFocusControl2")) {
            if ((queryResult := this.QueryInterface(IFocusControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFocusControl2 := IFocusControl2(outPtr)
        }

        return this.__IFocusControl2.get_FocusState()
    }

    /**
     * Unlocks the capture device's focus if it has previously been locked with a call to [LockAsync](focuscontrol_lockasync_1653754659.md).
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.focuscontrol.unlockasync
     */
    UnlockAsync() {
        if (!this.HasProp("__IFocusControl2")) {
            if ((queryResult := this.QueryInterface(IFocusControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFocusControl2 := IFocusControl2(outPtr)
        }

        return this.__IFocusControl2.UnlockAsync()
    }

    /**
     * Locks the capture device's focus.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.focuscontrol.lockasync
     */
    LockAsync() {
        if (!this.HasProp("__IFocusControl2")) {
            if ((queryResult := this.QueryInterface(IFocusControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFocusControl2 := IFocusControl2(outPtr)
        }

        return this.__IFocusControl2.LockAsync()
    }

    /**
     * Configures the [FocusControl](focuscontrol.md) object with values specified in the provided [FocusSettings](focussettings.md) object.
     * @remarks
     * Autofocus mode, enabled by using the [FocusMode.Continuous](focusmode.md) value in the [FocusSettings](focussettings.md) object supplied to this method, is only supported while the preview stream is running. Check to make sure that the preview stream is running before turning on continuous autofocus.
     * @param {FocusSettings} settings The focus settings to use to configure the [FocusControl](focuscontrol.md) object.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.focuscontrol.configure
     */
    Configure(settings) {
        if (!this.HasProp("__IFocusControl2")) {
            if ((queryResult := this.QueryInterface(IFocusControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFocusControl2 := IFocusControl2(outPtr)
        }

        return this.__IFocusControl2.Configure(settings)
    }

;@endregion Instance Methods
}

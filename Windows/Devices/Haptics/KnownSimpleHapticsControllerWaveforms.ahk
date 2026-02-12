#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IKnownSimpleHapticsControllerWaveformsStatics2.ahk
#Include .\IKnownSimpleHapticsControllerWaveformsStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides a set of well-known haptic waveform types (based on the [Haptic Usage Page](https://aka.ms/hid-haptics) HID specification.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.haptics.knownsimplehapticscontrollerwaveforms
 * @namespace Windows.Devices.Haptics
 * @version WindowsRuntime 1.4
 */
class KnownSimpleHapticsControllerWaveforms extends IInspectable {
;@region Static Properties
    /**
     * Gets a buzz waveform that is generated continuously for a pen device while in contact with the digitizer surface.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.haptics.knownsimplehapticscontrollerwaveforms.brushcontinuous
     * @type {Integer} 
     */
    static BrushContinuous {
        get => KnownSimpleHapticsControllerWaveforms.get_BrushContinuous()
    }

    /**
     * Gets a buzz waveform that is generated continuously for a pen device (in marker/highlighter mode) while in contact with the digitizer surface.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.haptics.knownsimplehapticscontrollerwaveforms.chiselmarkercontinuous
     * @type {Integer} 
     */
    static ChiselMarkerContinuous {
        get => KnownSimpleHapticsControllerWaveforms.get_ChiselMarkerContinuous()
    }

    /**
     * Gets a buzz waveform that is generated continuously for a pen device (in eraser mode) while in contact with the digitizer surface.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.haptics.knownsimplehapticscontrollerwaveforms.erasercontinuous
     * @type {Integer} 
     */
    static EraserContinuous {
        get => KnownSimpleHapticsControllerWaveforms.get_EraserContinuous()
    }

    /**
     * Gets a strong buzz waveform used to signal that an action has failed, or an error has occurred.
     * @remarks
     * [Pen interactions and haptic (tactile) feedback](/windows/apps/design/input/pen-haptics), [Surface Dial interactions](/windows/apps/design/input/windows-wheel-interactions)
     * @see https://learn.microsoft.com/uwp/api/windows.devices.haptics.knownsimplehapticscontrollerwaveforms.error
     * @type {Integer} 
     */
    static Error {
        get => KnownSimpleHapticsControllerWaveforms.get_Error()
    }

    /**
     * Gets a buzz waveform that is generated continuously for special ink tools (such as a multi-colored brush) while in contact with the digitizer surface.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.haptics.knownsimplehapticscontrollerwaveforms.galaxypencontinuous
     * @type {Integer} 
     */
    static GalaxyPenContinuous {
        get => KnownSimpleHapticsControllerWaveforms.get_GalaxyPenContinuous()
    }

    /**
     * Gets a buzz waveform that indicates the pointer has started hovering over an interactive UI element.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.haptics.knownsimplehapticscontrollerwaveforms.hover
     * @type {Integer} 
     */
    static Hover {
        get => KnownSimpleHapticsControllerWaveforms.get_Hover()
    }

    /**
     * Gets a buzz waveform that is generated continuously for a pen device (in ink mode) while in contact with the digitizer surface.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.haptics.knownsimplehapticscontrollerwaveforms.inkcontinuous
     * @type {Integer} 
     */
    static InkContinuous {
        get => KnownSimpleHapticsControllerWaveforms.get_InkContinuous()
    }

    /**
     * Gets a buzz waveform that is generated continuously without interruption for a pen device (in marker mode) while in contact with the digitizer surface.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.haptics.knownsimplehapticscontrollerwaveforms.markercontinuous
     * @type {Integer} 
     */
    static MarkerContinuous {
        get => KnownSimpleHapticsControllerWaveforms.get_MarkerContinuous()
    }

    /**
     * Gets a buzz waveform that is generated continuously for a pen device (in ink pencil mode) while in contact with the digitizer surface.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.haptics.knownsimplehapticscontrollerwaveforms.pencilcontinuous
     * @type {Integer} 
     */
    static PencilContinuous {
        get => KnownSimpleHapticsControllerWaveforms.get_PencilContinuous()
    }

    /**
     * Gets a buzz waveform that is generated for a pen device when ink recognition is successful.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.haptics.knownsimplehapticscontrollerwaveforms.success
     * @type {Integer} 
     */
    static Success {
        get => KnownSimpleHapticsControllerWaveforms.get_Success()
    }

    /**
     * Gets a click waveform.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.haptics.knownsimplehapticscontrollerwaveforms.click
     * @type {Integer} 
     */
    static Click {
        get => KnownSimpleHapticsControllerWaveforms.get_Click()
    }

    /**
     * Gets a buzz waveform that is generated continuously until terminated.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.haptics.knownsimplehapticscontrollerwaveforms.buzzcontinuous
     * @type {Integer} 
     */
    static BuzzContinuous {
        get => KnownSimpleHapticsControllerWaveforms.get_BuzzContinuous()
    }

    /**
     * Gets a rumble waveform that is generated continuously until terminated.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.haptics.knownsimplehapticscontrollerwaveforms.rumblecontinuous
     * @type {Integer} 
     */
    static RumbleContinuous {
        get => KnownSimpleHapticsControllerWaveforms.get_RumbleContinuous()
    }

    /**
     * Gets a buzz waveform that indicates when a user presses an interactive UI element in an incremental action (see [Release](knownsimplehapticscontrollerwaveforms_release.md)).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.haptics.knownsimplehapticscontrollerwaveforms.press
     * @type {Integer} 
     */
    static Press {
        get => KnownSimpleHapticsControllerWaveforms.get_Press()
    }

    /**
     * Gets a buzz waveform that indicates when a user releases an interactive UI element in an incremental action (see [Press](knownsimplehapticscontrollerwaveforms_press.md)).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.haptics.knownsimplehapticscontrollerwaveforms.release
     * @type {Integer} 
     */
    static Release {
        get => KnownSimpleHapticsControllerWaveforms.get_Release()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {Integer} 
     */
    static get_BrushContinuous() {
        if (!KnownSimpleHapticsControllerWaveforms.HasProp("__IKnownSimpleHapticsControllerWaveformsStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Haptics.KnownSimpleHapticsControllerWaveforms")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownSimpleHapticsControllerWaveformsStatics2.IID)
            KnownSimpleHapticsControllerWaveforms.__IKnownSimpleHapticsControllerWaveformsStatics2 := IKnownSimpleHapticsControllerWaveformsStatics2(factoryPtr)
        }

        return KnownSimpleHapticsControllerWaveforms.__IKnownSimpleHapticsControllerWaveformsStatics2.get_BrushContinuous()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_ChiselMarkerContinuous() {
        if (!KnownSimpleHapticsControllerWaveforms.HasProp("__IKnownSimpleHapticsControllerWaveformsStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Haptics.KnownSimpleHapticsControllerWaveforms")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownSimpleHapticsControllerWaveformsStatics2.IID)
            KnownSimpleHapticsControllerWaveforms.__IKnownSimpleHapticsControllerWaveformsStatics2 := IKnownSimpleHapticsControllerWaveformsStatics2(factoryPtr)
        }

        return KnownSimpleHapticsControllerWaveforms.__IKnownSimpleHapticsControllerWaveformsStatics2.get_ChiselMarkerContinuous()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_EraserContinuous() {
        if (!KnownSimpleHapticsControllerWaveforms.HasProp("__IKnownSimpleHapticsControllerWaveformsStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Haptics.KnownSimpleHapticsControllerWaveforms")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownSimpleHapticsControllerWaveformsStatics2.IID)
            KnownSimpleHapticsControllerWaveforms.__IKnownSimpleHapticsControllerWaveformsStatics2 := IKnownSimpleHapticsControllerWaveformsStatics2(factoryPtr)
        }

        return KnownSimpleHapticsControllerWaveforms.__IKnownSimpleHapticsControllerWaveformsStatics2.get_EraserContinuous()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_Error() {
        if (!KnownSimpleHapticsControllerWaveforms.HasProp("__IKnownSimpleHapticsControllerWaveformsStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Haptics.KnownSimpleHapticsControllerWaveforms")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownSimpleHapticsControllerWaveformsStatics2.IID)
            KnownSimpleHapticsControllerWaveforms.__IKnownSimpleHapticsControllerWaveformsStatics2 := IKnownSimpleHapticsControllerWaveformsStatics2(factoryPtr)
        }

        return KnownSimpleHapticsControllerWaveforms.__IKnownSimpleHapticsControllerWaveformsStatics2.get_Error()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_GalaxyPenContinuous() {
        if (!KnownSimpleHapticsControllerWaveforms.HasProp("__IKnownSimpleHapticsControllerWaveformsStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Haptics.KnownSimpleHapticsControllerWaveforms")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownSimpleHapticsControllerWaveformsStatics2.IID)
            KnownSimpleHapticsControllerWaveforms.__IKnownSimpleHapticsControllerWaveformsStatics2 := IKnownSimpleHapticsControllerWaveformsStatics2(factoryPtr)
        }

        return KnownSimpleHapticsControllerWaveforms.__IKnownSimpleHapticsControllerWaveformsStatics2.get_GalaxyPenContinuous()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_Hover() {
        if (!KnownSimpleHapticsControllerWaveforms.HasProp("__IKnownSimpleHapticsControllerWaveformsStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Haptics.KnownSimpleHapticsControllerWaveforms")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownSimpleHapticsControllerWaveformsStatics2.IID)
            KnownSimpleHapticsControllerWaveforms.__IKnownSimpleHapticsControllerWaveformsStatics2 := IKnownSimpleHapticsControllerWaveformsStatics2(factoryPtr)
        }

        return KnownSimpleHapticsControllerWaveforms.__IKnownSimpleHapticsControllerWaveformsStatics2.get_Hover()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_InkContinuous() {
        if (!KnownSimpleHapticsControllerWaveforms.HasProp("__IKnownSimpleHapticsControllerWaveformsStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Haptics.KnownSimpleHapticsControllerWaveforms")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownSimpleHapticsControllerWaveformsStatics2.IID)
            KnownSimpleHapticsControllerWaveforms.__IKnownSimpleHapticsControllerWaveformsStatics2 := IKnownSimpleHapticsControllerWaveformsStatics2(factoryPtr)
        }

        return KnownSimpleHapticsControllerWaveforms.__IKnownSimpleHapticsControllerWaveformsStatics2.get_InkContinuous()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_MarkerContinuous() {
        if (!KnownSimpleHapticsControllerWaveforms.HasProp("__IKnownSimpleHapticsControllerWaveformsStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Haptics.KnownSimpleHapticsControllerWaveforms")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownSimpleHapticsControllerWaveformsStatics2.IID)
            KnownSimpleHapticsControllerWaveforms.__IKnownSimpleHapticsControllerWaveformsStatics2 := IKnownSimpleHapticsControllerWaveformsStatics2(factoryPtr)
        }

        return KnownSimpleHapticsControllerWaveforms.__IKnownSimpleHapticsControllerWaveformsStatics2.get_MarkerContinuous()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_PencilContinuous() {
        if (!KnownSimpleHapticsControllerWaveforms.HasProp("__IKnownSimpleHapticsControllerWaveformsStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Haptics.KnownSimpleHapticsControllerWaveforms")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownSimpleHapticsControllerWaveformsStatics2.IID)
            KnownSimpleHapticsControllerWaveforms.__IKnownSimpleHapticsControllerWaveformsStatics2 := IKnownSimpleHapticsControllerWaveformsStatics2(factoryPtr)
        }

        return KnownSimpleHapticsControllerWaveforms.__IKnownSimpleHapticsControllerWaveformsStatics2.get_PencilContinuous()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_Success() {
        if (!KnownSimpleHapticsControllerWaveforms.HasProp("__IKnownSimpleHapticsControllerWaveformsStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Haptics.KnownSimpleHapticsControllerWaveforms")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownSimpleHapticsControllerWaveformsStatics2.IID)
            KnownSimpleHapticsControllerWaveforms.__IKnownSimpleHapticsControllerWaveformsStatics2 := IKnownSimpleHapticsControllerWaveformsStatics2(factoryPtr)
        }

        return KnownSimpleHapticsControllerWaveforms.__IKnownSimpleHapticsControllerWaveformsStatics2.get_Success()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_Click() {
        if (!KnownSimpleHapticsControllerWaveforms.HasProp("__IKnownSimpleHapticsControllerWaveformsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Haptics.KnownSimpleHapticsControllerWaveforms")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownSimpleHapticsControllerWaveformsStatics.IID)
            KnownSimpleHapticsControllerWaveforms.__IKnownSimpleHapticsControllerWaveformsStatics := IKnownSimpleHapticsControllerWaveformsStatics(factoryPtr)
        }

        return KnownSimpleHapticsControllerWaveforms.__IKnownSimpleHapticsControllerWaveformsStatics.get_Click()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_BuzzContinuous() {
        if (!KnownSimpleHapticsControllerWaveforms.HasProp("__IKnownSimpleHapticsControllerWaveformsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Haptics.KnownSimpleHapticsControllerWaveforms")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownSimpleHapticsControllerWaveformsStatics.IID)
            KnownSimpleHapticsControllerWaveforms.__IKnownSimpleHapticsControllerWaveformsStatics := IKnownSimpleHapticsControllerWaveformsStatics(factoryPtr)
        }

        return KnownSimpleHapticsControllerWaveforms.__IKnownSimpleHapticsControllerWaveformsStatics.get_BuzzContinuous()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_RumbleContinuous() {
        if (!KnownSimpleHapticsControllerWaveforms.HasProp("__IKnownSimpleHapticsControllerWaveformsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Haptics.KnownSimpleHapticsControllerWaveforms")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownSimpleHapticsControllerWaveformsStatics.IID)
            KnownSimpleHapticsControllerWaveforms.__IKnownSimpleHapticsControllerWaveformsStatics := IKnownSimpleHapticsControllerWaveformsStatics(factoryPtr)
        }

        return KnownSimpleHapticsControllerWaveforms.__IKnownSimpleHapticsControllerWaveformsStatics.get_RumbleContinuous()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_Press() {
        if (!KnownSimpleHapticsControllerWaveforms.HasProp("__IKnownSimpleHapticsControllerWaveformsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Haptics.KnownSimpleHapticsControllerWaveforms")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownSimpleHapticsControllerWaveformsStatics.IID)
            KnownSimpleHapticsControllerWaveforms.__IKnownSimpleHapticsControllerWaveformsStatics := IKnownSimpleHapticsControllerWaveformsStatics(factoryPtr)
        }

        return KnownSimpleHapticsControllerWaveforms.__IKnownSimpleHapticsControllerWaveformsStatics.get_Press()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_Release() {
        if (!KnownSimpleHapticsControllerWaveforms.HasProp("__IKnownSimpleHapticsControllerWaveformsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Haptics.KnownSimpleHapticsControllerWaveforms")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownSimpleHapticsControllerWaveformsStatics.IID)
            KnownSimpleHapticsControllerWaveforms.__IKnownSimpleHapticsControllerWaveformsStatics := IKnownSimpleHapticsControllerWaveformsStatics(factoryPtr)
        }

        return KnownSimpleHapticsControllerWaveforms.__IKnownSimpleHapticsControllerWaveformsStatics.get_Release()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}

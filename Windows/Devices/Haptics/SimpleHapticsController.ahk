#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISimpleHapticsController.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides access to a single haptic input device that can be used to enumerate the haptic waveforms supported by the associated input device and trigger a specific haptic response.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.haptics.simplehapticscontroller
 * @namespace Windows.Devices.Haptics
 * @version WindowsRuntime 1.4
 */
class SimpleHapticsController extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISimpleHapticsController

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISimpleHapticsController.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the identifier for the haptic input device.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.haptics.simplehapticscontroller.id
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * Gets the types of feedback supported by the haptic input device.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.haptics.simplehapticscontroller.supportedfeedback
     * @type {IVectorView<SimpleHapticsControllerFeedback>} 
     */
    SupportedFeedback {
        get => this.get_SupportedFeedback()
    }

    /**
     * Gets whether the haptic input device supports feedback intensity.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.haptics.simplehapticscontroller.isintensitysupported
     * @type {Boolean} 
     */
    IsIntensitySupported {
        get => this.get_IsIntensitySupported()
    }

    /**
     * Gets whether the haptic input device supports feedback counts.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.haptics.simplehapticscontroller.isplaycountsupported
     * @type {Boolean} 
     */
    IsPlayCountSupported {
        get => this.get_IsPlayCountSupported()
    }

    /**
     * Gets whether the haptic input device supports feedback duration.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.haptics.simplehapticscontroller.isplaydurationsupported
     * @type {Boolean} 
     */
    IsPlayDurationSupported {
        get => this.get_IsPlayDurationSupported()
    }

    /**
     * Gets whether the haptic input device supports pause intervals between feedback cycles.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.haptics.simplehapticscontroller.isreplaypauseintervalsupported
     * @type {Boolean} 
     */
    IsReplayPauseIntervalSupported {
        get => this.get_IsReplayPauseIntervalSupported()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        if (!this.HasProp("__ISimpleHapticsController")) {
            if ((queryResult := this.QueryInterface(ISimpleHapticsController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISimpleHapticsController := ISimpleHapticsController(outPtr)
        }

        return this.__ISimpleHapticsController.get_Id()
    }

    /**
     * 
     * @returns {IVectorView<SimpleHapticsControllerFeedback>} 
     */
    get_SupportedFeedback() {
        if (!this.HasProp("__ISimpleHapticsController")) {
            if ((queryResult := this.QueryInterface(ISimpleHapticsController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISimpleHapticsController := ISimpleHapticsController(outPtr)
        }

        return this.__ISimpleHapticsController.get_SupportedFeedback()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsIntensitySupported() {
        if (!this.HasProp("__ISimpleHapticsController")) {
            if ((queryResult := this.QueryInterface(ISimpleHapticsController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISimpleHapticsController := ISimpleHapticsController(outPtr)
        }

        return this.__ISimpleHapticsController.get_IsIntensitySupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPlayCountSupported() {
        if (!this.HasProp("__ISimpleHapticsController")) {
            if ((queryResult := this.QueryInterface(ISimpleHapticsController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISimpleHapticsController := ISimpleHapticsController(outPtr)
        }

        return this.__ISimpleHapticsController.get_IsPlayCountSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPlayDurationSupported() {
        if (!this.HasProp("__ISimpleHapticsController")) {
            if ((queryResult := this.QueryInterface(ISimpleHapticsController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISimpleHapticsController := ISimpleHapticsController(outPtr)
        }

        return this.__ISimpleHapticsController.get_IsPlayDurationSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsReplayPauseIntervalSupported() {
        if (!this.HasProp("__ISimpleHapticsController")) {
            if ((queryResult := this.QueryInterface(ISimpleHapticsController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISimpleHapticsController := ISimpleHapticsController(outPtr)
        }

        return this.__ISimpleHapticsController.get_IsReplayPauseIntervalSupported()
    }

    /**
     * Terminates haptic feedback by the input device.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.haptics.simplehapticscontroller.stopfeedback
     */
    StopFeedback() {
        if (!this.HasProp("__ISimpleHapticsController")) {
            if ((queryResult := this.QueryInterface(ISimpleHapticsController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISimpleHapticsController := ISimpleHapticsController(outPtr)
        }

        return this.__ISimpleHapticsController.StopFeedback()
    }

    /**
     * Start haptic feedback by the input device.
     * @param {SimpleHapticsControllerFeedback} feedback The type of haptic feedback.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.haptics.simplehapticscontroller.sendhapticfeedback
     */
    SendHapticFeedback(feedback) {
        if (!this.HasProp("__ISimpleHapticsController")) {
            if ((queryResult := this.QueryInterface(ISimpleHapticsController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISimpleHapticsController := ISimpleHapticsController(outPtr)
        }

        return this.__ISimpleHapticsController.SendHapticFeedback(feedback)
    }

    /**
     * Start haptic feedback by the input device with the specified intensity.
     * @param {SimpleHapticsControllerFeedback} feedback The type of haptic feedback.
     * @param {Float} intensity The strength of the haptic feedback based on the capability of the input device.
     * 
     * - 0 disables haptic feedback
     * - 1.0 is maximum strength
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.haptics.simplehapticscontroller.sendhapticfeedback
     */
    SendHapticFeedbackWithIntensity(feedback, intensity) {
        if (!this.HasProp("__ISimpleHapticsController")) {
            if ((queryResult := this.QueryInterface(ISimpleHapticsController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISimpleHapticsController := ISimpleHapticsController(outPtr)
        }

        return this.__ISimpleHapticsController.SendHapticFeedbackWithIntensity(feedback, intensity)
    }

    /**
     * Start haptic feedback by the input device and continue for the specified amount of time.
     * @param {SimpleHapticsControllerFeedback} feedback The type of haptic feedback.
     * @param {Float} intensity The strength of the haptic feedback based on the capability of the input device.
     * 
     * - 0 disables haptic feedback
     * - 1.0 is maximum strength
     * @param {TimeSpan} playDuration The time period expressed in 100-nanosecond units (1 = 100ns).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.haptics.simplehapticscontroller.sendhapticfeedbackforduration
     */
    SendHapticFeedbackForDuration(feedback, intensity, playDuration) {
        if (!this.HasProp("__ISimpleHapticsController")) {
            if ((queryResult := this.QueryInterface(ISimpleHapticsController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISimpleHapticsController := ISimpleHapticsController(outPtr)
        }

        return this.__ISimpleHapticsController.SendHapticFeedbackForDuration(feedback, intensity, playDuration)
    }

    /**
     * Start haptic feedback by the input device and repeat for the specified number of times.
     * @param {SimpleHapticsControllerFeedback} feedback The type of haptic feedback.
     * @param {Float} intensity The strength of the haptic feedback based on the capability of the input device.
     * 
     * - 0 disables haptic feedback
     * - 1.0 is maximum strength
     * @param {Integer} playCount The number of times to repeat the haptic feedback.
     * @param {TimeSpan} replayPauseInterval The time period between feedback cycles, expressed in 100-nanosecond units (1 = 100ns).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.haptics.simplehapticscontroller.sendhapticfeedbackforplaycount
     */
    SendHapticFeedbackForPlayCount(feedback, intensity, playCount, replayPauseInterval) {
        if (!this.HasProp("__ISimpleHapticsController")) {
            if ((queryResult := this.QueryInterface(ISimpleHapticsController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISimpleHapticsController := ISimpleHapticsController(outPtr)
        }

        return this.__ISimpleHapticsController.SendHapticFeedbackForPlayCount(feedback, intensity, playCount, replayPauseInterval)
    }

;@endregion Instance Methods
}

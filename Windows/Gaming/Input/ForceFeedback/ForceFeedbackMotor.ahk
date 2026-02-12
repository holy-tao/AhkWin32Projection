#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IForceFeedbackMotor.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Encapsulates the force feedback hardware for a given input device.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.forcefeedback.forcefeedbackmotor
 * @namespace Windows.Gaming.Input.ForceFeedback
 * @version WindowsRuntime 1.4
 */
class ForceFeedbackMotor extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IForceFeedbackMotor

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IForceFeedbackMotor.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Boolean indicating whether force feedback effects are paused.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.forcefeedback.forcefeedbackmotor.areeffectspaused
     * @type {Boolean} 
     */
    AreEffectsPaused {
        get => this.get_AreEffectsPaused()
    }

    /**
     * Specifies the percentage by which to reduce the force of all effects on the controller.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.forcefeedback.forcefeedbackmotor.mastergain
     * @type {Float} 
     */
    MasterGain {
        get => this.get_MasterGain()
        set => this.put_MasterGain(value)
    }

    /**
     * Boolean indicating whether the force feedback motor is enabled.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.forcefeedback.forcefeedbackmotor.isenabled
     * @type {Boolean} 
     */
    IsEnabled {
        get => this.get_IsEnabled()
    }

    /**
     * The axes supported by the force feedback motor.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.forcefeedback.forcefeedbackmotor.supportedaxes
     * @type {Integer} 
     */
    SupportedAxes {
        get => this.get_SupportedAxes()
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
    get_AreEffectsPaused() {
        if (!this.HasProp("__IForceFeedbackMotor")) {
            if ((queryResult := this.QueryInterface(IForceFeedbackMotor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IForceFeedbackMotor := IForceFeedbackMotor(outPtr)
        }

        return this.__IForceFeedbackMotor.get_AreEffectsPaused()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MasterGain() {
        if (!this.HasProp("__IForceFeedbackMotor")) {
            if ((queryResult := this.QueryInterface(IForceFeedbackMotor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IForceFeedbackMotor := IForceFeedbackMotor(outPtr)
        }

        return this.__IForceFeedbackMotor.get_MasterGain()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_MasterGain(value) {
        if (!this.HasProp("__IForceFeedbackMotor")) {
            if ((queryResult := this.QueryInterface(IForceFeedbackMotor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IForceFeedbackMotor := IForceFeedbackMotor(outPtr)
        }

        return this.__IForceFeedbackMotor.put_MasterGain(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsEnabled() {
        if (!this.HasProp("__IForceFeedbackMotor")) {
            if ((queryResult := this.QueryInterface(IForceFeedbackMotor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IForceFeedbackMotor := IForceFeedbackMotor(outPtr)
        }

        return this.__IForceFeedbackMotor.get_IsEnabled()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SupportedAxes() {
        if (!this.HasProp("__IForceFeedbackMotor")) {
            if ((queryResult := this.QueryInterface(IForceFeedbackMotor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IForceFeedbackMotor := IForceFeedbackMotor(outPtr)
        }

        return this.__IForceFeedbackMotor.get_SupportedAxes()
    }

    /**
     * Attempts to asynchronously load a feedback effect to the device's internal memory.
     * @param {IForceFeedbackEffect} effect_ The effect to load.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.forcefeedback.forcefeedbackmotor.loadeffectasync
     */
    LoadEffectAsync(effect_) {
        if (!this.HasProp("__IForceFeedbackMotor")) {
            if ((queryResult := this.QueryInterface(IForceFeedbackMotor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IForceFeedbackMotor := IForceFeedbackMotor(outPtr)
        }

        return this.__IForceFeedbackMotor.LoadEffectAsync(effect_)
    }

    /**
     * Pauses all force feedback effects being executed.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.forcefeedback.forcefeedbackmotor.pausealleffects
     */
    PauseAllEffects() {
        if (!this.HasProp("__IForceFeedbackMotor")) {
            if ((queryResult := this.QueryInterface(IForceFeedbackMotor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IForceFeedbackMotor := IForceFeedbackMotor(outPtr)
        }

        return this.__IForceFeedbackMotor.PauseAllEffects()
    }

    /**
     * Resumes all force feedback effects being executed.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.forcefeedback.forcefeedbackmotor.resumealleffects
     */
    ResumeAllEffects() {
        if (!this.HasProp("__IForceFeedbackMotor")) {
            if ((queryResult := this.QueryInterface(IForceFeedbackMotor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IForceFeedbackMotor := IForceFeedbackMotor(outPtr)
        }

        return this.__IForceFeedbackMotor.ResumeAllEffects()
    }

    /**
     * Stops all force feedback effects.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.forcefeedback.forcefeedbackmotor.stopalleffects
     */
    StopAllEffects() {
        if (!this.HasProp("__IForceFeedbackMotor")) {
            if ((queryResult := this.QueryInterface(IForceFeedbackMotor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IForceFeedbackMotor := IForceFeedbackMotor(outPtr)
        }

        return this.__IForceFeedbackMotor.StopAllEffects()
    }

    /**
     * Attempts to asynchronously disable the force feedback motor.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.forcefeedback.forcefeedbackmotor.trydisableasync
     */
    TryDisableAsync() {
        if (!this.HasProp("__IForceFeedbackMotor")) {
            if ((queryResult := this.QueryInterface(IForceFeedbackMotor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IForceFeedbackMotor := IForceFeedbackMotor(outPtr)
        }

        return this.__IForceFeedbackMotor.TryDisableAsync()
    }

    /**
     * Try to asynchronously enable the force feedback motor of the device.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.forcefeedback.forcefeedbackmotor.tryenableasync
     */
    TryEnableAsync() {
        if (!this.HasProp("__IForceFeedbackMotor")) {
            if ((queryResult := this.QueryInterface(IForceFeedbackMotor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IForceFeedbackMotor := IForceFeedbackMotor(outPtr)
        }

        return this.__IForceFeedbackMotor.TryEnableAsync()
    }

    /**
     * Attempts to asynchronously reset the device back to its initial state.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.forcefeedback.forcefeedbackmotor.tryresetasync
     */
    TryResetAsync() {
        if (!this.HasProp("__IForceFeedbackMotor")) {
            if ((queryResult := this.QueryInterface(IForceFeedbackMotor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IForceFeedbackMotor := IForceFeedbackMotor(outPtr)
        }

        return this.__IForceFeedbackMotor.TryResetAsync()
    }

    /**
     * Attempts to asynchronously unload a feedback effect from the device's internal memory.
     * @param {IForceFeedbackEffect} effect_ The effect to unload.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.forcefeedback.forcefeedbackmotor.tryunloadeffectasync
     */
    TryUnloadEffectAsync(effect_) {
        if (!this.HasProp("__IForceFeedbackMotor")) {
            if ((queryResult := this.QueryInterface(IForceFeedbackMotor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IForceFeedbackMotor := IForceFeedbackMotor(outPtr)
        }

        return this.__IForceFeedbackMotor.TryUnloadEffectAsync(effect_)
    }

;@endregion Instance Methods
}

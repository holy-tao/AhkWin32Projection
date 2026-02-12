#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IForceFeedbackEffect.ahk
#Include .\IPeriodicForceEffect.ahk
#Include .\IPeriodicForceEffectFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * A force feedback effect which applies a varying force, defined by a waveform, along a vector.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.forcefeedback.periodicforceeffect
 * @namespace Windows.Gaming.Input.ForceFeedback
 * @version WindowsRuntime 1.4
 */
class PeriodicForceEffect extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IForceFeedbackEffect

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IForceFeedbackEffect.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates an instance of [PeriodicForceEffect](periodicforceeffect.md).
     * @param {Integer} effectKind The type of effect to create.
     * @returns {PeriodicForceEffect} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.forcefeedback.periodicforceeffect.#ctor
     */
    static CreateInstance(effectKind) {
        if (!PeriodicForceEffect.HasProp("__IPeriodicForceEffectFactory")) {
            activatableClassId := HSTRING.Create("Windows.Gaming.Input.ForceFeedback.PeriodicForceEffect")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPeriodicForceEffectFactory.IID)
            PeriodicForceEffect.__IPeriodicForceEffectFactory := IPeriodicForceEffectFactory(factoryPtr)
        }

        return PeriodicForceEffect.__IPeriodicForceEffectFactory.CreateInstance(effectKind)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Specifies the percentage by which to reduce the force of the effect.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.forcefeedback.periodicforceeffect.gain
     * @type {Float} 
     */
    Gain {
        get => this.get_Gain()
        set => this.put_Gain(value)
    }

    /**
     * The current state of the force feedback effect.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.forcefeedback.periodicforceeffect.state
     * @type {Integer} 
     */
    State {
        get => this.get_State()
    }

    /**
     * The type of periodic force feedback effect.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.forcefeedback.periodicforceeffect.kind
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Gain() {
        if (!this.HasProp("__IForceFeedbackEffect")) {
            if ((queryResult := this.QueryInterface(IForceFeedbackEffect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IForceFeedbackEffect := IForceFeedbackEffect(outPtr)
        }

        return this.__IForceFeedbackEffect.get_Gain()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_Gain(value) {
        if (!this.HasProp("__IForceFeedbackEffect")) {
            if ((queryResult := this.QueryInterface(IForceFeedbackEffect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IForceFeedbackEffect := IForceFeedbackEffect(outPtr)
        }

        return this.__IForceFeedbackEffect.put_Gain(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_State() {
        if (!this.HasProp("__IForceFeedbackEffect")) {
            if ((queryResult := this.QueryInterface(IForceFeedbackEffect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IForceFeedbackEffect := IForceFeedbackEffect(outPtr)
        }

        return this.__IForceFeedbackEffect.get_State()
    }

    /**
     * Starts the force feedback effect.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.forcefeedback.periodicforceeffect.start
     */
    Start() {
        if (!this.HasProp("__IForceFeedbackEffect")) {
            if ((queryResult := this.QueryInterface(IForceFeedbackEffect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IForceFeedbackEffect := IForceFeedbackEffect(outPtr)
        }

        return this.__IForceFeedbackEffect.Start()
    }

    /**
     * Stops the force feedback effect.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.forcefeedback.periodicforceeffect.stop
     */
    Stop() {
        if (!this.HasProp("__IForceFeedbackEffect")) {
            if ((queryResult := this.QueryInterface(IForceFeedbackEffect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IForceFeedbackEffect := IForceFeedbackEffect(outPtr)
        }

        return this.__IForceFeedbackEffect.Stop()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Kind() {
        if (!this.HasProp("__IPeriodicForceEffect")) {
            if ((queryResult := this.QueryInterface(IPeriodicForceEffect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPeriodicForceEffect := IPeriodicForceEffect(outPtr)
        }

        return this.__IPeriodicForceEffect.get_Kind()
    }

    /**
     * Sets the parameters for the force feedback effect.
     * @param {Vector3} vector A vector describing the direction and magnitude of the effect on each axis. Each individual axis has a range of -1.0 to 1.0 and is independent of the other axes. Specifying a negative value for an axis reverses the input values from the axis.
     * @param {Float} frequency The number of times the periodic wave occurs in one second.
     * @param {Float} phase The phase offset from the origin of the periodic waveform, where 0.0 equals zero degrees of offset, and 1.0 equals 360 degrees of offset. For example, a phase value of 0.25 would correspond to a phase offset of 90 degrees.
     * @param {Float} bias The adjustment to add to the magnitude after calculating the wave and before applying the ramp or gain. Range is between -1 and 1.
     * @param {TimeSpan} duration_ The duration of the effect.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.forcefeedback.periodicforceeffect.setparameters
     */
    SetParameters(vector, frequency, phase, bias, duration_) {
        if (!this.HasProp("__IPeriodicForceEffect")) {
            if ((queryResult := this.QueryInterface(IPeriodicForceEffect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPeriodicForceEffect := IPeriodicForceEffect(outPtr)
        }

        return this.__IPeriodicForceEffect.SetParameters(vector, frequency, phase, bias, duration_)
    }

    /**
     * Sets the parameters for the effect and sets an envelope for the effect.
     * @param {Vector3} vector A vector describing the direction and magnitude of the effect on each axis. Each individual axis has a range of -1.0 to 1.0 and is independent of the other axes. Specifying a negative value for an axis reverses the input values from the axis.
     * @param {Float} frequency The number of times the periodic wave occurs in one second.
     * @param {Float} phase The phase offset from the origin of the periodic waveform, where 0.0 equals zero degrees of offset, and 1.0 equals 360 degrees of offset. For example, a phase value of 0.25 would correspond to a phase offset of 90 degrees.
     * @param {Float} bias The adjustment to add to the magnitude after calculating the wave and before applying the ramp or gain. Range is between -1 and 1.
     * @param {Float} attackGain Percentage by which to reduce the strength of the effect when it is ramping up.
     * @param {Float} sustainGain Percentage by which to reduce the strength of the effect when it is sustaining.
     * @param {Float} releaseGain Percentage by which to reduce the strength of the effect when it is ramping down.
     * @param {TimeSpan} startDelay Time to delay the effect before starting.
     * @param {TimeSpan} attackDuration Time to ramp up to the effect's full strength.
     * @param {TimeSpan} sustainDuration Time to maintain the effect at full strength.
     * @param {TimeSpan} releaseDuration Time to ramp down from full strength to zero.
     * @param {Integer} repeatCount The number of times to repeat the effect.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.forcefeedback.periodicforceeffect.setparameterswithenvelope
     */
    SetParametersWithEnvelope(vector, frequency, phase, bias, attackGain, sustainGain, releaseGain, startDelay, attackDuration, sustainDuration, releaseDuration, repeatCount) {
        if (!this.HasProp("__IPeriodicForceEffect")) {
            if ((queryResult := this.QueryInterface(IPeriodicForceEffect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPeriodicForceEffect := IPeriodicForceEffect(outPtr)
        }

        return this.__IPeriodicForceEffect.SetParametersWithEnvelope(vector, frequency, phase, bias, attackGain, sustainGain, releaseGain, startDelay, attackDuration, sustainDuration, releaseDuration, repeatCount)
    }

;@endregion Instance Methods
}

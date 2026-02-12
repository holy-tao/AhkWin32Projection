#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IForceFeedbackEffect.ahk
#Include .\IRampForceEffect.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * A force feedback effect which applies a linearly increasing or decreasing force along a vector.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.forcefeedback.rampforceeffect
 * @namespace Windows.Gaming.Input.ForceFeedback
 * @version WindowsRuntime 1.4
 */
class RampForceEffect extends IInspectable {
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

;@region Instance Properties
    /**
     * Specifies the percentage by which to reduce the force of the effect.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.forcefeedback.rampforceeffect.gain
     * @type {Float} 
     */
    Gain {
        get => this.get_Gain()
        set => this.put_Gain(value)
    }

    /**
     * The current state of the effect.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.forcefeedback.rampforceeffect.state
     * @type {Integer} 
     */
    State {
        get => this.get_State()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates an instance of [RampForceEffect](rampforceeffect.md).
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Gaming.Input.ForceFeedback.RampForceEffect")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

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
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.forcefeedback.rampforceeffect.start
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
     * Stops the effect.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.forcefeedback.rampforceeffect.stop
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
     * Sets the parameters for the ramp force feedback effect.
     * @param {Vector3} startVector A vector describing the direction and magnitude of the effect on each axis when the effect is starting. Each individual axis has a range of -1.0 to 1.0 and is independent of the other axes. Specifying a negative value for an axis reverses the input values from the axis.
     * @param {Vector3} endVector A vector describing the direction and magnitude of the effect on each axis when the effect is ending. Each individual axis has a range of -1.0 to 1.0 and is independent of the other axes. Specifying a negative value for an axis reverses the input values from the axis.
     * @param {TimeSpan} duration_ The duration of the effect.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.forcefeedback.rampforceeffect.setparameters
     */
    SetParameters(startVector, endVector, duration_) {
        if (!this.HasProp("__IRampForceEffect")) {
            if ((queryResult := this.QueryInterface(IRampForceEffect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRampForceEffect := IRampForceEffect(outPtr)
        }

        return this.__IRampForceEffect.SetParameters(startVector, endVector, duration_)
    }

    /**
     * Sets the parameters for the effect and sets an envelope for the effect.
     * @param {Vector3} startVector The start vector of the effect.
     * @param {Vector3} endVector The end vector of the effect.
     * @param {Float} attackGain Percentage by which to reduce the strength of the effect when it is ramping up.
     * @param {Float} sustainGain Percentage by which to reduce the strength of the effect when it is sustaining.
     * @param {Float} releaseGain Percentage by which to reduce the strength of the effect when it is ramping down.
     * @param {TimeSpan} startDelay Time to delay the effect before starting.
     * @param {TimeSpan} attackDuration Time to ramp up to the effect's full strength.
     * @param {TimeSpan} sustainDuration Time to maintain the effect at full strength.
     * @param {TimeSpan} releaseDuration Time to ramp down from full strength to zero.
     * @param {Integer} repeatCount The number of times to repeat the effect.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.forcefeedback.rampforceeffect.setparameterswithenvelope
     */
    SetParametersWithEnvelope(startVector, endVector, attackGain, sustainGain, releaseGain, startDelay, attackDuration, sustainDuration, releaseDuration, repeatCount) {
        if (!this.HasProp("__IRampForceEffect")) {
            if ((queryResult := this.QueryInterface(IRampForceEffect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRampForceEffect := IRampForceEffect(outPtr)
        }

        return this.__IRampForceEffect.SetParametersWithEnvelope(startVector, endVector, attackGain, sustainGain, releaseGain, startDelay, attackDuration, sustainDuration, releaseDuration, repeatCount)
    }

;@endregion Instance Methods
}

#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IForceFeedbackEffect.ahk
#Include .\IConditionForceEffect.ahk
#Include .\IConditionForceEffectFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Conditional force effects are forces applied in response to current sensor values within the device. In other words, conditional force effects require information about device motion, such as position or velocity of a joystick handle. In general, conditional force effects are not associated with individual events during a game or other application. They represent ambient phenomena, such as the stiffness or looseness of a flight stick, or the tendency of a steering wheel to return to a straight-ahead position. A conditional force effect does not have a predefined magnitude. The magnitude is scaled in proportion to the movement or position of the input object.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.forcefeedback.conditionforceeffect
 * @namespace Windows.Gaming.Input.ForceFeedback
 * @version WindowsRuntime 1.4
 */
class ConditionForceEffect extends IInspectable {
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
     * Creates an instance of [ConditionForceEffect](conditionforceeffect.md).
     * @param {Integer} effectKind The type of effect to create.
     * @returns {ConditionForceEffect} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.forcefeedback.conditionforceeffect.#ctor
     */
    static CreateInstance(effectKind) {
        if (!ConditionForceEffect.HasProp("__IConditionForceEffectFactory")) {
            activatableClassId := HSTRING.Create("Windows.Gaming.Input.ForceFeedback.ConditionForceEffect")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IConditionForceEffectFactory.IID)
            ConditionForceEffect.__IConditionForceEffectFactory := IConditionForceEffectFactory(factoryPtr)
        }

        return ConditionForceEffect.__IConditionForceEffectFactory.CreateInstance(effectKind)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Specifies the percentage by which to reduce the force of the effect.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.forcefeedback.conditionforceeffect.gain
     * @type {Float} 
     */
    Gain {
        get => this.get_Gain()
        set => this.put_Gain(value)
    }

    /**
     * The current state of the effect.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.forcefeedback.conditionforceeffect.state
     * @type {Integer} 
     */
    State {
        get => this.get_State()
    }

    /**
     * The type of force feedback effect.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.forcefeedback.conditionforceeffect.kind
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
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.forcefeedback.conditionforceeffect.start
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
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.forcefeedback.conditionforceeffect.stop
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
        if (!this.HasProp("__IConditionForceEffect")) {
            if ((queryResult := this.QueryInterface(IConditionForceEffect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConditionForceEffect := IConditionForceEffect(outPtr)
        }

        return this.__IConditionForceEffect.get_Kind()
    }

    /**
     * Sets the parameters for the conditional force feedback effect.
     * @remarks
     * The following image illustrates the effects of the arguments to SetParameters:
     * 
     * <img src="images/conditionalforceeffect_parameters.png" alt="Effects of parameters on force." />
     * In the image, all coefficient values are positive.  A negative value for the coefficient will cause the force (the green line) to go negative below the orange axis line, effectively, reversing the direction of the force.  This is not recommended because unless done carefully it will typically result in a positive feedback loop that will cause the motor to saturate in that direction. Magnitude and dead zone values are always positive, and symmetrical about their respective axes.  (This is illustrated for the dead zone, but the magnitude works the same way – a value of 0.5 limits the feedback force to anywhere between -0.5 and +0.5.) The bias is shown here at 0.0, but changing the value just slides the medium orange line one way or the other.  Note that this does not affect the slope of the green lines, defined by the coefficient values.
     * @param {Vector3} direction_ A vector describing the direction and magnitude of the effect on each axis. Each individual axis has a range of -1.0 to 1.0 and is independent of the other axes. Specifying a negative value for an axis reverses the input values from the axis.
     * @param {Float} positiveCoefficient The slope of the line describing how rapidly the force increases as the input moves away from the center point in the positive direction along the specified axis. Range is from -infinity to +infinity.
     * @param {Float} negativeCoefficient The slope of the line describing how rapidly the force increases as the input moves away from the center point in the negative direction along the specified axis. Range is from -infinity to +infinity.
     * @param {Float} maxPositiveMagnitude The maximum magnitude of the force feedback as the input moves away from the center point in the positive direction along the specified axis. Range is from 0 to 1.0.
     * @param {Float} maxNegativeMagnitude The maximum magnitude of the force feedback as the input moves away from the center point in the negative direction along the specified axis. Range is from 0 to 1.0.
     * @param {Float} deadZone Specifies the value below which the force feedback is not applied. Range is from 0.0 to 1.0 and is applied asymmetrically around the center point.
     * @param {Float} bias The offset to the center point in effect calculations. Range is from -1.0 to 1.0.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.forcefeedback.conditionforceeffect.setparameters
     */
    SetParameters(direction_, positiveCoefficient, negativeCoefficient, maxPositiveMagnitude, maxNegativeMagnitude, deadZone, bias) {
        if (!this.HasProp("__IConditionForceEffect")) {
            if ((queryResult := this.QueryInterface(IConditionForceEffect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConditionForceEffect := IConditionForceEffect(outPtr)
        }

        return this.__IConditionForceEffect.SetParameters(direction_, positiveCoefficient, negativeCoefficient, maxPositiveMagnitude, maxNegativeMagnitude, deadZone, bias)
    }

;@endregion Instance Methods
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\GameInputForceFeedbackEnvelope.ahk
#Include .\GameInputForceFeedbackMagnitude.ahk
#Include .\GameInputForceFeedbackConstantParams.ahk
#Include .\GameInputForceFeedbackRampParams.ahk
#Include .\GameInputForceFeedbackPeriodicParams.ahk
#Include .\GameInputForceFeedbackConditionParams.ahk

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 * @version v4.0.30319
 */
class GameInputForceFeedbackParams extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * @type {Integer}
     */
    kind {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {GameInputForceFeedbackConstantParams}
     */
    constant{
        get {
            if(!this.HasProp("__constant"))
                this.__constant := GameInputForceFeedbackConstantParams(this.ptr + 8)
            return this.__constant
        }
    }

    /**
     * @type {GameInputForceFeedbackRampParams}
     */
    ramp{
        get {
            if(!this.HasProp("__ramp"))
                this.__ramp := GameInputForceFeedbackRampParams(this.ptr + 8)
            return this.__ramp
        }
    }

    /**
     * @type {GameInputForceFeedbackPeriodicParams}
     */
    sineWave{
        get {
            if(!this.HasProp("__sineWave"))
                this.__sineWave := GameInputForceFeedbackPeriodicParams(this.ptr + 8)
            return this.__sineWave
        }
    }

    /**
     * @type {GameInputForceFeedbackPeriodicParams}
     */
    squareWave{
        get {
            if(!this.HasProp("__squareWave"))
                this.__squareWave := GameInputForceFeedbackPeriodicParams(this.ptr + 8)
            return this.__squareWave
        }
    }

    /**
     * @type {GameInputForceFeedbackPeriodicParams}
     */
    triangleWave{
        get {
            if(!this.HasProp("__triangleWave"))
                this.__triangleWave := GameInputForceFeedbackPeriodicParams(this.ptr + 8)
            return this.__triangleWave
        }
    }

    /**
     * @type {GameInputForceFeedbackPeriodicParams}
     */
    sawtoothUpWave{
        get {
            if(!this.HasProp("__sawtoothUpWave"))
                this.__sawtoothUpWave := GameInputForceFeedbackPeriodicParams(this.ptr + 8)
            return this.__sawtoothUpWave
        }
    }

    /**
     * @type {GameInputForceFeedbackPeriodicParams}
     */
    sawtoothDownWave{
        get {
            if(!this.HasProp("__sawtoothDownWave"))
                this.__sawtoothDownWave := GameInputForceFeedbackPeriodicParams(this.ptr + 8)
            return this.__sawtoothDownWave
        }
    }

    /**
     * @type {GameInputForceFeedbackConditionParams}
     */
    spring{
        get {
            if(!this.HasProp("__spring"))
                this.__spring := GameInputForceFeedbackConditionParams(this.ptr + 8)
            return this.__spring
        }
    }

    /**
     * @type {GameInputForceFeedbackConditionParams}
     */
    friction{
        get {
            if(!this.HasProp("__friction"))
                this.__friction := GameInputForceFeedbackConditionParams(this.ptr + 8)
            return this.__friction
        }
    }

    /**
     * @type {GameInputForceFeedbackConditionParams}
     */
    damper{
        get {
            if(!this.HasProp("__damper"))
                this.__damper := GameInputForceFeedbackConditionParams(this.ptr + 8)
            return this.__damper
        }
    }

    /**
     * @type {GameInputForceFeedbackConditionParams}
     */
    inertia{
        get {
            if(!this.HasProp("__inertia"))
                this.__inertia := GameInputForceFeedbackConditionParams(this.ptr + 8)
            return this.__inertia
        }
    }
}

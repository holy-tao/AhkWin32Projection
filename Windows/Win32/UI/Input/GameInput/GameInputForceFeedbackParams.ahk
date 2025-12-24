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
    static sizeof => 120

    static packingSize => 8

    class _data_e__Union extends Win32Struct {
        static sizeof => 112
        static packingSize => 8

        /**
         * @type {GameInputForceFeedbackConstantParams}
         */
        constant{
            get {
                if(!this.HasProp("__constant"))
                    this.__constant := GameInputForceFeedbackConstantParams(0, this)
                return this.__constant
            }
        }
    
        /**
         * @type {GameInputForceFeedbackRampParams}
         */
        ramp{
            get {
                if(!this.HasProp("__ramp"))
                    this.__ramp := GameInputForceFeedbackRampParams(0, this)
                return this.__ramp
            }
        }
    
        /**
         * @type {GameInputForceFeedbackPeriodicParams}
         */
        sineWave{
            get {
                if(!this.HasProp("__sineWave"))
                    this.__sineWave := GameInputForceFeedbackPeriodicParams(0, this)
                return this.__sineWave
            }
        }
    
        /**
         * @type {GameInputForceFeedbackPeriodicParams}
         */
        squareWave{
            get {
                if(!this.HasProp("__squareWave"))
                    this.__squareWave := GameInputForceFeedbackPeriodicParams(0, this)
                return this.__squareWave
            }
        }
    
        /**
         * @type {GameInputForceFeedbackPeriodicParams}
         */
        triangleWave{
            get {
                if(!this.HasProp("__triangleWave"))
                    this.__triangleWave := GameInputForceFeedbackPeriodicParams(0, this)
                return this.__triangleWave
            }
        }
    
        /**
         * @type {GameInputForceFeedbackPeriodicParams}
         */
        sawtoothUpWave{
            get {
                if(!this.HasProp("__sawtoothUpWave"))
                    this.__sawtoothUpWave := GameInputForceFeedbackPeriodicParams(0, this)
                return this.__sawtoothUpWave
            }
        }
    
        /**
         * @type {GameInputForceFeedbackPeriodicParams}
         */
        sawtoothDownWave{
            get {
                if(!this.HasProp("__sawtoothDownWave"))
                    this.__sawtoothDownWave := GameInputForceFeedbackPeriodicParams(0, this)
                return this.__sawtoothDownWave
            }
        }
    
        /**
         * @type {GameInputForceFeedbackConditionParams}
         */
        spring{
            get {
                if(!this.HasProp("__spring"))
                    this.__spring := GameInputForceFeedbackConditionParams(0, this)
                return this.__spring
            }
        }
    
        /**
         * @type {GameInputForceFeedbackConditionParams}
         */
        friction{
            get {
                if(!this.HasProp("__friction"))
                    this.__friction := GameInputForceFeedbackConditionParams(0, this)
                return this.__friction
            }
        }
    
        /**
         * @type {GameInputForceFeedbackConditionParams}
         */
        damper{
            get {
                if(!this.HasProp("__damper"))
                    this.__damper := GameInputForceFeedbackConditionParams(0, this)
                return this.__damper
            }
        }
    
        /**
         * @type {GameInputForceFeedbackConditionParams}
         */
        inertia{
            get {
                if(!this.HasProp("__inertia"))
                    this.__inertia := GameInputForceFeedbackConditionParams(0, this)
                return this.__inertia
            }
        }
    
    }

    /**
     * @type {Integer}
     */
    kind {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {_data_e__Union}
     */
    data{
        get {
            if(!this.HasProp("__data"))
                this.__data := %this.__Class%._data_e__Union(8, this)
            return this.__data
        }
    }
}

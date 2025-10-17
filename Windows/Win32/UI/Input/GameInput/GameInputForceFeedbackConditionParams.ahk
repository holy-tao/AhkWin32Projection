#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\GameInputForceFeedbackMagnitude.ahk

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 * @version v4.0.30319
 */
class GameInputForceFeedbackConditionParams extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * @type {GameInputForceFeedbackMagnitude}
     */
    magnitude{
        get {
            if(!this.HasProp("__magnitude"))
                this.__magnitude := GameInputForceFeedbackMagnitude(0, this)
            return this.__magnitude
        }
    }

    /**
     * @type {Float}
     */
    positiveCoefficient {
        get => NumGet(this, 28, "float")
        set => NumPut("float", value, this, 28)
    }

    /**
     * @type {Float}
     */
    negativeCoefficient {
        get => NumGet(this, 32, "float")
        set => NumPut("float", value, this, 32)
    }

    /**
     * @type {Float}
     */
    maxPositiveMagnitude {
        get => NumGet(this, 36, "float")
        set => NumPut("float", value, this, 36)
    }

    /**
     * @type {Float}
     */
    maxNegativeMagnitude {
        get => NumGet(this, 40, "float")
        set => NumPut("float", value, this, 40)
    }

    /**
     * @type {Float}
     */
    deadZone {
        get => NumGet(this, 44, "float")
        set => NumPut("float", value, this, 44)
    }

    /**
     * @type {Float}
     */
    bias {
        get => NumGet(this, 48, "float")
        set => NumPut("float", value, this, 48)
    }
}

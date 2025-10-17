#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\GameInputForceFeedbackEnvelope.ahk
#Include .\GameInputForceFeedbackMagnitude.ahk

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 * @version v4.0.30319
 */
class GameInputForceFeedbackPeriodicParams extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * @type {GameInputForceFeedbackEnvelope}
     */
    envelope{
        get {
            if(!this.HasProp("__envelope"))
                this.__envelope := GameInputForceFeedbackEnvelope(0, this)
            return this.__envelope
        }
    }

    /**
     * @type {GameInputForceFeedbackMagnitude}
     */
    magnitude{
        get {
            if(!this.HasProp("__magnitude"))
                this.__magnitude := GameInputForceFeedbackMagnitude(48, this)
            return this.__magnitude
        }
    }

    /**
     * @type {Float}
     */
    frequency {
        get => NumGet(this, 76, "float")
        set => NumPut("float", value, this, 76)
    }

    /**
     * @type {Float}
     */
    phase {
        get => NumGet(this, 80, "float")
        set => NumPut("float", value, this, 80)
    }

    /**
     * @type {Float}
     */
    bias {
        get => NumGet(this, 84, "float")
        set => NumPut("float", value, this, 84)
    }
}

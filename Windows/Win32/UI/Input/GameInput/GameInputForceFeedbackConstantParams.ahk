#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\GameInputForceFeedbackEnvelope.ahk
#Include .\GameInputForceFeedbackMagnitude.ahk

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 * @version v4.0.30319
 */
class GameInputForceFeedbackConstantParams extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * @type {GameInputForceFeedbackEnvelope}
     */
    envelope{
        get {
            if(!this.HasProp("__envelope"))
                this.__envelope := GameInputForceFeedbackEnvelope(this.ptr + 0)
            return this.__envelope
        }
    }

    /**
     * @type {GameInputForceFeedbackMagnitude}
     */
    magnitude{
        get {
            if(!this.HasProp("__magnitude"))
                this.__magnitude := GameInputForceFeedbackMagnitude(this.ptr + 48)
            return this.__magnitude
        }
    }
}

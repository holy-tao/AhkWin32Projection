#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\GameInputForceFeedbackEnvelope.ahk
#Include .\GameInputForceFeedbackMagnitude.ahk

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 * @version v4.0.30319
 */
class GameInputForceFeedbackRampParams extends Win32Struct
{
    static sizeof => 112

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
    startMagnitude{
        get {
            if(!this.HasProp("__startMagnitude"))
                this.__startMagnitude := GameInputForceFeedbackMagnitude(48, this)
            return this.__startMagnitude
        }
    }

    /**
     * @type {GameInputForceFeedbackMagnitude}
     */
    endMagnitude{
        get {
            if(!this.HasProp("__endMagnitude"))
                this.__endMagnitude := GameInputForceFeedbackMagnitude(80, this)
            return this.__endMagnitude
        }
    }
}

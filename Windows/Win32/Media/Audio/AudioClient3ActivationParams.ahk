#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.Media.Audio
 */
class AudioClient3ActivationParams extends Win32Struct {
    static sizeof => 16

    static packingSize => 4

    /**
     * @type {Guid}
     */
    tracingContextId {
        get {
            if(!this.HasProp("__tracingContextId"))
                this.__tracingContextId := Guid(0, this)
            return this.__tracingContextId
        }
    }
}

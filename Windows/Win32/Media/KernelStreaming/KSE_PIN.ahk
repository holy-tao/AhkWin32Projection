#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\KSIDENTIFIER.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSE_PIN extends Win32Struct {
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {KSIDENTIFIER}
     */
    Event {
        get {
            if(!this.HasProp("__Event"))
                this.__Event := KSIDENTIFIER(0, this)
            return this.__Event
        }
    }

    /**
     * @type {Integer}
     */
    PinId {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }
}

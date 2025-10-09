#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\KSIDENTIFIER.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSE_NODE extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {KSIDENTIFIER}
     */
    Event{
        get {
            if(!this.HasProp("__Event"))
                this.__Event := KSIDENTIFIER(this.ptr + 0)
            return this.__Event
        }
    }

    /**
     * @type {Integer}
     */
    NodeId {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class KERNEL_SOFT_RESTART_NOTIFICATION extends Win32Struct {
    static sizeof => 20

    static packingSize => 4

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * @type {Guid}
     */
    Event {
        get {
            if(!this.HasProp("__Event"))
                this.__Event := Guid(4, this)
            return this.__Event
        }
    }
}

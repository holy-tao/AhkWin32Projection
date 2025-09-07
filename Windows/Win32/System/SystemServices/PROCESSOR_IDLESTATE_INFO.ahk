#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 * @version v4.0.30319
 */
class PROCESSOR_IDLESTATE_INFO extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {Integer}
     */
    TimeCheck {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    DemotePercent {
        get => NumGet(this, 4, "char")
        set => NumPut("char", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    PromotePercent {
        get => NumGet(this, 5, "char")
        set => NumPut("char", value, this, 5)
    }

    /**
     * @type {Array<Byte>}
     */
    Spare{
        get {
            if(!this.HasProp("__SpareProxyArray"))
                this.__SpareProxyArray := Win32FixedArray(this.ptr + 6, 1, Primitive, "char")
            return this.__SpareProxyArray
        }
    }
}

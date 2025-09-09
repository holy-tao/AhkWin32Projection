#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Hypervisor
 * @version v4.0.30319
 */
class WHV_X64_TABLE_REGISTER extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Array<UInt16>}
     */
    Pad{
        get {
            if(!this.HasProp("__PadProxyArray"))
                this.__PadProxyArray := Win32FixedArray(this.ptr + 0, 3, Primitive, "ushort")
            return this.__PadProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    Limit {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }

    /**
     * @type {Integer}
     */
    Base {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}

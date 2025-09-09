#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class VIDEO_PALETTE_DATA extends Win32Struct
{
    static sizeof => 6

    static packingSize => 2

    /**
     * @type {Integer}
     */
    NumEntries {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    FirstEntry {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * @type {Array<UInt16>}
     */
    Colors{
        get {
            if(!this.HasProp("__ColorsProxyArray"))
                this.__ColorsProxyArray := Win32FixedArray(this.ptr + 4, 1, Primitive, "ushort")
            return this.__ColorsProxyArray
        }
    }
}

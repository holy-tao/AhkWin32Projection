#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class ColorPalette extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Count {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Array<UInt32>}
     */
    Entries{
        get {
            if(!this.HasProp("__EntriesProxyArray"))
                this.__EntriesProxyArray := Win32FixedArray(this.ptr + 8, 4, Primitive, "uint")
            return this.__EntriesProxyArray
        }
    }
}

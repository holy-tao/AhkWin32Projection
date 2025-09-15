#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.VirtualDosMachines
 * @version v4.0.30319
 */
class VDM_SEGINFO extends Win32Struct
{
    static sizeof => 540

    static packingSize => 4

    /**
     * @type {Integer}
     */
    Selector {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    SegNumber {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    Length {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * @type {String}
     */
    ModuleName {
        get => StrGet(this.ptr + 10, 8, "UTF-16")
        set => StrPut(value, this.ptr + 10, 8, "UTF-16")
    }

    /**
     * @type {String}
     */
    FileName {
        get => StrGet(this.ptr + 28, 254, "UTF-16")
        set => StrPut(value, this.ptr + 28, 254, "UTF-16")
    }
}

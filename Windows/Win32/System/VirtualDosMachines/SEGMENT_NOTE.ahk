#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.VirtualDosMachines
 * @version v4.0.30319
 */
class SEGMENT_NOTE extends Win32Struct
{
    static sizeof => 544

    static packingSize => 4

    /**
     * @type {Integer}
     */
    Selector1 {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Selector2 {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    Segment {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * @type {String}
     */
    Module {
        get => StrGet(this.ptr + 6, 9, "UTF-16")
        set => StrPut(value, this.ptr + 6, 9, "UTF-16")
    }

    /**
     * @type {String}
     */
    FileName {
        get => StrGet(this.ptr + 26, 255, "UTF-16")
        set => StrPut(value, this.ptr + 26, 255, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 538, "ushort")
        set => NumPut("ushort", value, this, 538)
    }

    /**
     * @type {Integer}
     */
    Length {
        get => NumGet(this, 540, "uint")
        set => NumPut("uint", value, this, 540)
    }
}

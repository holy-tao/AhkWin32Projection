#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
class FLAT_STRING extends Win32Struct {
    static sizeof => 6

    static packingSize => 2

    /**
     * @type {Integer}
     */
    MaximumLength {
        get => NumGet(this, 0, "short")
        set => NumPut("short", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Length {
        get => NumGet(this, 2, "short")
        set => NumPut("short", value, this, 2)
    }

    /**
     * @type {String}
     */
    Buffer {
        get => StrGet(this.ptr + 4, 0, "UTF-8")
        set => StrPut(value, this.ptr + 4, 0, "UTF-8")
    }
}

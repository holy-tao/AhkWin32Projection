#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
class DEBUG_POOLTAG_DESCRIPTION extends Win32Struct {
    static sizeof => 332

    static packingSize => 4

    /**
     * @type {Integer}
     */
    SizeOfStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    PoolTag {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {String}
     */
    Description {
        get => StrGet(this.ptr + 8, 259, "UTF-8")
        set => StrPut(value, this.ptr + 8, 259, "UTF-8")
    }

    /**
     * @type {String}
     */
    Binary {
        get => StrGet(this.ptr + 268, 31, "UTF-8")
        set => StrPut(value, this.ptr + 268, 31, "UTF-8")
    }

    /**
     * @type {String}
     */
    Owner {
        get => StrGet(this.ptr + 300, 31, "UTF-8")
        set => StrPut(value, this.ptr + 300, 31, "UTF-8")
    }
}

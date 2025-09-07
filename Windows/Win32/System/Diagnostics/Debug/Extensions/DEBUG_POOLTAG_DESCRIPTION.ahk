#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class DEBUG_POOLTAG_DESCRIPTION extends Win32Struct
{
    static sizeof => 656

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
        get => StrGet(this.ptr + 8, 259, "UTF-16")
        set => StrPut(value, this.ptr + 8, 259, "UTF-16")
    }

    /**
     * @type {String}
     */
    Binary {
        get => StrGet(this.ptr + 528, 31, "UTF-16")
        set => StrPut(value, this.ptr + 528, 31, "UTF-16")
    }

    /**
     * @type {String}
     */
    Owner {
        get => StrGet(this.ptr + 592, 31, "UTF-16")
        set => StrPut(value, this.ptr + 592, 31, "UTF-16")
    }
}

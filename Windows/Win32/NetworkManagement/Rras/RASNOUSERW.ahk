#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 * @charset Unicode
 */
class RASNOUSERW extends Win32Struct
{
    static sizeof => 1072

    static packingSize => 4

    /**
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    dwTimeoutMs {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {String}
     */
    szUserName {
        get => StrGet(this.ptr + 12, 256, "UTF-16")
        set => StrPut(value, this.ptr + 12, 256, "UTF-16")
    }

    /**
     * @type {String}
     */
    szPassword {
        get => StrGet(this.ptr + 526, 256, "UTF-16")
        set => StrPut(value, this.ptr + 526, 256, "UTF-16")
    }

    /**
     * @type {String}
     */
    szDomain {
        get => StrGet(this.ptr + 1040, 15, "UTF-16")
        set => StrPut(value, this.ptr + 1040, 15, "UTF-16")
    }
}

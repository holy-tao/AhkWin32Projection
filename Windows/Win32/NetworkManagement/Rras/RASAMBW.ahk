#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 * @charset Unicode
 */
class RASAMBW extends Win32Struct
{
    static sizeof => 44

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
    dwError {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {String}
     */
    szNetBiosError {
        get => StrGet(this.ptr + 8, 16, "UTF-16")
        set => StrPut(value, this.ptr + 8, 16, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    bLana {
        get => NumGet(this, 42, "char")
        set => NumPut("char", value, this, 42)
    }
}

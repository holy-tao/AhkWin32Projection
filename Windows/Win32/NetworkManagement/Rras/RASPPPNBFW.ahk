#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 * @charset Unicode
 */
class RASPPPNBFW extends Win32Struct
{
    static sizeof => 84

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
     * @type {Integer}
     */
    dwNetBiosError {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {String}
     */
    szNetBiosError {
        get => StrGet(this.ptr + 12, 16, "UTF-16")
        set => StrPut(value, this.ptr + 12, 16, "UTF-16")
    }

    /**
     * @type {String}
     */
    szWorkstationName {
        get => StrGet(this.ptr + 46, 16, "UTF-16")
        set => StrPut(value, this.ptr + 46, 16, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    bLana {
        get => NumGet(this, 80, "char")
        set => NumPut("char", value, this, 80)
    }
}

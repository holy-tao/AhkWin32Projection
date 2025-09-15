#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 * @charset ANSI
 */
class RASCREDENTIALSA extends Win32Struct
{
    static sizeof => 540

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
    dwMask {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {String}
     */
    szUserName {
        get => StrGet(this.ptr + 8, 256, "UTF-8")
        set => StrPut(value, this.ptr + 8, 256, "UTF-8")
    }

    /**
     * @type {String}
     */
    szPassword {
        get => StrGet(this.ptr + 265, 256, "UTF-8")
        set => StrPut(value, this.ptr + 265, 256, "UTF-8")
    }

    /**
     * @type {String}
     */
    szDomain {
        get => StrGet(this.ptr + 522, 15, "UTF-8")
        set => StrPut(value, this.ptr + 522, 15, "UTF-8")
    }
}

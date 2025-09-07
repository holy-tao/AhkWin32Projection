#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 * @charset Unicode
 */
class RASPPPIPW extends Win32Struct
{
    static sizeof => 80

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
    szIpAddress {
        get => StrGet(this.ptr + 8, 15, "UTF-16")
        set => StrPut(value, this.ptr + 8, 15, "UTF-16")
    }

    /**
     * @type {String}
     */
    szServerIpAddress {
        get => StrGet(this.ptr + 40, 15, "UTF-16")
        set => StrPut(value, this.ptr + 40, 15, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    dwOptions {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * @type {Integer}
     */
    dwServerOptions {
        get => NumGet(this, 76, "uint")
        set => NumPut("uint", value, this, 76)
    }
}

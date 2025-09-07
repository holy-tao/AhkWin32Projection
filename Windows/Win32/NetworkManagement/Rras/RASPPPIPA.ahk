#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 * @charset ANSI
 */
class RASPPPIPA extends Win32Struct
{
    static sizeof => 48

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
        get => StrGet(this.ptr + 8, 15, "UTF-8")
        set => StrPut(value, this.ptr + 8, 15, "UTF-8")
    }

    /**
     * @type {String}
     */
    szServerIpAddress {
        get => StrGet(this.ptr + 24, 15, "UTF-8")
        set => StrPut(value, this.ptr + 24, 15, "UTF-8")
    }

    /**
     * @type {Integer}
     */
    dwOptions {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    dwServerOptions {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }
}

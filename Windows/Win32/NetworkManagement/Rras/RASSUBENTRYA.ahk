#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 * @charset ANSI
 */
class RASSUBENTRYA extends Win32Struct
{
    static sizeof => 288

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
    dwfFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {String}
     */
    szDeviceType {
        get => StrGet(this.ptr + 8, 16, "UTF-8")
        set => StrPut(value, this.ptr + 8, 16, "UTF-8")
    }

    /**
     * @type {String}
     */
    szDeviceName {
        get => StrGet(this.ptr + 25, 128, "UTF-8")
        set => StrPut(value, this.ptr + 25, 128, "UTF-8")
    }

    /**
     * @type {String}
     */
    szLocalPhoneNumber {
        get => StrGet(this.ptr + 154, 128, "UTF-8")
        set => StrPut(value, this.ptr + 154, 128, "UTF-8")
    }

    /**
     * @type {Integer}
     */
    dwAlternateOffset {
        get => NumGet(this, 284, "uint")
        set => NumPut("uint", value, this, 284)
    }
}

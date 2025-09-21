#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 * @charset ANSI
 */
class HWPROFILEINFO_A extends Win32Struct
{
    static sizeof => 88

    static packingSize => 4

    /**
     * @type {Integer}
     */
    HWPI_ulHWProfile {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {String}
     */
    HWPI_szFriendlyName {
        get => StrGet(this.ptr + 4, 79, "UTF-8")
        set => StrPut(value, this.ptr + 4, 79, "UTF-8")
    }

    /**
     * @type {Integer}
     */
    HWPI_dwFlags {
        get => NumGet(this, 84, "uint")
        set => NumPut("uint", value, this, 84)
    }
}

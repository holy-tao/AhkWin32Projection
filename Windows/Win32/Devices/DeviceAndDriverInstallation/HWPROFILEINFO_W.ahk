#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 * @charset Unicode
 */
class HWPROFILEINFO_W extends Win32Struct
{
    static sizeof => 168

    static packingSize => 1

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
        get => StrGet(this.ptr + 4, 79, "UTF-16")
        set => StrPut(value, this.ptr + 4, 79, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    HWPI_dwFlags {
        get => NumGet(this, 164, "uint")
        set => NumPut("uint", value, this, 164)
    }
}

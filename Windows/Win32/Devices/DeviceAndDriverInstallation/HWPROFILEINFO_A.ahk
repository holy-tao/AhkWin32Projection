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

    static packingSize => 1

    /**
     * @type {Integer}
     */
    HWPI_ulHWProfile {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<SByte>}
     */
    HWPI_szFriendlyName{
        get {
            if(!this.HasProp("__HWPI_szFriendlyNameProxyArray"))
                this.__HWPI_szFriendlyNameProxyArray := Win32FixedArray(this.ptr + 4, 80, Primitive, "char")
            return this.__HWPI_szFriendlyNameProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    HWPI_dwFlags {
        get => NumGet(this, 84, "uint")
        set => NumPut("uint", value, this, 84)
    }
}

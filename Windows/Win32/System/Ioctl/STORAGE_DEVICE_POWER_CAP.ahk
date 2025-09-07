#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * This structure is used as an input and output buffer for the IOCTL_STORAGE_DEVICE_POWER_CAP.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-storage_device_power_cap
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class STORAGE_DEVICE_POWER_CAP extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The version of this structure. This should be set to STORAGE_DEVICE_POWER_CAP_VERSION_V1.
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The size of this structure.
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The units of the <i>MaxPower</i> value, of type <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ne-winioctl-storage_device_power_cap_units">STORAGE_DEVICE_POWER_CAP_UNITS</a>.
     * @type {Integer}
     */
    Units {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Contains the value of the actual maximum power consumption level of the device. This may be equal to, less than, or greater than the desired threshold, depending on what the device supports.
     * @type {Integer}
     */
    MaxPower {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}

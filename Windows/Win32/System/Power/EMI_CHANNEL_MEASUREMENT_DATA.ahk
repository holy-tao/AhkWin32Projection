#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The EMI_MEASUREMENT_DATA structure provides data about the current energy measurement and the time at which the measurement was taken.
 * @remarks
 * This structure is returned through a successful completion of an <a href="https://docs.microsoft.com/windows/desktop/api/emi/ni-emi-ioctl_emi_get_measurement">IOCTL_EMI_GET_MEASUREMENT</a> IOCTL request.
 * @see https://learn.microsoft.com/windows/win32/api/emi/ns-emi-emi_channel_measurement_data
 * @namespace Windows.Win32.System.Power
 * @version v4.0.30319
 */
class EMI_CHANNEL_MEASUREMENT_DATA extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The total accumulated energy in the units specified by the [EMI_METADATA](./ns-emi-emi_metadata_v1.md) struct returned by <a href="https://docs.microsoft.com/windows/desktop/api/emi/ni-emi-ioctl_emi_get_metadata">IOCTL_EMI_GET_METADATA</a>. In <b>EMI_VERSION_V1</b>, the only supported unit is picowatt-hours.
     * @type {Integer}
     */
    AbsoluteEnergy {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The time at which the energy measurement was taken, in 100 ns intervals.
     * @type {Integer}
     */
    AbsoluteTime {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}

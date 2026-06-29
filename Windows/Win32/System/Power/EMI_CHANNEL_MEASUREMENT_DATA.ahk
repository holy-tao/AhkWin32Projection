#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The EMI_MEASUREMENT_DATA structure provides data about the current energy measurement and the time at which the measurement was taken.
 * @remarks
 * This structure is returned through a successful completion of an <a href="https://docs.microsoft.com/windows/desktop/api/emi/ni-emi-ioctl_emi_get_measurement">IOCTL_EMI_GET_MEASUREMENT</a> IOCTL request.
 * @see https://learn.microsoft.com/windows/win32/api/emi/ns-emi-emi_channel_measurement_data
 * @namespace Windows.Win32.System.Power
 */
export default struct EMI_CHANNEL_MEASUREMENT_DATA {
    #StructPack 8

    /**
     * The total accumulated energy in the units specified by the [EMI_METADATA](./ns-emi-emi_metadata_v1.md) struct returned by <a href="https://docs.microsoft.com/windows/desktop/api/emi/ni-emi-ioctl_emi_get_metadata">IOCTL_EMI_GET_METADATA</a>. In <b>EMI_VERSION_V1</b>, the only supported unit is picowatt-hours.
     */
    AbsoluteEnergy : Int64

    /**
     * The time at which the energy measurement was taken, in 100 ns intervals.
     */
    AbsoluteTime : Int64

}

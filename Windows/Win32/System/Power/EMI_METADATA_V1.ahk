#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\EMI_MEASUREMENT_UNIT.ahk" { EMI_MEASUREMENT_UNIT }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * The EMI_METADATA structure provides metadata about a device that supports the Energy Metering Interface (EMI) interface, such as the hardware model and hardware revision.
 * @remarks
 * This structure is returned through a successful completion of an <a href="https://docs.microsoft.com/windows/desktop/api/emi/ni-emi-ioctl_emi_get_metadata">IOCTL_EMI_GET_METADATA</a> IOCTL request.
 * @see https://learn.microsoft.com/windows/win32/api/emi/ns-emi-emi_metadata_v1
 * @namespace Windows.Win32.System.Power
 */
export default struct EMI_METADATA_V1 {
    #StructPack 4

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/emi/ne-emi-emi_measurement_unit">EMI_MEASUREMENT_UNIT</a> that specifies the unit of energy measurements that can be obtained from the device by calling <a href="https://docs.microsoft.com/windows/desktop/api/emi/ni-emi-ioctl_emi_get_measurement">IOCTL_EMI_GET_MEASUREMENT</a>. In devices that support <b>EMI_VERSION_V1</b>, the only supported unit is <b>EmiMeasurementUnitPicowattHours</b>.
     */
    MeasurementUnit : EMI_MEASUREMENT_UNIT

    /**
     * A null-terminated, Unicode string that contains the name of the OEM.
     */
    HardwareOEM : WCHAR[16]

    /**
     * A null-terminated, Unicode string that specifies the device model.
     */
    HardwareModel : WCHAR[16]

    /**
     * A value that specifies the current revision of the device.
     */
    HardwareRevision : UInt16

    /**
     * The size of <b>MeteredHardwareName</b> in bytes, including the null terminator.
     */
    MeteredHardwareNameSize : UInt16

    /**
     * A null-terminated, Unicode string that specifies the metered hardware name.
     */
    MeteredHardwareName : WCHAR[1]

}

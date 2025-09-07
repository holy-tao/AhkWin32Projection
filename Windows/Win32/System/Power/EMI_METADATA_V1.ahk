#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The EMI_METADATA structure provides metadata about a device that supports the Energy Metering Interface (EMI) interface, such as the hardware model and hardware revision.
 * @remarks
 * This structure is returned through a successful completion of an <a href="https://docs.microsoft.com/windows/desktop/api/emi/ni-emi-ioctl_emi_get_metadata">IOCTL_EMI_GET_METADATA</a> IOCTL request.
 * @see https://learn.microsoft.com/windows/win32/api/emi/ns-emi-emi_metadata_v1
 * @namespace Windows.Win32.System.Power
 * @version v4.0.30319
 */
class EMI_METADATA_V1 extends Win32Struct
{
    static sizeof => 76

    static packingSize => 4

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/emi/ne-emi-emi_measurement_unit">EMI_MEASUREMENT_UNIT</a> that specifies the unit of energy measurements that can be obtained from the device by calling <a href="https://docs.microsoft.com/windows/desktop/api/emi/ni-emi-ioctl_emi_get_measurement">IOCTL_EMI_GET_MEASUREMENT</a>. In devices that support <b>EMI_VERSION_V1</b>, the only supported unit is <b>EmiMeasurementUnitPicowattHours</b>.
     * @type {Integer}
     */
    MeasurementUnit {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * A null-terminated, Unicode string that contains the name of the OEM.
     * @type {String}
     */
    HardwareOEM {
        get => StrGet(this.ptr + 4, 15, "UTF-16")
        set => StrPut(value, this.ptr + 4, 15, "UTF-16")
    }

    /**
     * A null-terminated, Unicode string that specifies the device model.
     * @type {String}
     */
    HardwareModel {
        get => StrGet(this.ptr + 36, 15, "UTF-16")
        set => StrPut(value, this.ptr + 36, 15, "UTF-16")
    }

    /**
     * A value that specifies the current revision of the device.
     * @type {Integer}
     */
    HardwareRevision {
        get => NumGet(this, 68, "ushort")
        set => NumPut("ushort", value, this, 68)
    }

    /**
     * The size of <b>MeteredHardwareName</b> in bytes, including the null terminator.
     * @type {Integer}
     */
    MeteredHardwareNameSize {
        get => NumGet(this, 70, "ushort")
        set => NumPut("ushort", value, this, 70)
    }

    /**
     * A null-terminated, Unicode string that specifies the metered hardware name.
     * @type {String}
     */
    MeteredHardwareName {
        get => StrGet(this.ptr + 72, 0, "UTF-16")
        set => StrPut(value, this.ptr + 72, 0, "UTF-16")
    }
}

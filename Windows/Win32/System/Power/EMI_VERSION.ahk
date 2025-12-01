#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The EMI_VERSION structure describes the version of the Energy Metering Interface (EMI) that is supported by a device.
 * @remarks
 * This structure is returned through a successful completion of an <a href="https://docs.microsoft.com/windows/desktop/api/emi/ni-emi-ioctl_emi_get_version">IOCTL_EMI_GET_VERSION</a> IOCTL request.
 * @see https://learn.microsoft.com/windows/win32/api/emi/ns-emi-emi_version
 * @namespace Windows.Win32.System.Power
 * @version v4.0.30319
 */
class EMI_VERSION extends Win32Struct
{
    static sizeof => 2

    static packingSize => 2

    /**
     * The version of the Energy Metering Interface (EMI) that is supported by a device. Currently, the only supported version is <b>EMI_VERSION_V1</b> (as defined in emi.h).
     * @type {Integer}
     */
    EmiVersion {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }
}

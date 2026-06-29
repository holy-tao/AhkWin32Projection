#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The EMI_VERSION structure describes the version of the Energy Metering Interface (EMI) that is supported by a device.
 * @remarks
 * This structure is returned through a successful completion of an <a href="https://docs.microsoft.com/windows/desktop/api/emi/ni-emi-ioctl_emi_get_version">IOCTL_EMI_GET_VERSION</a> IOCTL request.
 * @see https://learn.microsoft.com/windows/win32/api/emi/ns-emi-emi_version
 * @namespace Windows.Win32.System.Power
 */
export default struct EMI_VERSION {
    #StructPack 2

    /**
     * The version of the Energy Metering Interface (EMI) that is supported by a device. Currently, the only supported version is <b>EMI_VERSION_V1</b> (as defined in emi.h).
     */
    EmiVersion : UInt16

}

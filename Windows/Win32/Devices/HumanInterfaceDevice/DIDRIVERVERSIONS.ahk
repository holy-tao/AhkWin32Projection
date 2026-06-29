#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DIDRIVERVERSIONS structure is used by the DirectInput effect driver to report version information back to DirectInput.
 * @see https://learn.microsoft.com/windows/win32/api/dinputd/ns-dinputd-didriverversions
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 */
export default struct DIDRIVERVERSIONS {
    #StructPack 4

    /**
     * Specifies the size of the structure in bytes. This member must be initialized before the structure is used.
     */
    dwSize : UInt32

    /**
     * Specifies the firmware revision of the device.
     */
    dwFirmwareRevision : UInt32

    /**
     * Specifies the hardware revision of the device.
     */
    dwHardwareRevision : UInt32

    /**
     * Specifies the version number of the force-feedback device driver.
     */
    dwFFDriverVersion : UInt32

}

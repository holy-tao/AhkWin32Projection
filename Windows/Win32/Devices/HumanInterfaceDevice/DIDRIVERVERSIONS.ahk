#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DIDRIVERVERSIONS structure is used by the DirectInput effect driver to report version information back to DirectInput.
 * @see https://learn.microsoft.com/windows/win32/api/dinputd/ns-dinputd-didriverversions
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 * @version v4.0.30319
 */
class DIDRIVERVERSIONS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * Specifies the size of the structure in bytes. This member must be initialized before the structure is used.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies the firmware revision of the device.
     * @type {Integer}
     */
    dwFirmwareRevision {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Specifies the hardware revision of the device.
     * @type {Integer}
     */
    dwHardwareRevision {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Specifies the version number of the force-feedback device driver.
     * @type {Integer}
     */
    dwFFDriverVersion {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}

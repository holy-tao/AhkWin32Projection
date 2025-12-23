#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DIDEVICESTATE structure returns information about the state of a force feedback device.
 * @see https://learn.microsoft.com/windows/win32/api/dinputd/ns-dinputd-didevicestate
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 * @version v4.0.30319
 */
class DIDEVICESTATE extends Win32Struct
{
    static sizeof => 12

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
     * Indicates various aspects of the device state. Can indicate zero, one, or more of the following:
     * @type {Integer}
     */
    dwState {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A value indicating the percentage of device memory in use. A value  of zero indicates that the device memory is completely available. A value of 100 indicates that the device is full.
     * @type {Integer}
     */
    dwLoad {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}

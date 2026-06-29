#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DIDEVICESTATE structure returns information about the state of a force feedback device.
 * @see https://learn.microsoft.com/windows/win32/api/dinputd/ns-dinputd-didevicestate
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 */
export default struct DIDEVICESTATE {
    #StructPack 4

    /**
     * Specifies the size of the structure in bytes. This member must be initialized before the structure is used.
     */
    dwSize : UInt32

    /**
     * Indicates various aspects of the device state. Can indicate zero, one, or more of the following:
     */
    dwState : UInt32

    /**
     * A value indicating the percentage of device memory in use. A value  of zero indicates that the device memory is completely available. A value of 100 indicates that the device is full.
     */
    dwLoad : UInt32

}

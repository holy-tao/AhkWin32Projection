#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class CXL_DEVICE_CAPABILITY_ID extends Win32Enum {

    /**
     * Native name: CxlDeviceCapabilityID_CapabilityArray
     * @type {Integer (Int32)}
     */
    static CapabilityArray => 0

    /**
     * Native name: CxlDeviceCapabilityID_DeviceStatusRegisters
     * @type {Integer (Int32)}
     */
    static DeviceStatusRegisters => 1

    /**
     * Native name: CxlDeviceCapabilityID_PrimaryMailboxRegisters
     * @type {Integer (Int32)}
     */
    static PrimaryMailboxRegisters => 2

    /**
     * Native name: CxlDeviceCapabilityID_SecondaryMailboxRegisters
     * @type {Integer (Int32)}
     */
    static SecondaryMailboxRegisters => 3

    /**
     * Native name: CxlDeviceCapabilityID_MemoryDeviceStatusRegisters
     * @type {Integer (Int32)}
     */
    static MemoryDeviceStatusRegisters => 16384
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class CXL_DEVICE_CAPABILITY_ARRAY_TYPE extends Win32Enum {

    /**
     * Native name: CxlDeviceCapabilityArrayType_InferredFromPciClassCode
     * @type {Integer (Int32)}
     */
    static InferredFromPciClassCode => 0

    /**
     * Native name: CxlDeviceCapabilityArrayType_MemoryDeviceCapabilities
     * @type {Integer (Int32)}
     */
    static MemoryDeviceCapabilities => 1

    /**
     * Native name: CxlDeviceCapabilityArrayType_SwitchMailboxCCICapabilities
     * @type {Integer (Int32)}
     */
    static SwitchMailboxCCICapabilities => 2

    /**
     * Native name: CxlDeviceCapabilityArrayType_Max
     * @type {Integer (Int32)}
     */
    static Max => 3
}

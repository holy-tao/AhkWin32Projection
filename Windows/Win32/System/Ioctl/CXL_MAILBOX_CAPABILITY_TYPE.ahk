#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class CXL_MAILBOX_CAPABILITY_TYPE extends Win32Enum {

    /**
     * Native name: CxlMailboxCapabilityType_InferredFromPciClassCode
     * @type {Integer (Int32)}
     */
    static InferredFromPciClassCode => 0

    /**
     * Native name: CxlMailboxCapabilityType_MemoryDeviceCommands
     * @type {Integer (Int32)}
     */
    static MemoryDeviceCommands => 1

    /**
     * Native name: CxlMailboxCapabilityType_FMApiCommands
     * @type {Integer (Int32)}
     */
    static FMApiCommands => 2

    /**
     * Native name: CxlMailboxCapabilityType_Max
     * @type {Integer (Int32)}
     */
    static Max => 3
}

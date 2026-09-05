#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KS_LogicalMemoryType extends Win32Enum {

    /**
     * Native name: KS_MemoryTypeDontCare
     * @type {Integer (Int32)}
     */
    static DontCare => 0

    /**
     * Native name: KS_MemoryTypeKernelPaged
     * @type {Integer (Int32)}
     */
    static KernelPaged => 1

    /**
     * Native name: KS_MemoryTypeKernelNonPaged
     * @type {Integer (Int32)}
     */
    static KernelNonPaged => 2

    /**
     * Native name: KS_MemoryTypeDeviceHostMapped
     * @type {Integer (Int32)}
     */
    static DeviceHostMapped => 3

    /**
     * Native name: KS_MemoryTypeDeviceSpecific
     * @type {Integer (Int32)}
     */
    static DeviceSpecific => 4

    /**
     * Native name: KS_MemoryTypeUser
     * @type {Integer (Int32)}
     */
    static User => 5

    /**
     * Native name: KS_MemoryTypeAnyHost
     * @type {Integer (Int32)}
     */
    static AnyHost => 6
}

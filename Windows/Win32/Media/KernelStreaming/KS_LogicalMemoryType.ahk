#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KS_LogicalMemoryType extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static KS_MemoryTypeDontCare => 0

    /**
     * @type {Integer (Int32)}
     */
    static KS_MemoryTypeKernelPaged => 1

    /**
     * @type {Integer (Int32)}
     */
    static KS_MemoryTypeKernelNonPaged => 2

    /**
     * @type {Integer (Int32)}
     */
    static KS_MemoryTypeDeviceHostMapped => 3

    /**
     * @type {Integer (Int32)}
     */
    static KS_MemoryTypeDeviceSpecific => 4

    /**
     * @type {Integer (Int32)}
     */
    static KS_MemoryTypeUser => 5

    /**
     * @type {Integer (Int32)}
     */
    static KS_MemoryTypeAnyHost => 6
}

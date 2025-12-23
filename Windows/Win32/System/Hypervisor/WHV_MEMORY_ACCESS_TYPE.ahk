#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Hypervisor
 * @version v4.0.30319
 */
class WHV_MEMORY_ACCESS_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static WHvMemoryAccessRead => 0

    /**
     * @type {Integer (Int32)}
     */
    static WHvMemoryAccessWrite => 1

    /**
     * @type {Integer (Int32)}
     */
    static WHvMemoryAccessExecute => 2
}

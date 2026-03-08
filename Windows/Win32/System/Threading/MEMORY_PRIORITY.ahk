#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Below normal memory priority.
 * @see https://learn.microsoft.com/windows/win32/api/processthreadsapi/ns-processthreadsapi-memory_priority_information
 * @namespace Windows.Win32.System.Threading
 * @version v4.0.30319
 */
class MEMORY_PRIORITY extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static MEMORY_PRIORITY_VERY_LOW => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MEMORY_PRIORITY_LOW => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MEMORY_PRIORITY_MEDIUM => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MEMORY_PRIORITY_BELOW_NORMAL => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MEMORY_PRIORITY_NORMAL => 5
}

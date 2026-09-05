#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Threading
 */
class MEMORY_PRIORITY extends Win32Enum {

    /**
     * Native name: MEMORY_PRIORITY_VERY_LOW
     * @type {Integer (UInt32)}
     */
    static VERY_LOW => 1

    /**
     * Native name: MEMORY_PRIORITY_LOW
     * @type {Integer (UInt32)}
     */
    static LOW => 2

    /**
     * Native name: MEMORY_PRIORITY_MEDIUM
     * @type {Integer (UInt32)}
     */
    static MEDIUM => 3

    /**
     * Native name: MEMORY_PRIORITY_BELOW_NORMAL
     * @type {Integer (UInt32)}
     */
    static BELOW_NORMAL => 4

    /**
     * Native name: MEMORY_PRIORITY_NORMAL
     * @type {Integer (UInt32)}
     */
    static NORMAL => 5
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
class COR_GC_STAT_TYPES extends Win32Enum {

    /**
     * Native name: COR_GC_COUNTS
     * @type {Integer (Int32)}
     */
    static COUNTS => 1

    /**
     * Native name: COR_GC_MEMORYUSAGE
     * @type {Integer (Int32)}
     */
    static MEMORYUSAGE => 2
}

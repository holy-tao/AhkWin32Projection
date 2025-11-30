#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class COR_GC_THREAD_STATS_TYPES extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static COR_GC_THREAD_HAS_PROMOTED_BYTES => 1
}

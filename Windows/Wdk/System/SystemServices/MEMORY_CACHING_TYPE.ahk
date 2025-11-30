#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class MEMORY_CACHING_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MmNonCached => 0

    /**
     * @type {Integer (Int32)}
     */
    static MmCached => 1

    /**
     * @type {Integer (Int32)}
     */
    static MmWriteCombined => 2

    /**
     * @type {Integer (Int32)}
     */
    static MmHardwareCoherentCached => 3

    /**
     * @type {Integer (Int32)}
     */
    static MmNonCachedUnordered => 4

    /**
     * @type {Integer (Int32)}
     */
    static MmUSWCCached => 5

    /**
     * @type {Integer (Int32)}
     */
    static MmMaximumCacheType => 6

    /**
     * @type {Integer (Int32)}
     */
    static MmNotMapped => -1
}

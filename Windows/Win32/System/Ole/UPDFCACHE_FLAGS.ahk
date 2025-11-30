#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class UPDFCACHE_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static UPDFCACHE_ALL => 2147483647

    /**
     * @type {Integer (UInt32)}
     */
    static UPDFCACHE_ALLBUTNODATACACHE => 2147483646

    /**
     * @type {Integer (UInt32)}
     */
    static UPDFCACHE_NORMALCACHE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static UPDFCACHE_IFBLANK => 16

    /**
     * @type {Integer (UInt32)}
     */
    static UPDFCACHE_ONLYIFBLANK => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static UPDFCACHE_NODATACACHE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static UPDFCACHE_ONSAVECACHE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static UPDFCACHE_ONSTOPCACHE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static UPDFCACHE_IFBLANKORONSAVECACHE => 18
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ole
 */
class UPDFCACHE_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: UPDFCACHE_ALL
     * @type {Integer (UInt32)}
     */
    static ALL => 2147483647

    /**
     * Native name: UPDFCACHE_ALLBUTNODATACACHE
     * @type {Integer (UInt32)}
     */
    static ALLBUTNODATACACHE => 2147483646

    /**
     * Native name: UPDFCACHE_NORMALCACHE
     * @type {Integer (UInt32)}
     */
    static NORMALCACHE => 8

    /**
     * Native name: UPDFCACHE_IFBLANK
     * @type {Integer (UInt32)}
     */
    static IFBLANK => 16

    /**
     * Native name: UPDFCACHE_ONLYIFBLANK
     * @type {Integer (UInt32)}
     */
    static ONLYIFBLANK => 2147483648

    /**
     * Native name: UPDFCACHE_NODATACACHE
     * @type {Integer (UInt32)}
     */
    static NODATACACHE => 1

    /**
     * Native name: UPDFCACHE_ONSAVECACHE
     * @type {Integer (UInt32)}
     */
    static ONSAVECACHE => 2

    /**
     * Native name: UPDFCACHE_ONSTOPCACHE
     * @type {Integer (UInt32)}
     */
    static ONSTOPCACHE => 4

    /**
     * Native name: UPDFCACHE_IFBLANKORONSAVECACHE
     * @type {Integer (UInt32)}
     */
    static IFBLANKORONSAVECACHE => 18
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class GLOBAL_FILTER extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static GF_FRAGMENTS => 2

    /**
     * @type {Integer (Int32)}
     */
    static GF_STRONGHOST => 8

    /**
     * @type {Integer (Int32)}
     */
    static GF_FRAGCACHE => 9
}

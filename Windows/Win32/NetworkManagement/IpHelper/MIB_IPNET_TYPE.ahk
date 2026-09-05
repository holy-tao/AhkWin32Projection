#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
class MIB_IPNET_TYPE extends Win32Enum {

    /**
     * Native name: MIB_IPNET_TYPE_OTHER
     * @type {Integer (Int32)}
     */
    static OTHER => 1

    /**
     * Native name: MIB_IPNET_TYPE_INVALID
     * @type {Integer (Int32)}
     */
    static INVALID => 2

    /**
     * Native name: MIB_IPNET_TYPE_DYNAMIC
     * @type {Integer (Int32)}
     */
    static DYNAMIC => 3

    /**
     * Native name: MIB_IPNET_TYPE_STATIC
     * @type {Integer (Int32)}
     */
    static STATIC => 4
}

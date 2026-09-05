#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
class MIB_IPFORWARD_TYPE extends Win32Enum {

    /**
     * Native name: MIB_IPROUTE_TYPE_OTHER
     * @type {Integer (Int32)}
     */
    static IPROUTE_TYPE_OTHER => 1

    /**
     * Native name: MIB_IPROUTE_TYPE_INVALID
     * @type {Integer (Int32)}
     */
    static IPROUTE_TYPE_INVALID => 2

    /**
     * Native name: MIB_IPROUTE_TYPE_DIRECT
     * @type {Integer (Int32)}
     */
    static IPROUTE_TYPE_DIRECT => 3

    /**
     * Native name: MIB_IPROUTE_TYPE_INDIRECT
     * @type {Integer (Int32)}
     */
    static IPROUTE_TYPE_INDIRECT => 4
}

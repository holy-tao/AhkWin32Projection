#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class MIB_IPFORWARD_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MIB_IPROUTE_TYPE_OTHER => 1

    /**
     * @type {Integer (Int32)}
     */
    static MIB_IPROUTE_TYPE_INVALID => 2

    /**
     * @type {Integer (Int32)}
     */
    static MIB_IPROUTE_TYPE_DIRECT => 3

    /**
     * @type {Integer (Int32)}
     */
    static MIB_IPROUTE_TYPE_INDIRECT => 4
}

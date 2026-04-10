#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
class IF_ACCESS_TYPE extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static IF_ACCESS_LOOPBACK => 1

    /**
     * @type {Integer (Int32)}
     */
    static IF_ACCESS_BROADCAST => 2

    /**
     * @type {Integer (Int32)}
     */
    static IF_ACCESS_POINT_TO_POINT => 3

    /**
     * @type {Integer (Int32)}
     */
    static IF_ACCESS_POINTTOPOINT => 3

    /**
     * @type {Integer (Int32)}
     */
    static IF_ACCESS_POINT_TO_MULTI_POINT => 4

    /**
     * @type {Integer (Int32)}
     */
    static IF_ACCESS_POINTTOMULTIPOINT => 4
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
class IF_ACCESS_TYPE extends Win32Enum {

    /**
     * Native name: IF_ACCESS_LOOPBACK
     * @type {Integer (Int32)}
     */
    static LOOPBACK => 1

    /**
     * Native name: IF_ACCESS_BROADCAST
     * @type {Integer (Int32)}
     */
    static BROADCAST => 2

    /**
     * Native name: IF_ACCESS_POINT_TO_POINT
     * @type {Integer (Int32)}
     */
    static POINT_TO_POINT => 3

    /**
     * Native name: IF_ACCESS_POINTTOPOINT
     * @type {Integer (Int32)}
     */
    static POINTTOPOINT => 3

    /**
     * Native name: IF_ACCESS_POINT_TO_MULTI_POINT
     * @type {Integer (Int32)}
     */
    static POINT_TO_MULTI_POINT => 4

    /**
     * Native name: IF_ACCESS_POINTTOMULTIPOINT
     * @type {Integer (Int32)}
     */
    static POINTTOMULTIPOINT => 4
}

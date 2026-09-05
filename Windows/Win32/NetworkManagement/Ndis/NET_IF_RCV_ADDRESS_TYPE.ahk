#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
class NET_IF_RCV_ADDRESS_TYPE extends Win32Enum {

    /**
     * Native name: NET_IF_RCV_ADDRESS_TYPE_OTHER
     * @type {Integer (Int32)}
     */
    static OTHER => 1

    /**
     * Native name: NET_IF_RCV_ADDRESS_TYPE_VOLATILE
     * @type {Integer (Int32)}
     */
    static VOLATILE => 2

    /**
     * Native name: NET_IF_RCV_ADDRESS_TYPE_NON_VOLATILE
     * @type {Integer (Int32)}
     */
    static NON_VOLATILE => 3
}

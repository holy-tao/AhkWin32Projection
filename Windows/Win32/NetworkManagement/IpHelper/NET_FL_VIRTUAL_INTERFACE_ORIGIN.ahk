#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
class NET_FL_VIRTUAL_INTERFACE_ORIGIN extends Win32Enum {

    /**
     * Native name: NetFlVirtualInterfaceOriginOid
     * @type {Integer (Int32)}
     */
    static Oid => 0

    /**
     * Native name: NetFlVirtualInterfaceOriginApi
     * @type {Integer (Int32)}
     */
    static Api => 1

    /**
     * Native name: NetFlVirtualInterfaceOriginDefault
     * @type {Integer (Int32)}
     */
    static Default => 2
}

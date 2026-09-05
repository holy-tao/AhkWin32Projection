#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
class NET_FL_ISOLATION_MODE extends Win32Enum {

    /**
     * Native name: NetFlIsolationModeNone
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Native name: NetFlIsolationModeVlan
     * @type {Integer (Int32)}
     */
    static Vlan => 1

    /**
     * Native name: NetFlIsolationModeVsid
     * @type {Integer (Int32)}
     */
    static Vsid => 2
}

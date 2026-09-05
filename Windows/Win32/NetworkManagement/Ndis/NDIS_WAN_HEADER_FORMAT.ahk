#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
class NDIS_WAN_HEADER_FORMAT extends Win32Enum {

    /**
     * Native name: NdisWanHeaderNative
     * @type {Integer (Int32)}
     */
    static Native => 0

    /**
     * Native name: NdisWanHeaderEthernet
     * @type {Integer (Int32)}
     */
    static Ethernet => 1
}

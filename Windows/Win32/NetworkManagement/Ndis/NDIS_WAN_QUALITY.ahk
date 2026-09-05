#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
class NDIS_WAN_QUALITY extends Win32Enum {

    /**
     * Native name: NdisWanRaw
     * @type {Integer (Int32)}
     */
    static Raw => 0

    /**
     * Native name: NdisWanErrorControl
     * @type {Integer (Int32)}
     */
    static ErrorControl => 1

    /**
     * Native name: NdisWanReliable
     * @type {Integer (Int32)}
     */
    static Reliable => 2
}

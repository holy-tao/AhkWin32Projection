#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class NDIS_WAN_QUALITY extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NdisWanRaw => 0

    /**
     * @type {Integer (Int32)}
     */
    static NdisWanErrorControl => 1

    /**
     * @type {Integer (Int32)}
     */
    static NdisWanReliable => 2
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
class NDIS_CLASS_ID extends Win32Enum {

    /**
     * Native name: NdisClass802_3Priority
     * @type {Integer (Int32)}
     */
    static Class802_3Priority => 0

    /**
     * Native name: NdisClassWirelessWanMbxMailbox
     * @type {Integer (Int32)}
     */
    static WirelessWanMbxMailbox => 1

    /**
     * Native name: NdisClassIrdaPacketInfo
     * @type {Integer (Int32)}
     */
    static IrdaPacketInfo => 2

    /**
     * Native name: NdisClassAtmAALInfo
     * @type {Integer (Int32)}
     */
    static AtmAALInfo => 3
}

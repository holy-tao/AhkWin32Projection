#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class NDIS_CLASS_ID extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NdisClass802_3Priority => 0

    /**
     * @type {Integer (Int32)}
     */
    static NdisClassWirelessWanMbxMailbox => 1

    /**
     * @type {Integer (Int32)}
     */
    static NdisClassIrdaPacketInfo => 2

    /**
     * @type {Integer (Int32)}
     */
    static NdisClassAtmAALInfo => 3
}

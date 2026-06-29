#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct NDIS_802_11_NON_BCAST_SSID_LIST {
    #StructPack 8

    NumberOfItems : UInt32

    Non_Bcast_Ssid : IntPtr[1]

}

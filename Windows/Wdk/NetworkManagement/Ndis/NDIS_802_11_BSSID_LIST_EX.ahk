#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct NDIS_802_11_BSSID_LIST_EX {
    #StructPack 8

    NumberOfItems : UInt32

    Bssid : IntPtr[1]

}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct NDIS_802_11_REMOVE_KEY {
    #StructPack 4

    Length : UInt32

    KeyIndex : UInt32

    BSSID : Int8[6]

}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct NDIS_802_11_AUTHENTICATION_REQUEST {
    #StructPack 4

    Length : UInt32

    Bssid : Int8[6]

    Flags : UInt32

}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct NDIS_802_11_KEY {
    #StructPack 8

    Length : UInt32

    KeyIndex : UInt32

    KeyLength : UInt32

    BSSID : Int8[6]

    KeyRSC : Int64

    KeyMaterial : Int8[1]

}

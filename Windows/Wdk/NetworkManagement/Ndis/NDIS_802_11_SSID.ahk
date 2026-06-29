#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct NDIS_802_11_SSID {
    #StructPack 4

    SsidLength : UInt32

    Ssid : Int8[32]

}

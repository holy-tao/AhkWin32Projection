#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct NDIS_802_11_CONFIGURATION {
    #StructPack 8

    Length : UInt32

    BeaconPeriod : UInt32

    ATIMWindow : UInt32

    DSConfig : UInt32

    FHConfig : IntPtr

}

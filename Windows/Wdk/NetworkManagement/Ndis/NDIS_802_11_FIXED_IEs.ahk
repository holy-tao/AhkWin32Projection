#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct NDIS_802_11_FIXED_IEs {
    #StructPack 2

    Timestamp : Int8[8]

    BeaconInterval : UInt16

    Capabilities : UInt16

}

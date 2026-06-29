#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct NDIS_802_11_CONFIGURATION_FH {
    #StructPack 4

    Length : UInt32

    HopPattern : UInt32

    HopSet : UInt32

    DwellTime : UInt32

}

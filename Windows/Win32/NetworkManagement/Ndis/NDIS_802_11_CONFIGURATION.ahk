#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NDIS_802_11_CONFIGURATION_FH.ahk" { NDIS_802_11_CONFIGURATION_FH }

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
export default struct NDIS_802_11_CONFIGURATION {
    #StructPack 4

    Length : UInt32

    BeaconPeriod : UInt32

    ATIMWindow : UInt32

    DSConfig : UInt32

    FHConfig : NDIS_802_11_CONFIGURATION_FH

}

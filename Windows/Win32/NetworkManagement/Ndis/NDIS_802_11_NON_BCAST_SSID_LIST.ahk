#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NDIS_802_11_SSID.ahk" { NDIS_802_11_SSID }

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
export default struct NDIS_802_11_NON_BCAST_SSID_LIST {
    #StructPack 4

    NumberOfItems : UInt32

    Non_Bcast_Ssid : NDIS_802_11_SSID[1]

}

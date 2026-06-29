#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NDIS_802_11_CONFIGURATION_FH.ahk" { NDIS_802_11_CONFIGURATION_FH }
#Import ".\NDIS_802_11_CONFIGURATION.ahk" { NDIS_802_11_CONFIGURATION }
#Import ".\NDIS_802_11_SSID.ahk" { NDIS_802_11_SSID }
#Import ".\NDIS_WLAN_BSSID.ahk" { NDIS_WLAN_BSSID }
#Import ".\NDIS_802_11_NETWORK_INFRASTRUCTURE.ahk" { NDIS_802_11_NETWORK_INFRASTRUCTURE }
#Import ".\NDIS_802_11_NETWORK_TYPE.ahk" { NDIS_802_11_NETWORK_TYPE }

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
export default struct NDIS_802_11_BSSID_LIST {
    #StructPack 4

    NumberOfItems : UInt32

    Bssid : NDIS_WLAN_BSSID[1]

}

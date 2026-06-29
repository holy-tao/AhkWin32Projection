#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NDIS_802_11_CONFIGURATION_FH.ahk" { NDIS_802_11_CONFIGURATION_FH }
#Import ".\NDIS_802_11_CONFIGURATION.ahk" { NDIS_802_11_CONFIGURATION }
#Import ".\NDIS_802_11_SSID.ahk" { NDIS_802_11_SSID }
#Import ".\NDIS_802_11_NETWORK_INFRASTRUCTURE.ahk" { NDIS_802_11_NETWORK_INFRASTRUCTURE }
#Import ".\NDIS_802_11_NETWORK_TYPE.ahk" { NDIS_802_11_NETWORK_TYPE }

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
export default struct NDIS_WLAN_BSSID {
    #StructPack 4

    Length : UInt32

    MacAddress : Int8[6]

    Reserved : Int8[2]

    Ssid : NDIS_802_11_SSID

    Privacy : UInt32

    Rssi : Int32

    NetworkTypeInUse : NDIS_802_11_NETWORK_TYPE

    Configuration : NDIS_802_11_CONFIGURATION

    InfrastructureMode : NDIS_802_11_NETWORK_INFRASTRUCTURE

    SupportedRates : Int8[8]

}

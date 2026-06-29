#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NDIS_802_11_NETWORK_INFRASTRUCTURE.ahk" { NDIS_802_11_NETWORK_INFRASTRUCTURE }
#Import ".\NDIS_802_11_NETWORK_TYPE.ahk" { NDIS_802_11_NETWORK_TYPE }

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct NDIS_WLAN_BSSID {
    #StructPack 8

    Length : UInt32

    MacAddress : Int8[6]

    Reserved : Int8[2]

    Ssid : IntPtr

    Privacy : UInt32

    Rssi : Int32

    NetworkTypeInUse : NDIS_802_11_NETWORK_TYPE

    Configuration : IntPtr

    InfrastructureMode : NDIS_802_11_NETWORK_INFRASTRUCTURE

    SupportedRates : Int8[8]

}

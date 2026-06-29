#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Ndis\NDIS_OBJECT_HEADER.ahk" { NDIS_OBJECT_HEADER }
#Import ".\DOT11_CHANNEL_HINT.ahk" { DOT11_CHANNEL_HINT }
#Import ".\DOT11_CIPHER_ALGORITHM.ahk" { DOT11_CIPHER_ALGORITHM }
#Import ".\DOT11_PHY_TYPE.ahk" { DOT11_PHY_TYPE }
#Import ".\DOT11_AUTH_ALGORITHM.ahk" { DOT11_AUTH_ALGORITHM }
#Import ".\DOT11_SSID.ahk" { DOT11_SSID }
#Import ".\DOT11_OFFLOAD_NETWORK.ahk" { DOT11_OFFLOAD_NETWORK }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_OFFLOAD_NETWORK_LIST_INFO {
    #StructPack 4

    Header : NDIS_OBJECT_HEADER

    ulFlags : UInt32

    FastScanPeriod : UInt32

    FastScanIterations : UInt32

    SlowScanPeriod : UInt32

    uNumOfEntries : UInt32

    offloadNetworkList : DOT11_OFFLOAD_NETWORK[1]

}

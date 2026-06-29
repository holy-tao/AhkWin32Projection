#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DOT11_CIPHER_ALGORITHM.ahk" { DOT11_CIPHER_ALGORITHM }
#Import ".\DOT11_PHY_TYPE.ahk" { DOT11_PHY_TYPE }
#Import ".\DOT11_ACCESSNETWORKOPTIONS.ahk" { DOT11_ACCESSNETWORKOPTIONS }
#Import ".\DOT11_BSS_TYPE.ahk" { DOT11_BSS_TYPE }
#Import ".\DOT11_AUTH_ALGORITHM.ahk" { DOT11_AUTH_ALGORITHM }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\DOT11_SSID.ahk" { DOT11_SSID }
#Import ".\DOT11_VENUEINFO.ahk" { DOT11_VENUEINFO }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct WLAN_AVAILABLE_NETWORK_V2 {
    #StructPack 4

    strProfileName : WCHAR[256]

    dot11Ssid : DOT11_SSID

    dot11BssType : DOT11_BSS_TYPE

    uNumberOfBssids : UInt32

    bNetworkConnectable : BOOL

    wlanNotConnectableReason : UInt32

    uNumberOfPhyTypes : UInt32

    dot11PhyTypes : DOT11_PHY_TYPE[8]

    bMorePhyTypes : BOOL

    wlanSignalQuality : UInt32

    bSecurityEnabled : BOOL

    dot11DefaultAuthAlgorithm : DOT11_AUTH_ALGORITHM

    dot11DefaultCipherAlgorithm : DOT11_CIPHER_ALGORITHM

    dwFlags : UInt32

    AccessNetworkOptions : DOT11_ACCESSNETWORKOPTIONS

    dot11HESSID : Int8[6]

    VenueInfo : DOT11_VENUEINFO

    dwReserved : UInt32

}

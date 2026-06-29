#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DOT11_CIPHER_ALGORITHM.ahk" { DOT11_CIPHER_ALGORITHM }
#Import ".\DOT11_PHY_TYPE.ahk" { DOT11_PHY_TYPE }
#Import ".\DOT11_ACCESSNETWORKOPTIONS.ahk" { DOT11_ACCESSNETWORKOPTIONS }
#Import ".\DOT11_BSS_TYPE.ahk" { DOT11_BSS_TYPE }
#Import ".\DOT11_AUTH_ALGORITHM.ahk" { DOT11_AUTH_ALGORITHM }
#Import ".\WLAN_AVAILABLE_NETWORK_V2.ahk" { WLAN_AVAILABLE_NETWORK_V2 }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\DOT11_SSID.ahk" { DOT11_SSID }
#Import ".\DOT11_VENUEINFO.ahk" { DOT11_VENUEINFO }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct WLAN_AVAILABLE_NETWORK_LIST_V2 {
    #StructPack 4

    dwNumberOfItems : UInt32

    dwIndex : UInt32

    Network : WLAN_AVAILABLE_NETWORK_V2[1]

}

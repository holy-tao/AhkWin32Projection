#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WLAN_CONNECTION_MODE.ahk" { WLAN_CONNECTION_MODE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\DOT11_ACCESSNETWORKOPTIONS.ahk" { DOT11_ACCESSNETWORKOPTIONS }
#Import ".\DOT11_BSS_TYPE.ahk" { DOT11_BSS_TYPE }
#Import ".\DOT11_BSSID_LIST.ahk" { DOT11_BSSID_LIST }
#Import ".\DOT11_SSID.ahk" { DOT11_SSID }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct WLAN_CONNECTION_PARAMETERS_V2 {
    #StructPack 8

    wlanConnectionMode : WLAN_CONNECTION_MODE

    strProfile : PWSTR

    pDot11Ssid : DOT11_SSID.Ptr

    pDot11Hessid : IntPtr

    pDesiredBssidList : DOT11_BSSID_LIST.Ptr

    dot11BssType : DOT11_BSS_TYPE

    dwFlags : UInt32

    pDot11AccessNetworkOptions : DOT11_ACCESSNETWORKOPTIONS.Ptr

}

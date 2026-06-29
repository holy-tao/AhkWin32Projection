#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DOT11_BSS_TYPE.ahk" { DOT11_BSS_TYPE }
#Import ".\DOT11_SSID.ahk" { DOT11_SSID }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct WDIAG_IHV_WLAN_ID {
    #StructPack 4

    strProfileName : WCHAR[256]

    Ssid : DOT11_SSID

    BssType : DOT11_BSS_TYPE

    dwFlags : UInt32

    dwReasonCode : UInt32

}

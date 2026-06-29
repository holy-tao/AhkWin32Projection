#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DOT11_SCAN_TYPE.ahk" { DOT11_SCAN_TYPE }
#Import ".\DOT11_BSS_TYPE.ahk" { DOT11_BSS_TYPE }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\DOT11_SSID.ahk" { DOT11_SSID }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_SCAN_REQUEST {
    #StructPack 4

    dot11BSSType : DOT11_BSS_TYPE

    dot11BSSID : Int8[6]

    dot11SSID : DOT11_SSID

    dot11ScanType : DOT11_SCAN_TYPE

    bRestrictedScan : BOOLEAN

    bUseRequestIE : BOOLEAN

    uRequestIDsOffset : UInt32

    uNumOfRequestIDs : UInt32

    uPhyTypesOffset : UInt32

    uNumOfPhyTypes : UInt32

    uIEsOffset : UInt32

    uIEsLength : UInt32

    ucBuffer : Int8[1]

}

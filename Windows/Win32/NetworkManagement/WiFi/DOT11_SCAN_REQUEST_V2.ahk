#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DOT11_SCAN_TYPE.ahk" { DOT11_SCAN_TYPE }
#Import ".\DOT11_BSS_TYPE.ahk" { DOT11_BSS_TYPE }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_SCAN_REQUEST_V2 {
    #StructPack 4

    dot11BSSType : DOT11_BSS_TYPE

    dot11BSSID : Int8[6]

    dot11ScanType : DOT11_SCAN_TYPE

    bRestrictedScan : BOOLEAN

    udot11SSIDsOffset : UInt32

    uNumOfdot11SSIDs : UInt32

    bUseRequestIE : BOOLEAN

    uRequestIDsOffset : UInt32

    uNumOfRequestIDs : UInt32

    uPhyTypeInfosOffset : UInt32

    uNumOfPhyTypeInfos : UInt32

    uIEsOffset : UInt32

    uIEsLength : UInt32

    ucBuffer : Int8[1]

}

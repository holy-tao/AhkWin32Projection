#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\DOT11_SUPPORTED_ANTENNA.ahk" { DOT11_SUPPORTED_ANTENNA }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_SUPPORTED_ANTENNA_LIST {
    #StructPack 4

    uNumOfEntries : UInt32

    uTotalNumOfEntries : UInt32

    dot11SupportedAntenna : DOT11_SUPPORTED_ANTENNA[1]

}

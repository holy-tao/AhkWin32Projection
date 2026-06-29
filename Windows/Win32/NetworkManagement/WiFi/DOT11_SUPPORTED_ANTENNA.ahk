#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_SUPPORTED_ANTENNA {
    #StructPack 4

    uAntennaListIndex : UInt32

    bSupportedAntenna : BOOLEAN

}

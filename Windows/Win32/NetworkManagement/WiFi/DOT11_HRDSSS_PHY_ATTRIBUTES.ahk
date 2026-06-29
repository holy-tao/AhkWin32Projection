#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_HRDSSS_PHY_ATTRIBUTES {
    #StructPack 4

    bShortPreambleOptionImplemented : BOOLEAN

    bPBCCOptionImplemented : BOOLEAN

    bChannelAgilityPresent : BOOLEAN

    uHRCCAModeSupported : UInt32

}

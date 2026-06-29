#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DOT11_SSID.ahk" { DOT11_SSID }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11EXT_IHV_SSID_LIST {
    #StructPack 4

    ulCount : UInt32

    SSIDs : DOT11_SSID[1]

}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DOT11_SSID.ahk" { DOT11_SSID }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct WFD_GROUP_ID {
    #StructPack 4

    DeviceAddress : Int8[6]

    GroupSSID : DOT11_SSID

}

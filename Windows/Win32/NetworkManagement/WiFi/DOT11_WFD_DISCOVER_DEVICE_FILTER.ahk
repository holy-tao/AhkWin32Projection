#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DOT11_SSID.ahk" { DOT11_SSID }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_WFD_DISCOVER_DEVICE_FILTER {
    #StructPack 4

    DeviceID : Int8[6]

    ucBitmask : Int8

    GroupSSID : DOT11_SSID

}

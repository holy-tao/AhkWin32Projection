#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_WFD_CONFIGURATION_TIMEOUT {
    #StructPack 1

    GOTimeout : Int8

    ClientTimeout : Int8

}

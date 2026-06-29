#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_WFD_CHANNEL {
    #StructPack 1

    CountryRegionString : Int8[3]

    OperatingClass : Int8

    ChannelNumber : Int8

}

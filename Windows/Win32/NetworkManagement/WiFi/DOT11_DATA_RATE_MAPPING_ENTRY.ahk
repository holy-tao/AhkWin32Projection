#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_DATA_RATE_MAPPING_ENTRY {
    #StructPack 2

    ucDataRateIndex : Int8

    ucDataRateFlag : Int8

    usDataRateValue : UInt16

}

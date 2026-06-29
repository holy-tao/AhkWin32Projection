#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_SUPPORTED_DATA_RATES_VALUE_V2 {
    #StructPack 1

    ucSupportedTxDataRatesValue : Int8[255]

    ucSupportedRxDataRatesValue : Int8[255]

}

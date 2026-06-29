#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_SUPPORTED_DATA_RATES_VALUE {
    #StructPack 1

    ucSupportedTxDataRatesValue : Int8[8]

    ucSupportedRxDataRatesValue : Int8[8]

}

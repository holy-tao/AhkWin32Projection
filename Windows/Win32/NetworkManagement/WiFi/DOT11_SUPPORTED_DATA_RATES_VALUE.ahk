#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
class DOT11_SUPPORTED_DATA_RATES_VALUE extends Win32Struct {
    static sizeof => 16

    static packingSize => 1

    /**
     * @type {Array<Integer>}
     */
    ucSupportedTxDataRatesValue {
        get {
            if(!this.HasProp("__ucSupportedTxDataRatesValueProxyArray"))
                this.__ucSupportedTxDataRatesValueProxyArray := Win32FixedArray(this.ptr + 0, 8, Primitive, "char")
            return this.__ucSupportedTxDataRatesValueProxyArray
        }
    }

    /**
     * @type {Array<Integer>}
     */
    ucSupportedRxDataRatesValue {
        get {
            if(!this.HasProp("__ucSupportedRxDataRatesValueProxyArray"))
                this.__ucSupportedRxDataRatesValueProxyArray := Win32FixedArray(this.ptr + 8, 8, Primitive, "char")
            return this.__ucSupportedRxDataRatesValueProxyArray
        }
    }
}

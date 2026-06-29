#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * WCN_VALUE_TYPE_RF_BANDS enumeration defines the possible radio frequency bands on which an enrollee can send Discovery requests.
 * @see https://learn.microsoft.com/windows/win32/api/wcntypes/ne-wcntypes-wcn_value_type_rf_bands
 * @namespace Windows.Win32.NetworkManagement.WindowsConnectNow
 */
export default struct WCN_VALUE_TYPE_RF_BANDS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The request is being sent on the 2.4 GHz frequency band.
     * @type {Integer (Int32)}
     */
    static WCN_VALUE_RB_24GHZ => 1

    /**
     * The request is being sent on the 5.0 Ghz frequency band.
     * @type {Integer (Int32)}
     */
    static WCN_VALUE_RB_50GHZ => 2
}

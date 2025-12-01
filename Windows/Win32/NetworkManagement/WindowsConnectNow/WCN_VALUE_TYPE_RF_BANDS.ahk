#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * WCN_VALUE_TYPE_RF_BANDS enumeration defines the possible radio frequency bands on which an enrollee can send Discovery requests.
 * @see https://learn.microsoft.com/windows/win32/api/wcntypes/ne-wcntypes-wcn_value_type_rf_bands
 * @namespace Windows.Win32.NetworkManagement.WindowsConnectNow
 * @version v4.0.30319
 */
class WCN_VALUE_TYPE_RF_BANDS extends Win32Enum{

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

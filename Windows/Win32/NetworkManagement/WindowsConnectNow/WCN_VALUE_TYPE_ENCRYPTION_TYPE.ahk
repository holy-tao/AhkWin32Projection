#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * WCN_VALUE_TYPE_ENCRYPTION_TYPE enumeration defines the supported WLAN encryption types.
 * @see https://docs.microsoft.com/windows/win32/api//wcntypes/ne-wcntypes-wcn_value_type_encryption_type
 * @namespace Windows.Win32.NetworkManagement.WindowsConnectNow
 * @version v4.0.30319
 */
class WCN_VALUE_TYPE_ENCRYPTION_TYPE extends Win32Enum{

    /**
     * Specifies support for unsecured wireless activity.
     * @type {Integer (Int32)}
     */
    static WCN_VALUE_ET_NONE => 1

    /**
     * Specifies support for the Wired Equivalent Privacy (WEP) encryption method.
     * 
     * <div class="alert"><b>Note</b>  Not available for WPS 2.0.</div>
     * <div> </div>
     * @type {Integer (Int32)}
     */
    static WCN_VALUE_ET_WEP => 2

    /**
     * Specifies support for the Temporal Key Integrity Protocol (TKIP) encryption method.
     * 
     * <div class="alert"><b>Note</b>  Not available for WPS 2.0.</div>
     * <div> </div>
     * @type {Integer (Int32)}
     */
    static WCN_VALUE_ET_TKIP => 4

    /**
     * Specifies support for the Advanced Encryption Standard (AES) encryption method.
     * @type {Integer (Int32)}
     */
    static WCN_VALUE_ET_AES => 8

    /**
     * Specifies support for WPAPSK/WPA2PSK mixed-mode encryption.
     * 
     * <div class="alert"><b>Note</b>  Not supported in WPS 1.0. Only available  in Windows 8.</div>
     * <div> </div>
     * @type {Integer (Int32)}
     */
    static WCN_VALUE_ET_TKIP_AES_MIXED => 12
}

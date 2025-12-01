#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the supported version of Wi-Fi Protected Setup (WPS).
 * @see https://learn.microsoft.com/windows/win32/api/wcntypes/ne-wcntypes-wcn_value_type_version
 * @namespace Windows.Win32.NetworkManagement.WindowsConnectNow
 * @version v4.0.30319
 */
class WCN_VALUE_TYPE_VERSION extends Win32Enum{

    /**
     * Specifies WPS 1.0. Indicates compliance with Wi-Fi Alliance protocol specification for Wi-Fi Protected Setup (WPS) 1.0h.
     * @type {Integer (Int32)}
     */
    static WCN_VALUE_VERSION_1_0 => 16

    /**
     * Specifies WPS 2.0.  Indicates compliance with Wi-Fi Alliance protocol specification for Wi-Fi Simple Configuration (WSC) 2.0.
     * @type {Integer (Int32)}
     */
    static WCN_VALUE_VERSION_2_0 => 32
}

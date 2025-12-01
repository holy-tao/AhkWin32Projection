#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The WLAN_IHV_CONTROL_TYPE enumeration specifies the type of software bypassed by a vendor-specific method.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/wlanapi/ne-wlanapi-wlan_ihv_control_type~r1
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class WLAN_IHV_CONTROL_TYPE extends Win32Enum{

    /**
     * Bypasses a WLAN service.
     * @type {Integer (Int32)}
     */
    static wlan_ihv_control_type_service => 0

    /**
     * Bypasses a WLAN driver.
     * @type {Integer (Int32)}
     */
    static wlan_ihv_control_type_driver => 1
}

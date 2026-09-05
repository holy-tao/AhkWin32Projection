#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The WLAN_IHV_CONTROL_TYPE enumeration specifies the type of software bypassed by a vendor-specific method.
 * @see https://learn.microsoft.com/windows/win32/api/wlanapi/ne-wlanapi-wlan_ihv_control_type~r1
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
class WLAN_IHV_CONTROL_TYPE extends Win32Enum {

    /**
     * Bypasses a WLAN service.
     * Native name: wlan_ihv_control_type_service
     * @type {Integer (Int32)}
     */
    static service => 0

    /**
     * Bypasses a WLAN driver.
     * Native name: wlan_ihv_control_type_driver
     * @type {Integer (Int32)}
     */
    static driver => 1
}

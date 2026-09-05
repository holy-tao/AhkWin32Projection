#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the wireless interface type.
 * @see https://learn.microsoft.com/windows/win32/api/wlanapi/ne-wlanapi-wlan_interface_type
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
class WLAN_INTERFACE_TYPE extends Win32Enum {

    /**
     * Specifies an emulated 802.11 interface.
     * Native name: wlan_interface_type_emulated_802_11
     * @type {Integer (Int32)}
     */
    static emulated_802_11 => 0

    /**
     * Specifies a native 802.11 interface.
     * Native name: wlan_interface_type_native_802_11
     * @type {Integer (Int32)}
     */
    static native_802_11 => 1

    /**
     * The interface specified is invalid.
     * Native name: wlan_interface_type_invalid
     * @type {Integer (Int32)}
     */
    static invalid => 2
}

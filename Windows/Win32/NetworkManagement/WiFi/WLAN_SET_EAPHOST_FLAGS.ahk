#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
class WLAN_SET_EAPHOST_FLAGS extends Win32Enum {

    /**
     * Native name: WLAN_SET_EAPHOST_DATA_ALL_USERS
     * @type {Integer (UInt32)}
     */
    static DATA_ALL_USERS => 1
}

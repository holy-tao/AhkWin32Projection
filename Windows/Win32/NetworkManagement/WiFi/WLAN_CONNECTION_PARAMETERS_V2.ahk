#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WLAN_CONNECTION_MODE.ahk
#Include .\DOT11_SSID.ahk
#Include .\DOT11_BSSID_LIST.ahk
#Include .\DOT11_BSS_TYPE.ahk
#Include .\DOT11_ACCESSNETWORKOPTIONS.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
class WLAN_CONNECTION_PARAMETERS_V2 extends Win32Struct {
    static sizeof => 56

    static packingSize => 8

    /**
     * @type {WLAN_CONNECTION_MODE}
     */
    wlanConnectionMode {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {PWSTR}
     */
    strProfile {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<DOT11_SSID>}
     */
    pDot11Ssid {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<Integer>}
     */
    pDot11Hessid {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<DOT11_BSSID_LIST>}
     */
    pDesiredBssidList {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {DOT11_BSS_TYPE}
     */
    dot11BssType {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * @type {Pointer<DOT11_ACCESSNETWORKOPTIONS>}
     */
    pDot11AccessNetworkOptions {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }
}

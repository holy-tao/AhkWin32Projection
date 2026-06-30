#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DOT11_CIPHER_ALGORITHM.ahk
#Include .\DOT11_AUTH_ALGORITHM.ahk

/**
 * Contains information about the security settings on the wireless Hosted Network.
 * @remarks
 * The <b>WLAN_HOSTED_NETWORK_SECURITY_SETTINGS</b>  structure is an extension to native wireless APIs added to support the wireless Hosted Network on Windows 7 and  later.
 * @see https://learn.microsoft.com/windows/win32/api/wlanapi/ns-wlanapi-wlan_hosted_network_security_settings
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
class WLAN_HOSTED_NETWORK_SECURITY_SETTINGS extends Win32Struct {
    static sizeof => 8

    static packingSize => 4

    /**
     * The authentication algorithm used by the wireless Hosted Network.
     * @type {DOT11_AUTH_ALGORITHM}
     */
    dot11AuthAlgo {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The cipher algorithm used by the wireless Hosted Network.
     * @type {DOT11_CIPHER_ALGORITHM}
     */
    dot11CipherAlgo {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}

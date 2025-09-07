#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DOT11_AUTH_CIPHER_PAIR.ahk

/**
 * Contains a list of authentication and cipher algorithm pairs.
 * @see https://learn.microsoft.com/windows/win32/api/wlanapi/ns-wlanapi-wlan_auth_cipher_pair_list
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class WLAN_AUTH_CIPHER_PAIR_LIST extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Contains the number of supported auth-cipher pairs.
     * @type {Integer}
     */
    dwNumberOfItems {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/NativeWiFi/dot11-auth-cipher-pair">DOT11_AUTH_CIPHER_PAIR</a> structure containing a list of auth-cipher pairs.
     * @type {Array<DOT11_AUTH_CIPHER_PAIR>}
     */
    pAuthCipherPairList{
        get {
            if(!this.HasProp("__pAuthCipherPairListProxyArray"))
                this.__pAuthCipherPairListProxyArray := Win32FixedArray(this.ptr + 8, 8, DOT11_AUTH_CIPHER_PAIR, "")
            return this.__pAuthCipherPairListProxyArray
        }
    }
}

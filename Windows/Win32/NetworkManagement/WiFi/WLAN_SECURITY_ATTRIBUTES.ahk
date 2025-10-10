#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines the security attributes for a wireless connection.
 * @see https://docs.microsoft.com/windows/win32/api//wlanapi/ns-wlanapi-wlan_security_attributes
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class WLAN_SECURITY_ATTRIBUTES extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * Indicates whether security is enabled for this connection.
     * @type {Integer}
     */
    bSecurityEnabled {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Indicates whether 802.1X is enabled for this connection.
     * @type {Integer}
     */
    bOneXEnabled {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/NativeWiFi/dot11-auth-algorithm">DOT11_AUTH_ALGORITHM</a> value that identifies the authentication algorithm.
     * @type {Integer}
     */
    dot11AuthAlgorithm {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/NativeWiFi/dot11-cipher-algorithm">DOT11_CIPHER_ALGORITHM</a> value that identifies the cipher algorithm.
     * @type {Integer}
     */
    dot11CipherAlgorithm {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }
}

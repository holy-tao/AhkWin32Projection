#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DOT11_CIPHER_ALGORITHM.ahk" { DOT11_CIPHER_ALGORITHM }
#Import ".\DOT11_AUTH_ALGORITHM.ahk" { DOT11_AUTH_ALGORITHM }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Defines the security attributes for a wireless connection.
 * @see https://learn.microsoft.com/windows/win32/api/wlanapi/ns-wlanapi-wlan_security_attributes
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct WLAN_SECURITY_ATTRIBUTES {
    #StructPack 4

    /**
     * Indicates whether security is enabled for this connection.
     */
    bSecurityEnabled : BOOL

    /**
     * Indicates whether 802.1X is enabled for this connection.
     */
    bOneXEnabled : BOOL

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/NativeWiFi/dot11-auth-algorithm">DOT11_AUTH_ALGORITHM</a> value that identifies the authentication algorithm.
     */
    dot11AuthAlgorithm : DOT11_AUTH_ALGORITHM

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/NativeWiFi/dot11-cipher-algorithm">DOT11_CIPHER_ALGORITHM</a> value that identifies the cipher algorithm.
     */
    dot11CipherAlgorithm : DOT11_CIPHER_ALGORITHM

}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DOT11_CIPHER_ALGORITHM.ahk" { DOT11_CIPHER_ALGORITHM }
#Import ".\DOT11_AUTH_CIPHER_PAIR.ahk" { DOT11_AUTH_CIPHER_PAIR }
#Import ".\DOT11_AUTH_ALGORITHM.ahk" { DOT11_AUTH_ALGORITHM }

/**
 * Contains a list of authentication and cipher algorithm pairs.
 * @see https://learn.microsoft.com/windows/win32/api/wlanapi/ns-wlanapi-wlan_auth_cipher_pair_list
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct WLAN_AUTH_CIPHER_PAIR_LIST {
    #StructPack 4

    /**
     * Contains the number of supported auth-cipher pairs.
     */
    dwNumberOfItems : UInt32

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/NativeWiFi/dot11-auth-cipher-pair">DOT11_AUTH_CIPHER_PAIR</a> structure containing a list of auth-cipher pairs.
     */
    pAuthCipherPairList : DOT11_AUTH_CIPHER_PAIR[1]

}

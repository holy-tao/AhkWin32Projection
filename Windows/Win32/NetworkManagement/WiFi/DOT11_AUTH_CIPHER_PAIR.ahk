#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DOT11_CIPHER_ALGORITHM.ahk" { DOT11_CIPHER_ALGORITHM }
#Import ".\DOT11_AUTH_ALGORITHM.ahk" { DOT11_AUTH_ALGORITHM }

/**
 * Defines a pair of 802.11 authentication and cipher algorithms that can be enabled at the same time on the 802.11 station.
 * @remarks
 * The DOT11\_AUTH\_CIPHER\_PAIR structure defines an authentication and cipher algorithm that can be enabled together for basic service set (BSS) network connections.
 * @see https://learn.microsoft.com/windows/win32/NativeWiFi/dot11-auth-cipher-pair
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_AUTH_CIPHER_PAIR {
    #StructPack 4

    /**
     * An authentication algorithm that uses a [**DOT11\_AUTH\_ALGORITHM**](dot11-auth-algorithm.md) enumerated type.
     */
    AuthAlgoId : DOT11_AUTH_ALGORITHM

    /**
     * A cipher algorithm that uses a [**DOT11\_CIPHER\_ALGORITHM**](dot11-cipher-algorithm.md) enumerated type.
     */
    CipherAlgoId : DOT11_CIPHER_ALGORITHM

}

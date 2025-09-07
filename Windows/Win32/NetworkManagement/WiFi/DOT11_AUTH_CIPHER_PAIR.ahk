#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines a pair of 802.11 authentication and cipher algorithms that can be enabled at the same time on the 802.11 station.
 * @remarks
 * The DOT11\_AUTH\_CIPHER\_PAIR structure defines an authentication and cipher algorithm that can be enabled together for basic service set (BSS) network connections.
 * @see https://learn.microsoft.com/windows/win32/NativeWiFi/dot11-auth-cipher-pair
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_AUTH_CIPHER_PAIR extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * An authentication algorithm that uses a [**DOT11\_AUTH\_ALGORITHM**](dot11-auth-algorithm.md) enumerated type.
     * @type {Integer}
     */
    AuthAlgoId {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * A cipher algorithm that uses a [**DOT11\_CIPHER\_ALGORITHM**](dot11-cipher-algorithm.md) enumerated type.
     * @type {Integer}
     */
    CipherAlgoId {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}

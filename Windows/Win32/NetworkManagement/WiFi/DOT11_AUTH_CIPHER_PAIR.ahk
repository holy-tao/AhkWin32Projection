#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/NativeWiFi/dot11-auth-cipher-pair
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_AUTH_CIPHER_PAIR extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {Integer}
     */
    AuthAlgoId {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    CipherAlgoId {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}

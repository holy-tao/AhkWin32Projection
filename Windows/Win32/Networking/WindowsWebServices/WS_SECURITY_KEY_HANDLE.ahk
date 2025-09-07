#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The abstract base type for all types that specify a cryptographic key. Such a key is typically specified for a generic XML security token or a custom security token.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_security_key_handle
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_SECURITY_KEY_HANDLE extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Type of the key handle.
     * @type {Integer}
     */
    keyHandleType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}

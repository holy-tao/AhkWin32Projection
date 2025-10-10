#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WS_SECURITY_KEY_HANDLE.ahk

/**
 * The type for specifying asymmetric cryptographic keys as a CryptoNG NCRYPT_KEY_HANDLE.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ns-webservices-ws_ncrypt_asymmetric_security_key_handle
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_NCRYPT_ASYMMETRIC_SECURITY_KEY_HANDLE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The base type from which this type and all other key handle types derive.
     * @type {WS_SECURITY_KEY_HANDLE}
     */
    keyHandle{
        get {
            if(!this.HasProp("__keyHandle"))
                this.__keyHandle := WS_SECURITY_KEY_HANDLE(this.ptr + 0)
            return this.__keyHandle
        }
    }

    /**
     * The CryptoNG asymmetric cryptographic key.
     * @type {Pointer}
     */
    asymmetricKey {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}

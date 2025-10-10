#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains information about a Kerberos cryptographic session key.
 * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/ns-ntsecapi-kerb_crypto_key
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class KERB_CRYPTO_KEY extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * 
     * @type {Integer}
     */
    KeyType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Specifies the length, in bytes, of the cryptographic <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">session key</a>.
     * @type {Integer}
     */
    Length {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Contains the cryptographic session key.
     * @type {Pointer<Byte>}
     */
    Value {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}

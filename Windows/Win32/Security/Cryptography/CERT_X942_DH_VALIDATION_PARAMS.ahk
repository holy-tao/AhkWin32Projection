#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CRYPT_BIT_BLOB.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_X942_DH_VALIDATION_PARAMS extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {CRYPT_BIT_BLOB}
     */
    seed{
        get {
            if(!this.HasProp("__seed"))
                this.__seed := CRYPT_BIT_BLOB(this.ptr + 0)
            return this.__seed
        }
    }

    /**
     * @type {Integer}
     */
    pgenCounter {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}

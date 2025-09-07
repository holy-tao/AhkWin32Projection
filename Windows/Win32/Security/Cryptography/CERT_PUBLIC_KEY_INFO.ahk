#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk
#Include .\CRYPT_INTEGER_BLOB.ahk
#Include .\CRYPT_ALGORITHM_IDENTIFIER.ahk
#Include .\CRYPT_BIT_BLOB.ahk

/**
 * Contains a public key and its algorithm.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_public_key_info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_PUBLIC_KEY_INFO extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_algorithm_identifier">CRYPT_ALGORITHM_IDENTIFIER</a> structure that contains the public key algorithm type and associated additional parameters.
     * @type {CRYPT_ALGORITHM_IDENTIFIER}
     */
    Algorithm{
        get {
            if(!this.HasProp("__Algorithm"))
                this.__Algorithm := CRYPT_ALGORITHM_IDENTIFIER(this.ptr + 0)
            return this.__Algorithm
        }
    }

    /**
     * BLOB containing an encoded public key.
     * @type {CRYPT_BIT_BLOB}
     */
    PublicKey{
        get {
            if(!this.HasProp("__PublicKey"))
                this.__PublicKey := CRYPT_BIT_BLOB(this.ptr + 24)
            return this.__PublicKey
        }
    }
}

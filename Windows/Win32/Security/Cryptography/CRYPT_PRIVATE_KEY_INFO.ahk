#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk
#Include .\CRYPT_INTEGER_BLOB.ahk
#Include .\CRYPT_ALGORITHM_IDENTIFIER.ahk

/**
 * Contains a clear-text private key in the PrivateKey field (DER encoded). CRYPT_PRIVATE_KEY_INFO contains the information in a PKCS
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-crypt_private_key_info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRYPT_PRIVATE_KEY_INFO extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * A <b>DWORD</b>  value that identifies the PKCS #8 version.
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A  <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_algorithm_identifier">CRYPT_ALGORITHM_IDENTIFIER</a>  structure that indicates the algorithm in which the private key (RSA or DSA) is to be used.
     * @type {CRYPT_ALGORITHM_IDENTIFIER}
     */
    Algorithm{
        get {
            if(!this.HasProp("__Algorithm"))
                this.__Algorithm := CRYPT_ALGORITHM_IDENTIFIER(this.ptr + 8)
            return this.__Algorithm
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_DER_BLOB</a> structure that contains the key data.
     * @type {CRYPT_INTEGER_BLOB}
     */
    PrivateKey{
        get {
            if(!this.HasProp("__PrivateKey"))
                this.__PrivateKey := CRYPT_INTEGER_BLOB(this.ptr + 32)
            return this.__PrivateKey
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_attributes">CRYPT_ATTRIBUTES</a>  structure that identifies the PKCS #8 attributes.
     * @type {Pointer<CRYPT_ATTRIBUTES>}
     */
    pAttributes {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }
}

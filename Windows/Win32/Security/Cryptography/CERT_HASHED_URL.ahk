#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CRYPT_INTEGER_BLOB.ahk
#Include .\CRYPT_ALGORITHM_IDENTIFIER.ahk

/**
 * Contains a hashed URL.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_hashed_url
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_HASHED_URL extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_algorithm_identifier">CRYPT_ALGORITHM_IDENTIFIER</a> structure that specifies the hash algorithm used to create the URL hash.
     * @type {CRYPT_ALGORITHM_IDENTIFIER}
     */
    HashAlgorithm{
        get {
            if(!this.HasProp("__HashAlgorithm"))
                this.__HashAlgorithm := CRYPT_ALGORITHM_IDENTIFIER(0, this)
            return this.__HashAlgorithm
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_HASH_BLOB</a> structure that contains the hash value.
     * @type {CRYPT_INTEGER_BLOB}
     */
    Hash{
        get {
            if(!this.HasProp("__Hash"))
                this.__Hash := CRYPT_INTEGER_BLOB(24, this)
            return this.__Hash
        }
    }

    /**
     * The address of a null-terminated Unicode string that contains the URL. This member is optional for biometric data and may be <b>NULL</b>.
     * @type {PWSTR}
     */
    pwszUrl {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }
}

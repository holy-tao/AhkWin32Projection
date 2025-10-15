#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk
#Include .\CRYPT_INTEGER_BLOB.ahk
#Include .\CRYPT_ALGORITHM_IDENTIFIER.ahk

/**
 * Contains the information in a PKCS
 * @see https://docs.microsoft.com/windows/win32/api//wincrypt/ns-wincrypt-crypt_encrypted_private_key_info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRYPT_ENCRYPTED_PRIVATE_KEY_INFO extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_algorithm_identifier">CRYPT_ALGORITHM_IDENTIFIER</a> structure that indicates the algorithm used for encryption.
     * @type {CRYPT_ALGORITHM_IDENTIFIER}
     */
    EncryptionAlgorithm{
        get {
            if(!this.HasProp("__EncryptionAlgorithm"))
                this.__EncryptionAlgorithm := CRYPT_ALGORITHM_IDENTIFIER(this.ptr + 0)
            return this.__EncryptionAlgorithm
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_DATA_BLOB</a> structure that contains the encrypted private key data.
     * @type {CRYPT_INTEGER_BLOB}
     */
    EncryptedPrivateKey{
        get {
            if(!this.HasProp("__EncryptedPrivateKey"))
                this.__EncryptedPrivateKey := CRYPT_INTEGER_BLOB(this.ptr + 24)
            return this.__EncryptedPrivateKey
        }
    }
}

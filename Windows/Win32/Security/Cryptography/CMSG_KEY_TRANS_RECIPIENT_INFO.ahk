#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CRYPT_INTEGER_BLOB.ahk
#Include .\CERT_ISSUER_SERIAL_NUMBER.ahk
#Include .\CERT_ID.ahk
#Include .\CRYPT_ALGORITHM_IDENTIFIER.ahk

/**
 * The CMSG_KEY_TRANS_RECIPIENT_INFO structure contains information used in key transport algorithms.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cmsg_key_trans_recipient_info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CMSG_KEY_TRANS_RECIPIENT_INFO extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * Indicates the version of the structure. If <b>RecipientId</b> uses the ISSUER_SERIAL_NUMBER to identify the recipient, <b>dwVersion</b> is set to zero. If <b>RecipientId</b> uses KEYID, <b>dwVersion</b> is set to two.
     * @type {Integer}
     */
    dwVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_id">CERT_ID</a> that identifies the recipient. Currently, only ISSUER_SERIAL_NUMBER or KEYID choices in the <b>CERT_ID</b> are valid.
     * @type {CERT_ID}
     */
    RecipientId{
        get {
            if(!this.HasProp("__RecipientId"))
                this.__RecipientId := CERT_ID(this.ptr + 8)
            return this.__RecipientId
        }
    }

    /**
     * A 
     * 						<a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_algorithm_identifier">CRYPT_ALGORITHM_IDENTIFIER</a> that identifies the key-encryption algorithm and any associated parameters used to encrypt the content encryption key.
     * @type {CRYPT_ALGORITHM_IDENTIFIER}
     */
    KeyEncryptionAlgorithm{
        get {
            if(!this.HasProp("__KeyEncryptionAlgorithm"))
                this.__KeyEncryptionAlgorithm := CRYPT_ALGORITHM_IDENTIFIER(this.ptr + 32)
            return this.__KeyEncryptionAlgorithm
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_DATA_BLOB</a> that contains the bytes of the encrypted session key.
     * @type {CRYPT_INTEGER_BLOB}
     */
    EncryptedKey{
        get {
            if(!this.HasProp("__EncryptedKey"))
                this.__EncryptedKey := CRYPT_INTEGER_BLOB(this.ptr + 56)
            return this.__EncryptedKey
        }
    }
}

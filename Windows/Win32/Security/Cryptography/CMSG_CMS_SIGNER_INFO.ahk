#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CRYPT_INTEGER_BLOB.ahk
#Include .\CERT_ISSUER_SERIAL_NUMBER.ahk
#Include .\CERT_ID.ahk
#Include .\CRYPT_ALGORITHM_IDENTIFIER.ahk
#Include .\CRYPT_ATTRIBUTES.ahk

/**
 * Contains the content of the defined SignerInfo in signed or signed and enveloped messages.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cmsg_cms_signer_info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CMSG_CMS_SIGNER_INFO extends Win32Struct
{
    static sizeof => 128

    static packingSize => 8

    /**
     * The version of this structure.
     * @type {Integer}
     */
    dwVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_id">CERT_ID</a> structure that identifies the signer's certificate.
     * @type {CERT_ID}
     */
    SignerId{
        get {
            if(!this.HasProp("__SignerId"))
                this.__SignerId := CERT_ID(this.ptr + 8)
            return this.__SignerId
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_algorithm_identifier">CRYPT_ALGORITHM_IDENTIFIER</a> structure that specifies the algorithm used in generating the hash of a message.
     * @type {CRYPT_ALGORITHM_IDENTIFIER}
     */
    HashAlgorithm{
        get {
            if(!this.HasProp("__HashAlgorithm"))
                this.__HashAlgorithm := CRYPT_ALGORITHM_IDENTIFIER(this.ptr + 32)
            return this.__HashAlgorithm
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_algorithm_identifier">CRYPT_ALGORITHM_IDENTIFIER</a> structure that specifies the algorithm used to encrypt the hash.
     * @type {CRYPT_ALGORITHM_IDENTIFIER}
     */
    HashEncryptionAlgorithm{
        get {
            if(!this.HasProp("__HashEncryptionAlgorithm"))
                this.__HashEncryptionAlgorithm := CRYPT_ALGORITHM_IDENTIFIER(this.ptr + 56)
            return this.__HashEncryptionAlgorithm
        }
    }

    /**
     * A
     * 						<a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_DATA_BLOB</a> structure that contains the encrypted hash of the message, the signature.
     * @type {CRYPT_INTEGER_BLOB}
     */
    EncryptedHash{
        get {
            if(!this.HasProp("__EncryptedHash"))
                this.__EncryptedHash := CRYPT_INTEGER_BLOB(this.ptr + 80)
            return this.__EncryptedHash
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_attributes">CRYPT_ATTRIBUTES</a> structure that contains authenticated attributes of the signer.
     * @type {CRYPT_ATTRIBUTES}
     */
    AuthAttrs{
        get {
            if(!this.HasProp("__AuthAttrs"))
                this.__AuthAttrs := CRYPT_ATTRIBUTES(this.ptr + 96)
            return this.__AuthAttrs
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_attributes">CRYPT_ATTRIBUTES</a> structure that contains unauthenticated attributes of the signer.
     * @type {CRYPT_ATTRIBUTES}
     */
    UnauthAttrs{
        get {
            if(!this.HasProp("__UnauthAttrs"))
                this.__UnauthAttrs := CRYPT_ATTRIBUTES(this.ptr + 112)
            return this.__UnauthAttrs
        }
    }
}

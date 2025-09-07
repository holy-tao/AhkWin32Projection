#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CRYPT_INTEGER_BLOB.ahk
#Include .\CRYPT_ALGORITHM_IDENTIFIER.ahk
#Include .\CRYPT_ATTRIBUTES.ahk

/**
 * The CMSG_SIGNER_INFO structure contains the content of the PKCS
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cmsg_signer_info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CMSG_SIGNER_INFO extends Win32Struct
{
    static sizeof => 136

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
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CERT_NAME_BLOB</a> structure that contains the issuer of a certificate with the public key needed to verify a signature.
     * @type {CRYPT_INTEGER_BLOB}
     */
    Issuer{
        get {
            if(!this.HasProp("__Issuer"))
                this.__Issuer := CRYPT_INTEGER_BLOB(this.ptr + 8)
            return this.__Issuer
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_INTEGER_BLOB</a> structure that contains the serial number of the certificate that contains the public key needed to verify a signature. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_info">CERT_INFO</a>.
     * @type {CRYPT_INTEGER_BLOB}
     */
    SerialNumber{
        get {
            if(!this.HasProp("__SerialNumber"))
                this.__SerialNumber := CRYPT_INTEGER_BLOB(this.ptr + 24)
            return this.__SerialNumber
        }
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_algorithm_identifier">CRYPT_ALGORITHM_IDENTIFIER</a> structure specifying the algorithm used in generating the hash of a message.
     * @type {CRYPT_ALGORITHM_IDENTIFIER}
     */
    HashAlgorithm{
        get {
            if(!this.HasProp("__HashAlgorithm"))
                this.__HashAlgorithm := CRYPT_ALGORITHM_IDENTIFIER(this.ptr + 40)
            return this.__HashAlgorithm
        }
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_algorithm_identifier">CRYPT_ALGORITHM_IDENTIFIER</a> structure specifying the algorithm used to encrypt the hash.
     * @type {CRYPT_ALGORITHM_IDENTIFIER}
     */
    HashEncryptionAlgorithm{
        get {
            if(!this.HasProp("__HashEncryptionAlgorithm"))
                this.__HashEncryptionAlgorithm := CRYPT_ALGORITHM_IDENTIFIER(this.ptr + 64)
            return this.__HashEncryptionAlgorithm
        }
    }

    /**
     * A
     * 						<a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_DATA_BLOB</a> that contains the encrypted hash of the message, the signature.
     * @type {CRYPT_INTEGER_BLOB}
     */
    EncryptedHash{
        get {
            if(!this.HasProp("__EncryptedHash"))
                this.__EncryptedHash := CRYPT_INTEGER_BLOB(this.ptr + 88)
            return this.__EncryptedHash
        }
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_attributes">CRYPT_ATTRIBUTES</a> structure containing authenticated attributes of the signer.
     * @type {CRYPT_ATTRIBUTES}
     */
    AuthAttrs{
        get {
            if(!this.HasProp("__AuthAttrs"))
                this.__AuthAttrs := CRYPT_ATTRIBUTES(this.ptr + 104)
            return this.__AuthAttrs
        }
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_attributes">CRYPT_ATTRIBUTES</a> structure containing unauthenticated attributes of the signer.
     * @type {CRYPT_ATTRIBUTES}
     */
    UnauthAttrs{
        get {
            if(!this.HasProp("__UnauthAttrs"))
                this.__UnauthAttrs := CRYPT_ATTRIBUTES(this.ptr + 120)
            return this.__UnauthAttrs
        }
    }
}

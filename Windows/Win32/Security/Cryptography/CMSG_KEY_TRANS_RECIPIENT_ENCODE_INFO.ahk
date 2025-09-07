#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CRYPT_INTEGER_BLOB.ahk
#Include .\CRYPT_ALGORITHM_IDENTIFIER.ahk
#Include .\CRYPT_BIT_BLOB.ahk
#Include .\CERT_ISSUER_SERIAL_NUMBER.ahk
#Include .\CERT_ID.ahk

/**
 * Contains encoded key transport information for a message recipient.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cmsg_key_trans_recipient_encode_info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CMSG_KEY_TRANS_RECIPIENT_ENCODE_INFO extends Win32Struct
{
    static sizeof => 96

    static packingSize => 8

    /**
     * A <b>DWORD</b> value that indicates the size, in bytes, of the structure.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A 
     * 						<a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_algorithm_identifier">CRYPT_ALGORITHM_IDENTIFIER</a> value that identifies the key-encryption algorithm and any associated parameters used to encrypt the content encryption key.
     * 
     * For RSA AES,  the <b>pszObjId</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_algorithm_identifier">CRYPT_ALGORITHM_IDENTIFIER</a> structure  should be set to szOID_RSAES_OAEP. The <b>Parameters</b> member of the  <b>CRYPT_ALGORITHM_IDENTIFIER</b> structure should be set to the encoded <b>PKCS_RSAES_OAEP_PARAMETERS</b>. If the <b>Parameters.cbData</b> member is equal to zero, then the default parameters are used and encoded.
     * @type {CRYPT_ALGORITHM_IDENTIFIER}
     */
    KeyEncryptionAlgorithm{
        get {
            if(!this.HasProp("__KeyEncryptionAlgorithm"))
                this.__KeyEncryptionAlgorithm := CRYPT_ALGORITHM_IDENTIFIER(this.ptr + 8)
            return this.__KeyEncryptionAlgorithm
        }
    }

    /**
     * A void pointer to a structure that contains additional information about the encryption. The format of the structure is dependent upon the algorithm indicated by <b>KeyEncryptionAlgorithm</b>.
     * @type {Pointer<Void>}
     */
    pvKeyEncryptionAuxInfo {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * This member is not used and should be set to <b>NULL</b>.
     * 
     * <b>Windows Server 2003 and Windows XP:  </b> A <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/hcryptprov">HCRYPTPROV</a> value used to do the recipient key encryption and export. The provider's private keys are not used. If <b>hCryptProv</b> is <b>NULL</b>, the <b>HCRYPTPROV</b> specified in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cmsg_enveloped_encode_info">CMSG_ENVELOPED_ENCODE_INFO</a> is used.Note that this <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/hcryptprov">HCRYPTPROV</a> is not released even if CMSG_CRYPT_RELEASE_CONTEXT_FLAG is set in the <i>dwFlags</i> parameter passed to <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptmsgopentoencode">CryptMsgOpenToEncode</a>.
     * @type {Pointer}
     */
    hCryptProv {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * A <b>CRYPT_BIT_BLOB</b> variable that contains the public key of the recipient.
     * @type {CRYPT_BIT_BLOB}
     */
    RecipientPublicKey{
        get {
            if(!this.HasProp("__RecipientPublicKey"))
                this.__RecipientPublicKey := CRYPT_BIT_BLOB(this.ptr + 48)
            return this.__RecipientPublicKey
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_id">CERT_ID</a> value that identifies the recipient. CMS supports the KEY_IDENTIFIER and ISSUER_SERIAL_NUMBER <b>CERT_ID</b>s. PKCS #7 version 1.5 supports only the ISSUER_SERIAL_NUMBER <b>CERT_ID</b>s.
     * @type {CERT_ID}
     */
    RecipientId{
        get {
            if(!this.HasProp("__RecipientId"))
                this.__RecipientId := CERT_ID(this.ptr + 72)
            return this.__RecipientId
        }
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 96
    }
}

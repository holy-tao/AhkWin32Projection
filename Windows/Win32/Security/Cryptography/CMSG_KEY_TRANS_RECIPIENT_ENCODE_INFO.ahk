#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HCRYPTPROV_LEGACY.ahk" { HCRYPTPROV_LEGACY }
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }
#Import ".\CERT_ID_OPTION.ahk" { CERT_ID_OPTION }
#Import ".\CERT_ISSUER_SERIAL_NUMBER.ahk" { CERT_ISSUER_SERIAL_NUMBER }
#Import ".\CRYPT_ALGORITHM_IDENTIFIER.ahk" { CRYPT_ALGORITHM_IDENTIFIER }
#Import ".\CERT_ID.ahk" { CERT_ID }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import ".\CRYPT_BIT_BLOB.ahk" { CRYPT_BIT_BLOB }

/**
 * Contains encoded key transport information for a message recipient.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cmsg_key_trans_recipient_encode_info
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CMSG_KEY_TRANS_RECIPIENT_ENCODE_INFO {
    #StructPack 8

    /**
     * A <b>DWORD</b> value that indicates the size, in bytes, of the structure.
     */
    cbSize : UInt32 := this.Size

    /**
     * A 
     * 						<a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_algorithm_identifier">CRYPT_ALGORITHM_IDENTIFIER</a> value that identifies the key-encryption algorithm and any associated parameters used to encrypt the content encryption key.
     * 
     * For RSA AES,  the <b>pszObjId</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_algorithm_identifier">CRYPT_ALGORITHM_IDENTIFIER</a> structure  should be set to szOID_RSAES_OAEP. The <b>Parameters</b> member of the  <b>CRYPT_ALGORITHM_IDENTIFIER</b> structure should be set to the encoded <b>PKCS_RSAES_OAEP_PARAMETERS</b>. If the <b>Parameters.cbData</b> member is equal to zero, then the default parameters are used and encoded.
     */
    KeyEncryptionAlgorithm : CRYPT_ALGORITHM_IDENTIFIER

    /**
     * A void pointer to a structure that contains additional information about the encryption. The format of the structure is dependent upon the algorithm indicated by <b>KeyEncryptionAlgorithm</b>.
     */
    pvKeyEncryptionAuxInfo : IntPtr

    /**
     * This member is not used and should be set to <b>NULL</b>.
     * 
     * <b>Windows Server 2003 and Windows XP:  </b> A <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/hcryptprov">HCRYPTPROV</a> value used to do the recipient key encryption and export. The provider's private keys are not used. If <b>hCryptProv</b> is <b>NULL</b>, the <b>HCRYPTPROV</b> specified in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cmsg_enveloped_encode_info">CMSG_ENVELOPED_ENCODE_INFO</a> is used.Note that this <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/hcryptprov">HCRYPTPROV</a> is not released even if CMSG_CRYPT_RELEASE_CONTEXT_FLAG is set in the <i>dwFlags</i> parameter passed to <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptmsgopentoencode">CryptMsgOpenToEncode</a>.
     */
    hCryptProv : HCRYPTPROV_LEGACY

    /**
     * A <b>CRYPT_BIT_BLOB</b> variable that contains the public key of the recipient.
     */
    RecipientPublicKey : CRYPT_BIT_BLOB

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_id">CERT_ID</a> value that identifies the recipient. CMS supports the KEY_IDENTIFIER and ISSUER_SERIAL_NUMBER <b>CERT_ID</b>s. PKCS #7 version 1.5 supports only the ISSUER_SERIAL_NUMBER <b>CERT_ID</b>s.
     */
    RecipientId : CERT_ID

}

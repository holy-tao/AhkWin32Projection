#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }
#Import ".\HCRYPTPROV_LEGACY.ahk" { HCRYPTPROV_LEGACY }
#Import ".\CRYPT_ALGORITHM_IDENTIFIER.ahk" { CRYPT_ALGORITHM_IDENTIFIER }
#Import ".\CMSG_RECIPIENT_ENCRYPTED_KEY_ENCODE_INFO.ahk" { CMSG_RECIPIENT_ENCRYPTED_KEY_ENCODE_INFO }
#Import ".\CERT_ID.ahk" { CERT_ID }
#Import ".\CMSG_KEY_AGREE_OPTION.ahk" { CMSG_KEY_AGREE_OPTION }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Contains information about a message recipient that is using key agreement key management.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cmsg_key_agree_recipient_encode_info
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CMSG_KEY_AGREE_RECIPIENT_ENCODE_INFO {
    #StructPack 8

    /**
     * The size, in bytes, of this structure.
     */
    cbSize : UInt32 := this.Size

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_algorithm_identifier">CRYPT_ALGORITHM_IDENTIFIER</a> structure that specifies the algorithm used for encryption.
     * 
     * For ECC recipients, the <b>pszObjId</b> member of the  <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_algorithm_identifier">CRYPT_ALGORITHM_IDENTIFIER</a> structure should be set to szOID_DH_SINGLE_PASS_STDDH_SHA1_KDF with the <b>dwKeyChoice</b> member of this <b>CMSG_KEY_AGREE_RECIPIENT_ENCODE_INFO</b> structure set to CMSG_KEY_AGREE_EPHEMERAL_KEY_CHOICE.
     */
    KeyEncryptionAlgorithm : CRYPT_ALGORITHM_IDENTIFIER

    /**
     * This member is not currently used. It must be set to <b>NULL</b>.
     */
    pvKeyEncryptionAuxInfo : IntPtr

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_algorithm_identifier">CRYPT_ALGORITHM_IDENTIFIER</a> structure that specifies the algorithm used for key wrapping.
     */
    KeyWrapAlgorithm : CRYPT_ALGORITHM_IDENTIFIER

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cmsg_rc2_aux_info">CMSG_RC2_AUX_INFO</a> structure that specifies the key wrapping bit length. This member is only used if the <b>KeyWrapAlgorithm</b> member specifies an RC2 algorithm. If <b>KeyWrapAlgorithm</b> specifies an algorithm other than an RC2 algorithm, this member is not used and must be <b>NULL</b>.
     */
    pvKeyWrapAuxInfo : IntPtr

    /**
     * This member is not used and should be set to <b>NULL</b>.
     * 
     * <b>Windows Server 2003 and Windows XP:  </b>A handle to a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">cryptographic service provider</a> (CSP) obtained by using the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptacquirecontexta">CryptAcquireContext</a> function. This member is optional and can be <b>NULL</b>.This member's data type is <b>HCRYPTPROV</b>.
     */
    hCryptProv : HCRYPTPROV_LEGACY

    /**
     * This member is not currently used.
     */
    dwKeySpec : UInt32

    dwKeyChoice : CMSG_KEY_AGREE_OPTION

    pEphemeralAlgorithm : CRYPT_ALGORITHM_IDENTIFIER.Ptr

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_DATA_BLOB</a> structure that contains user keying material (UKM) provided by the sender to ensure that a different key is generated each time the same two parties generate a pair-wise key. This member is optional and all members should be set to zero if not used.
     */
    UserKeyingMaterial : CRYPT_INTEGER_BLOB

    /**
     * The number of elements in the <b>rgpRecipientEncryptedKeys</b> array.
     */
    cRecipientEncryptedKeys : UInt32

    /**
     * An array of  <a href="https://docs.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cmsg_recipient_encrypted_key_encode_info">CMSG_RECIPIENT_ENCRYPTED_KEY_ENCODE_INFO</a> structures, one for each recipient to receive this key agreement key. The <b>cRecipientEncryptedKeys</b> member contains the number of elements in this structure.
     */
    rgpRecipientEncryptedKeys : IntPtr

    static __New() {
        DefineProp(this.Prototype, 'pSenderId', { type: CERT_ID.Ptr, offset: 88 })
        this.DeleteProp("__New")
    }
}

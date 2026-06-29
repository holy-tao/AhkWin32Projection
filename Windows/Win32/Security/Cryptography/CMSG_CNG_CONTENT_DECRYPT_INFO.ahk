#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\BCRYPT_KEY_HANDLE.ahk" { BCRYPT_KEY_HANDLE }
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }
#Import ".\NCRYPT_KEY_HANDLE.ahk" { NCRYPT_KEY_HANDLE }
#Import ".\CRYPT_ALGORITHM_IDENTIFIER.ahk" { CRYPT_ALGORITHM_IDENTIFIER }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Contains all the relevant information passed between CryptMsgControl and object identifier (OID) installable functions for the import and decryption of a Cryptography API:\_Next Generation (CNG) content encryption key (CEK).
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cmsg_cng_content_decrypt_info
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CMSG_CNG_CONTENT_DECRYPT_INFO {
    #StructPack 8

    /**
     * Contains the size, in bytes, of this structure.
     */
    cbSize : UInt32 := this.Size

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_algorithm_identifier">CRYPT_ALGORITHM_IDENTIFIER</a>   structure that specifies the algorithm used to encrypt the message contents and any associated parameters.
     */
    ContentEncryptionAlgorithm : CRYPT_ALGORITHM_IDENTIFIER

    /**
     * A pointer to an installable function used to allocate memory for any updated member.
     */
    pfnAlloc : IntPtr

    /**
     * A pointer to an installable function used to free memory allocated by <i>pfnAlloc</i>.
     */
    pfnFree : IntPtr

    /**
     * A handle to the CNG <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">private key</a> to be used for decryption of the CEK contained in the <i>pKeyTransDecryptPara</i> parameter or the <i>pKeyAgreeDecryptPara</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nc-wincrypt-pfn_cmsg_cng_import_key_trans">PFN_CMSG_CNG_IMPORT_KEY_TRANS</a> function. Callback functions must use this key instead of the one contained in the <i>DecryptPara</i> structure because that structure might contain a converted <b>HCRYPTPROV</b> handle.
     */
    hNCryptKey : NCRYPT_KEY_HANDLE

    /**
     * Using the <b>hNCryptKey</b> member, the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nc-wincrypt-pfn_cmsg_cng_import_key_trans">PFN_CMSG_CNG_IMPORT_KEY_TRANS</a> function must update this member by decrypting the CEK in the <i>pKeyTransDecryptPara</i> parameter or the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nc-wincrypt-pfn_cmsg_cng_import_key_agree">PFN_CMSG_CNG_IMPORT_KEY_AGREE</a> function must update this member by decrypting the EncryptedKey in the <i>pKeyAgreeDecryptPara</i> parameter. The memory for this member must be allocated by using the <b>pfnAlloc</b> member. The <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nc-wincrypt-pfn_cmsg_cng_import_content_encrypt_key">PFN_CMSG_CNG_IMPORT_CONTENT_ENCRYPT_KEY</a> function will use these bytes as the secret to generate the <b>hCNGContentEncryptKey</b> member. Even for an error, you must free and zero any allocated memory by using the <b>pfnFree</b> member.
     */
    pbContentEncryptKey : IntPtr

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nc-wincrypt-pfn_cmsg_cng_import_key_trans">PFN_CMSG_CNG_IMPORT_KEY_TRANS</a> or <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nc-wincrypt-pfn_cmsg_cng_import_key_agree">PFN_CMSG_CNG_IMPORT_KEY_AGREE</a> function must update this member with the size, in bytes, of the above <b>pbContentEncryptKey</b> member.
     */
    cbContentEncryptKey : UInt32

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nc-wincrypt-pfn_cmsg_cng_import_content_encrypt_key">PFN_CMSG_CNG_IMPORT_CONTENT_ENCRYPT_KEY</a> function must update this member with the generated <b>BCRYPT_KEY_HANDLE</b> to be used for content decryption. Even for an error, you must release this handle by using the <a href="https://docs.microsoft.com/windows/desktop/api/bcrypt/nf-bcrypt-bcryptdestroykey">BCryptDestroyKey</a> function.
     */
    hCNGContentEncryptKey : BCRYPT_KEY_HANDLE

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nc-wincrypt-pfn_cmsg_cng_import_content_encrypt_key">PFN_CMSG_CNG_IMPORT_CONTENT_ENCRYPT_KEY</a> function must update this member with the memory allocated by the <b>pfnAlloc</b> member to be associated with the <b>hCNGContentEncryptKey</b> member. Even for an error, you must free and zero any allocated memory by using the <b>pfnFree</b> member.
     */
    pbCNGContentEncryptKeyObject : IntPtr

}

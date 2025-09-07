#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CRYPT_INTEGER_BLOB.ahk
#Include .\CRYPT_ALGORITHM_IDENTIFIER.ahk

/**
 * Contains all the relevant information passed between CryptMsgControl and object identifier (OID) installable functions for the import and decryption of a Cryptography API:\_Next Generation (CNG) content encryption key (CEK).
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cmsg_cng_content_decrypt_info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CMSG_CNG_CONTENT_DECRYPT_INFO extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * Contains the size, in bytes, of this structure.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_algorithm_identifier">CRYPT_ALGORITHM_IDENTIFIER</a>   structure that specifies the algorithm used to encrypt the message contents and any associated parameters.
     * @type {CRYPT_ALGORITHM_IDENTIFIER}
     */
    ContentEncryptionAlgorithm{
        get {
            if(!this.HasProp("__ContentEncryptionAlgorithm"))
                this.__ContentEncryptionAlgorithm := CRYPT_ALGORITHM_IDENTIFIER(this.ptr + 8)
            return this.__ContentEncryptionAlgorithm
        }
    }

    /**
     * A pointer to an installable function used to allocate memory for any updated member.
     * @type {Pointer<Ptr>}
     */
    pfnAlloc {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * A pointer to an installable function used to free memory allocated by <i>pfnAlloc</i>.
     * @type {Pointer<Ptr>}
     */
    pfnFree {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * A handle to the CNG <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">private key</a> to be used for decryption of the CEK contained in the <i>pKeyTransDecryptPara</i> parameter or the <i>pKeyAgreeDecryptPara</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nc-wincrypt-pfn_cmsg_cng_import_key_trans">PFN_CMSG_CNG_IMPORT_KEY_TRANS</a> function. Callback functions must use this key instead of the one contained in the <i>DecryptPara</i> structure because that structure might contain a converted <b>HCRYPTPROV</b> handle.
     * @type {Pointer}
     */
    hNCryptKey {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Using the <b>hNCryptKey</b> member, the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nc-wincrypt-pfn_cmsg_cng_import_key_trans">PFN_CMSG_CNG_IMPORT_KEY_TRANS</a> function must update this member by decrypting the CEK in the <i>pKeyTransDecryptPara</i> parameter or the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nc-wincrypt-pfn_cmsg_cng_import_key_agree">PFN_CMSG_CNG_IMPORT_KEY_AGREE</a> function must update this member by decrypting the EncryptedKey in the <i>pKeyAgreeDecryptPara</i> parameter. The memory for this member must be allocated by using the <b>pfnAlloc</b> member. The <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nc-wincrypt-pfn_cmsg_cng_import_content_encrypt_key">PFN_CMSG_CNG_IMPORT_CONTENT_ENCRYPT_KEY</a> function will use these bytes as the secret to generate the <b>hCNGContentEncryptKey</b> member. Even for an error, you must free and zero any allocated memory by using the <b>pfnFree</b> member.
     * @type {Pointer<Byte>}
     */
    pbContentEncryptKey {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nc-wincrypt-pfn_cmsg_cng_import_key_trans">PFN_CMSG_CNG_IMPORT_KEY_TRANS</a> or <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nc-wincrypt-pfn_cmsg_cng_import_key_agree">PFN_CMSG_CNG_IMPORT_KEY_AGREE</a> function must update this member with the size, in bytes, of the above <b>pbContentEncryptKey</b> member.
     * @type {Integer}
     */
    cbContentEncryptKey {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nc-wincrypt-pfn_cmsg_cng_import_content_encrypt_key">PFN_CMSG_CNG_IMPORT_CONTENT_ENCRYPT_KEY</a> function must update this member with the generated <b>BCRYPT_KEY_HANDLE</b> to be used for content decryption. Even for an error, you must release this handle by using the <a href="https://docs.microsoft.com/windows/desktop/api/bcrypt/nf-bcrypt-bcryptdestroykey">BCryptDestroyKey</a> function.
     * @type {Pointer<Ptr>}
     */
    hCNGContentEncryptKey {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nc-wincrypt-pfn_cmsg_cng_import_content_encrypt_key">PFN_CMSG_CNG_IMPORT_CONTENT_ENCRYPT_KEY</a> function must update this member with the memory allocated by the <b>pfnAlloc</b> member to be associated with the <b>hCNGContentEncryptKey</b> member. Even for an error, you must free and zero any allocated memory by using the <b>pfnFree</b> member.
     * @type {Pointer<Byte>}
     */
    pbCNGContentEncryptKeyObject {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 88
    }
}

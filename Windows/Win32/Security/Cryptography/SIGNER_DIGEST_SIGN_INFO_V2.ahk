#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PFN_AUTHENTICODE_DIGEST_SIGN_EX.ahk" { PFN_AUTHENTICODE_DIGEST_SIGN_EX }
#Import ".\PFN_AUTHENTICODE_DIGEST_SIGN.ahk" { PFN_AUTHENTICODE_DIGEST_SIGN }
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }

/**
 * contains information about digest signing.
 * @see https://learn.microsoft.com/windows/win32/SecCrypto/signer-digest-sign-info-v2
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct SIGNER_DIGEST_SIGN_INFO_V2 {
    #StructPack 8

    /**
     * The size, in bytes, of the structure.
     */
    cbSize : UInt32 := this.Size

    /**
     * Pointer to the [**PFN_AUTHENTICODE_DIGEST_SIGN**](pfn-authenticode-digest-sign.md) callback function. Required if the caller of SignerSignEx3 specifies SPC_DIGEST_SIGN_FLAG in the dwFlags parameter.
     */
    pfnAuthenticodeDigestSign : PFN_AUTHENTICODE_DIGEST_SIGN

    /**
     * Pointer to the [**PFN_AUTHENTICODE_DIGEST_SIGN_EX**](pfn-authenticode-digest-sign-ex.md) callback function. Required if the caller of SignerSignEx3 specifies SPC_DIGEST_SIGN_EX_FLAG in the dwFlags parameter.
     */
    pfnAuthenticodeDigestSignEx : PFN_AUTHENTICODE_DIGEST_SIGN_EX

    /**
     * Optional pointer to [**CRYPT_DATA_BLOB**](/windows/win32/api/wincrypt/ns-wincrypt-crypt_integer_blob) specifying metadata.
     */
    pMetadataBlob : CRYPT_INTEGER_BLOB.Ptr

}

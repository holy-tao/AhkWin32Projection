#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }

/**
 * contains information about digest signing.
 * @see https://learn.microsoft.com/windows/win32/SecCrypto/signer-digest-sign-info-v1
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct SIGNER_DIGEST_SIGN_INFO_V1 {
    #StructPack 8

    /**
     * The size, in bytes, of the structure.
     */
    cbSize : UInt32 := this.Size

    pfnAuthenticodeDigestSign : IntPtr

    /**
     * Optional pointer to [**CRYPT_DATA_BLOB**](/windows/win32/api/wincrypt/ns-wincrypt-crypt_integer_blob) specifying metadata.
     */
    pMetadataBlob : CRYPT_INTEGER_BLOB.Ptr

}

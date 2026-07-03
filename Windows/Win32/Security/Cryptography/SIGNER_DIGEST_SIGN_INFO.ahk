#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }

/**
 * contains information about digest signing.
 * @see https://learn.microsoft.com/windows/win32/SecCrypto/signer-digest-sign-info
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct SIGNER_DIGEST_SIGN_INFO {
    #StructPack 8

    /**
     * The size, in bytes, of the structure.
     */
    cbSize : UInt32 := this.Size

    /**
     * Specifies which digest sign implementation to use.
     * 
     * 
     * 
     * | Value                                                                                                                                                                                                                                                                                   | Meaning                                                                                                                                                                                   |
     * |-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | <span id="DIGEST_SIGN"></span><span id="digest_sign"></span><dl> <dt>**DIGEST\_SIGN**</dt> <dt>1 (0x1)</dt> </dl>                                                                    | Use the DIGEST_SIGN implementation.<br/>                                                                                                                                |
     * | <span id="DIGEST_SIGN_WITHFILEHANDLE"></span><span id="digest_sign_withfilehandle"></span><dl> <dt>**DIGEST\_SIGN\_WITHFILEHANDLE**</dt> <dt>2 (0x2)</dt> </dl> | Use the DIGEST_SIGN_WITHFILEHANDLE implementation. <br/>                                                                                                |
     * | <span id="DIGEST_SIGN_EX"></span><span id="digest_sign_ex"></span><dl> <dt>**DIGEST\_SIGN\_EX**</dt> <dt>3 (0x3)</dt> </dl>                           | Use the DIGEST_SIGN_EX implementation.<br/> |
     * | <span id="DIGEST_SIGN_EX_WITHFILEHANDLE"></span><span id="digest_sign_ex_withfilehandle"></span><dl> <dt>**DIGEST\_SIGN\_EX\_WITHFILEHANDLE**</dt> <dt>4 (0x4)</dt> </dl>                           |Use the DIGEST_SIGN_EX_WITHFILEHANDLE implementation.<br/> |
     */
    dwDigestSignChoice : UInt32

    pfnAuthenticodeDigestSign : IntPtr

    /**
     * Optional pointer to [**CRYPT_DATA_BLOB**](/windows/win32/api/wincrypt/ns-wincrypt-crypt_integer_blob) specifying metadata.
     */
    pMetadataBlob : CRYPT_INTEGER_BLOB.Ptr

    /**
     * Reserved. This value must be zero (0).
     */
    dwReserved : UInt32

    /**
     * Reserved. This value must be zero (0).
     */
    dwReserved2 : UInt32

    /**
     * Reserved. This value must be zero (0).
     */
    dwReserved3 : UInt32

    static __New() {
        DefineProp(this.Prototype, 'pfnAuthenticodeDigestSignWithFileHandle', { type: IntPtr, offset: 8 })
        DefineProp(this.Prototype, 'pfnAuthenticodeDigestSignEx', { type: IntPtr, offset: 8 })
        DefineProp(this.Prototype, 'pfnAuthenticodeDigestSignExWithFileHandle', { type: IntPtr, offset: 8 })
        this.DeleteProp("__New")
    }
}

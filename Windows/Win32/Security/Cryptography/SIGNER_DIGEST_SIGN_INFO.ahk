#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * contains information about digest signing.
 * @see https://learn.microsoft.com/windows/win32/SecCrypto/signer-digest-sign-info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class SIGNER_DIGEST_SIGN_INFO extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * The size, in bytes, of the structure.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

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
     * @type {Integer}
     */
    dwDigestSignChoice {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Pointer<PFN_AUTHENTICODE_DIGEST_SIGN>}
     */
    pfnAuthenticodeDigestSign {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<PFN_AUTHENTICODE_DIGEST_SIGN_WITHFILEHANDLE>}
     */
    pfnAuthenticodeDigestSignWithFileHandle {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<PFN_AUTHENTICODE_DIGEST_SIGN_EX>}
     */
    pfnAuthenticodeDigestSignEx {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<PFN_AUTHENTICODE_DIGEST_SIGN_EX_WITHFILEHANDLE>}
     */
    pfnAuthenticodeDigestSignExWithFileHandle {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Optional pointer to [**CRYPT_DATA_BLOB**](/windows/win32/api/wincrypt/ns-wincrypt-crypt_integer_blob) specifying metadata.
     * @type {Pointer<CRYPT_INTEGER_BLOB>}
     */
    pMetadataBlob {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Reserved. This value must be zero (0).
     * @type {Integer}
     */
    dwReserved {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Reserved. This value must be zero (0).
     * @type {Integer}
     */
    dwReserved2 {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Reserved. This value must be zero (0).
     * @type {Integer}
     */
    dwReserved3 {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 40
    }
}

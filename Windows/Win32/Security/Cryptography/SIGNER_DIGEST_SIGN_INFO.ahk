#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class SIGNER_DIGEST_SIGN_INFO extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
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
     * @type {Pointer<CRYPT_INTEGER_BLOB>}
     */
    pMetadataBlob {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    dwReserved {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    dwReserved2 {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
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

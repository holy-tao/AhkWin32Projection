#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * contains information about digest signing.
 * @see https://learn.microsoft.com/windows/win32/SecCrypto/signer-digest-sign-info-v2
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class SIGNER_DIGEST_SIGN_INFO_V2 extends Win32Struct
{
    static sizeof => 32

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
     * Pointer to the [**PFN_AUTHENTICODE_DIGEST_SIGN**](pfn-authenticode-digest-sign.md) callback function. Required if the caller of SignerSignEx3 specifies SPC_DIGEST_SIGN_FLAG in the dwFlags parameter.
     * @type {Pointer<Ptr>}
     */
    pfnAuthenticodeDigestSign {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Pointer to the [**PFN_AUTHENTICODE_DIGEST_SIGN_EX**](pfn-authenticode-digest-sign-ex.md) callback function. Required if the caller of SignerSignEx3 specifies SPC_DIGEST_SIGN_EX_FLAG in the dwFlags parameter.
     * @type {Pointer<Ptr>}
     */
    pfnAuthenticodeDigestSignEx {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Optional pointer to [**CRYPT_DATA_BLOB**](/windows/win32/api/wincrypt/ns-wincrypt-crypt_integer_blob) specifying metadata.
     * @type {Pointer<CRYPT_INTEGER_BLOB>}
     */
    pMetadataBlob {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 32
    }
}

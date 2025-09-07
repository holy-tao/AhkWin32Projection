#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about a digital signature.
 * @see https://learn.microsoft.com/windows/win32/SecCrypto/signer-signature-info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class SIGNER_SIGNATURE_INFO extends Win32Struct
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
     * The hash algorithm used for the digital signature.
     * @type {Integer}
     */
    algidHash {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Specifies whether the signature has [*Authenticode*](../secgloss/a-gly.md) attributes. This member can be one or more of the following values.
     * 
     * 
     * 
     * | Value                                                                                                                                                                                                                                      | Meaning                                                                                                                                   |
     * |--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------|
     * | <span id="SIGNER_AUTHCODE_ATTR"></span><span id="signer_authcode_attr"></span><dl> <dt>**SIGNER\_AUTHCODE\_ATTR**</dt> <dt>1</dt> </dl> | The signature has [*Authenticode*](../secgloss/a-gly.md) attributes.<br/>           |
     * | <span id="SIGNER_NO_ATTR"></span><span id="signer_no_attr"></span><dl> <dt>**SIGNER\_NO\_ATTR**</dt> <dt>0</dt> </dl>                   | The signature does not have [*Authenticode*](../secgloss/a-gly.md) attributes.<br/> |
     * @type {Integer}
     */
    dwAttrChoice {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    Anonymous {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Authenticated user-supplied attributes added to the digital signature.
     * @type {Pointer<CRYPT_ATTRIBUTES>}
     */
    psAuthenticated {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Unauthenticated user-supplied attributes added to the digital signature.
     * @type {Pointer<CRYPT_ATTRIBUTES>}
     */
    psUnauthenticated {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 40
    }
}

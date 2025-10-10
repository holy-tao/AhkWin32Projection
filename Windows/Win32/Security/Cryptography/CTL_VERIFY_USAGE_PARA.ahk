#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CRYPT_INTEGER_BLOB.ahk

/**
 * The CTL_VERIFY_USAGE_PARA structure contains parameters used by CertVerifyCTLUsage to establish the validity of a CTL's usage.
 * @see https://docs.microsoft.com/windows/win32/api//wincrypt/ns-wincrypt-ctl_verify_usage_para
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CTL_VERIFY_USAGE_PARA extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * Size of this structure in bytes.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/SecGloss/b-gly">BLOB</a> that specifies a <b>ListIdentifier</b> of a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">CTL</a> to be found or verified. Normally the <b>cbData</b> member of the <b>ListIdentifier</b> BLOB will be zero, indicating that a CTL with any <b>ListIdentifier</b> can be a match.
     * 
     * To match only CTLs with no <b>ListIdentifier</b>, the <b>cbData</b> member of the <b>ListIdentifier</b> BLOB is set to CTL_FIND_NO_LIST_ID_CBDATA.
     * 
     * If an issuer creates multiple CTLs for the same <b>SubjectUsage</b>, a <b>ListIdentifier</b> can distinguish among them.
     * @type {CRYPT_INTEGER_BLOB}
     */
    ListIdentifier{
        get {
            if(!this.HasProp("__ListIdentifier"))
                this.__ListIdentifier := CRYPT_INTEGER_BLOB(this.ptr + 8)
            return this.__ListIdentifier
        }
    }

    /**
     * The count of stores to be searched for a matching CTL.
     * @type {Integer}
     */
    cCtlStore {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Array of handles of stores to be searched to find a matching CTL.
     * @type {Pointer<Void>}
     */
    rghCtlStore {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Count of stores to be searched for acceptable CTL signers.
     * @type {Integer}
     */
    cSignerStore {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Array of handles of stores to be searched for acceptable CTL signers.
     * @type {Pointer<Void>}
     */
    rghSignerStore {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 56
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CTL_USAGE.ahk
#Include .\CRYPT_INTEGER_BLOB.ahk

/**
 * A member of the CTL_FIND_SUBJECT_PARA structure and it is used by CertFindCTLInStore.
 * @see https://docs.microsoft.com/windows/win32/api//wincrypt/ns-wincrypt-ctl_find_usage_para
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CTL_FIND_USAGE_PARA extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * The size, in bytes, of this structure.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-ctl_usage">CTL_USAGE</a> structure that includes a sequence of object identifiers to be matched when finding a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certificate trust list</a> (CTL). 
     * 
     * 
     * 
     * 
     * A found CTL must contain all the usage object identifiers specified by the <b>SubjectUsage</b> member.
     * 
     * If the <b>cUsageIdentifier</b> member of this structure is zero, a CTL with any usage can be a match.
     * @type {CTL_USAGE}
     */
    SubjectUsage{
        get {
            if(!this.HasProp("__SubjectUsage"))
                this.__SubjectUsage := CTL_USAGE(this.ptr + 8)
            return this.__SubjectUsage
        }
    }

    /**
     * Specified to restrict a search to a particular signer CTL list. Normally the <b>ListIdentifier</b> member will be zero, indicating that any <b>ListIdentifier</b> can be matched. If it is not zero, this <b>ListIdentifier</b> and the <b>ListIdentifier</b> in a CTL must match. 
     * 
     * 
     * 
     * 
     * To match only CTLs that have no <b>ListIdentifier</b> the <b>cbData</b> member of <b>ListIdentifier</b> is set to CTL_FIND_NO_LIST_ID_CBDATA.
     * 
     * A CTL uses a <b>ListIdentifier</b> to distinguish among multiple CTLs created by the same issuer with the same <b>SubjectUsage</b>.
     * @type {CRYPT_INTEGER_BLOB}
     */
    ListIdentifier{
        get {
            if(!this.HasProp("__ListIdentifier"))
                this.__ListIdentifier := CRYPT_INTEGER_BLOB(this.ptr + 24)
            return this.__ListIdentifier
        }
    }

    /**
     * A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_info">CERT_INFO</a> structure that specifies the CTL signer to be matched. Only the issuer and serial number from the <b>CERT_INFO</b> are used to match a signer. 
     * 
     * 
     * 
     * 
     * Set <b>pSigner</b> to <b>NULL</b> to match any signer. To match CTLs that do not have any signers, set <b>pSigner</b> to CTL_FIND_NO_SIGNER_PTR.
     * 
     * The CertEncodingType of the signer is obtained from the <i>dwMsgAndCertEncodingType</i> parameter of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certfindctlinstore">CertFindCTLInStore</a>.
     * @type {Pointer<CERT_INFO>}
     */
    pSigner {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 48
    }
}

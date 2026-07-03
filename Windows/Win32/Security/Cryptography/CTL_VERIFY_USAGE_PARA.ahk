#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }
#Import ".\HCERTSTORE.ahk" { HCERTSTORE }

/**
 * The CTL_VERIFY_USAGE_PARA structure contains parameters used by CertVerifyCTLUsage to establish the validity of a CTL's usage.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-ctl_verify_usage_para
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CTL_VERIFY_USAGE_PARA {
    #StructPack 8

    /**
     * Size of this structure in bytes.
     */
    cbSize : UInt32 := this.Size

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/SecGloss/b-gly">BLOB</a> that specifies a <b>ListIdentifier</b> of a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">CTL</a> to be found or verified. Normally the <b>cbData</b> member of the <b>ListIdentifier</b> BLOB will be zero, indicating that a CTL with any <b>ListIdentifier</b> can be a match.
     * 
     * To match only CTLs with no <b>ListIdentifier</b>, the <b>cbData</b> member of the <b>ListIdentifier</b> BLOB is set to CTL_FIND_NO_LIST_ID_CBDATA.
     * 
     * If an issuer creates multiple CTLs for the same <b>SubjectUsage</b>, a <b>ListIdentifier</b> can distinguish among them.
     */
    ListIdentifier : CRYPT_INTEGER_BLOB

    /**
     * The count of stores to be searched for a matching CTL.
     */
    cCtlStore : UInt32

    /**
     * Array of handles of stores to be searched to find a matching CTL.
     */
    rghCtlStore : HCERTSTORE.Ptr

    /**
     * Count of stores to be searched for acceptable CTL signers.
     */
    cSignerStore : UInt32

    /**
     * Array of handles of stores to be searched for acceptable CTL signers.
     */
    rghSignerStore : HCERTSTORE.Ptr

}

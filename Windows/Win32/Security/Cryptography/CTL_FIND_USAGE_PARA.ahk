#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CTL_USAGE.ahk" { CTL_USAGE }
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }
#Import ".\CERT_INFO.ahk" { CERT_INFO }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * A member of the CTL_FIND_SUBJECT_PARA structure and it is used by CertFindCTLInStore.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-ctl_find_usage_para
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CTL_FIND_USAGE_PARA {
    #StructPack 8

    /**
     * The size, in bytes, of this structure.
     */
    cbSize : UInt32 := this.Size

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-ctl_usage">CTL_USAGE</a> structure that includes a sequence of object identifiers to be matched when finding a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certificate trust list</a> (CTL). 
     * 
     * 
     * 
     * 
     * A found CTL must contain all the usage object identifiers specified by the <b>SubjectUsage</b> member.
     * 
     * If the <b>cUsageIdentifier</b> member of this structure is zero, a CTL with any usage can be a match.
     */
    SubjectUsage : CTL_USAGE

    /**
     * Specified to restrict a search to a particular signer CTL list. Normally the <b>ListIdentifier</b> member will be zero, indicating that any <b>ListIdentifier</b> can be matched. If it is not zero, this <b>ListIdentifier</b> and the <b>ListIdentifier</b> in a CTL must match. 
     * 
     * 
     * 
     * 
     * To match only CTLs that have no <b>ListIdentifier</b> the <b>cbData</b> member of <b>ListIdentifier</b> is set to CTL_FIND_NO_LIST_ID_CBDATA.
     * 
     * A CTL uses a <b>ListIdentifier</b> to distinguish among multiple CTLs created by the same issuer with the same <b>SubjectUsage</b>.
     */
    ListIdentifier : CRYPT_INTEGER_BLOB

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
     */
    pSigner : CERT_INFO.Ptr

}

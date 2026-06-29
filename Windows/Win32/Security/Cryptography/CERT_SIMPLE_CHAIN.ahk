#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CERT_TRUST_STATUS.ahk" { CERT_TRUST_STATUS }
#Import ".\CERT_CHAIN_ELEMENT.ahk" { CERT_CHAIN_ELEMENT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\CERT_TRUST_LIST_INFO.ahk" { CERT_TRUST_LIST_INFO }

/**
 * The CERT_SIMPLE_CHAIN structure contains an array of chain elements and a summary trust status for the chain that the array represents.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_simple_chain
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CERT_SIMPLE_CHAIN {
    #StructPack 8

    /**
     * The size, in bytes, of this structure.
     */
    cbSize : UInt32 := this.Size

    /**
     * A structure that indicates the trust status of the whole chain. The structure includes an error status code and an information status code. For information about status code values, see <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_trust_status">CERT_TRUST_STATUS</a>.
     */
    TrustStatus : CERT_TRUST_STATUS

    /**
     * The number of <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_chain_element">CERT_CHAIN_ELEMENT</a> structures in the array.
     */
    cElement : UInt32

    /**
     * An array of pointers to <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_chain_element">CERT_CHAIN_ELEMENT</a> structures. <b>rgpElement</b>[0] is the end certificate chain element. <b>rgpElement</b>[<b>cElement</b>–1] is the self-signed "root" certificate element.
     */
    rgpElement : IntPtr

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_trust_list_info">CERT_TRUST_LIST_INFO</a> structure that contains a pointer to a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certificate trust list</a> (CTL) connecting this chain to a next certificate chain. If the current chain is the final chain, <b>pTrustListInfo</b> is <b>NULL</b>.
     */
    pTrustListInfo : CERT_TRUST_LIST_INFO.Ptr

    /**
     * BOOL. If <b>TRUE</b>, <b>dwRevocationFreshnessTime</b> has been calculated.
     */
    fHasRevocationFreshnessTime : BOOL

    /**
     * The age of a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certificate revocation list</a> 
     * (CRL) in seconds, calculated as the CurrentTime minus the CRL's ThisUpdate time. This values is the largest time across all elements checked.
     */
    dwRevocationFreshnessTime : UInt32

}

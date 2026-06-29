#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CERT_SIMPLE_CHAIN.ahk" { CERT_SIMPLE_CHAIN }
#Import ".\CERT_TRUST_STATUS.ahk" { CERT_TRUST_STATUS }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Contains an array of simple certificate chains and a trust status structure that indicates summary validity data on all of the connected simple chains.
 * @remarks
 * When a <b>CERT_CHAIN_CONTEXT</b> is built, the first simple chain begins with an end certificate and ends with a self-signed certificate. If that self-signed certificate is not a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/r-gly">root</a> or otherwise trusted certificate, an attempt is made to build a new chain. <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">CTLs</a> are used to create the new chain beginning with the self-signed certificate from the original chain as the end certificate of the new chain. This process continues building additional simple chains until the first self-signed certificate is a trusted certificate or until an additional simple chain cannot be built.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_chain_context
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CERT_CHAIN_CONTEXT {
    #StructPack 8

    /**
     * The size, in bytes, of this structure.
     */
    cbSize : UInt32 := this.Size

    /**
     * A structure that indicates the combined trust status of the simple chains array. The structure includes an error status code and an information status code. For information about status code values, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_trust_status">CERT_TRUST_STATUS</a>.
     */
    TrustStatus : CERT_TRUST_STATUS

    /**
     * The number of simple chains in the array.
     */
    cChain : UInt32

    /**
     * An array of pointers to simple chain structures. <b>rgpChain</b>[0] is the end certificate simple chain, and <b>rgpChain</b>[<b>cChain</b>–1] is the final chain. If the end certificate is to be considered valid, the final chain must begin with a certificate contained in the root store or an otherwise trusted, self-signed certificate. If the original chain begins with a trusted certificate, there will be only a single simple chain in the array.
     */
    rgpChain : IntPtr

    /**
     * The number of chains in the  <b>rgpLowerQualityChainContext</b> array.
     */
    cLowerQualityChainContext : UInt32

    /**
     * An array of pointers to CERT_CHAIN_CONTEXT structures. Returned when CERT_CHAIN_RETURN_LOWER_QUALITY_CONTEXTS is set in dwFlags.
     */
    rgpLowerQualityChainContext : IntPtr

    /**
     * A Boolean value set to <b>TRUE</b> if <b>dwRevocationFreshnessTime</b> is available.
     */
    fHasRevocationFreshnessTime : BOOL

    /**
     * The largest CurrentTime, in seconds, minus the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certificate revocation list's</a> (CRL's) ThisUpdate of all elements checked.
     */
    dwRevocationFreshnessTime : UInt32

    dwCreateFlags : UInt32

    ChainId : Guid

}

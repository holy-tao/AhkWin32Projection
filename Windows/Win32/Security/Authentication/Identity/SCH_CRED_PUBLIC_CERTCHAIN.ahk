#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The SCH_CRED_PUBLIC_CERTCHAIN structure contains a single certificate. A certification chain can be built from this certificate.
 * @remarks
 * This structure does not directly support certificate chains. If a server needs to use certificate chains, the intermediate certificates can be placed in the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certification authority's</a> (CA) <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certificate store</a> and Schannel will automatically pick them up from there.
 * @see https://learn.microsoft.com/windows/win32/api/schannel/ns-schannel-sch_cred_public_certchain
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SCH_CRED_PUBLIC_CERTCHAIN {
    #StructPack 8

    /**
     * Must always be set to SCH_CRED_X509_CERTCHAIN.
     */
    dwType : UInt32

    /**
     * Size of the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/x-gly">X.509</a> certificate, in bytes.
     */
    cbCertChain : UInt32

    /**
     * Pointer to an X.509 leaf certificate.
     */
    pCertChain : IntPtr

}

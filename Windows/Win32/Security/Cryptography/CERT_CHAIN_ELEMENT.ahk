#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CTL_USAGE.ahk" { CTL_USAGE }
#Import ".\CERT_CONTEXT.ahk" { CERT_CONTEXT }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\CERT_TRUST_STATUS.ahk" { CERT_TRUST_STATUS }
#Import ".\CERT_REVOCATION_INFO.ahk" { CERT_REVOCATION_INFO }

/**
 * The CERT_CHAIN_ELEMENT structure is a single element in a simple certificate chain.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_chain_element
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CERT_CHAIN_ELEMENT {
    #StructPack 8

    /**
     * Size of this structure in bytes.
     */
    cbSize : UInt32 := this.Size

    /**
     * A pointer to a certificate <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">context</a>.
     */
    pCertContext : CERT_CONTEXT.Ptr

    /**
     * Structure indicating the status of the certificate. The structure includes an error status code and an information status code. For information about status code values, see CERT_TRUST_STATUS.
     */
    TrustStatus : CERT_TRUST_STATUS

    /**
     * A pointer to a CERT_REVOCATION_INFO structure with information on the revocation status of the certificate. If revocation checking was not enabled, <b>pRevocationInfo</b> is <b>NULL</b>.
     */
    pRevocationInfo : CERT_REVOCATION_INFO.Ptr

    /**
     * A pointer to a CERT_ENHKEY_USAGE structure. If <b>NULL</b>, any issuance policy is acceptable.
     */
    pIssuanceUsage : CTL_USAGE.Ptr

    /**
     * A pointer to a CERT_ENHKEY_USAGE structure. If <b>NULL</b>, any enhanced key usage is acceptable.
     */
    pApplicationUsage : CTL_USAGE.Ptr

    /**
     * A pointer to a <b>null</b>-terminated wide character string that contains extended error information. If <b>NULL</b>, there is no extended error information.
     */
    pwszExtendedErrorInfo : PWSTR

}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CERT_CONTEXT.ahk" { CERT_CONTEXT }
#Import ".\CRL_CONTEXT.ahk" { CRL_CONTEXT }

/**
 * The CERT_CRL_CONTEXT_PAIR structure contains a certificate context and an associated CRL context.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_crl_context_pair
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CERT_CRL_CONTEXT_PAIR {
    #StructPack 8

    /**
     * A pointer to a certificate context.
     */
    pCertContext : CERT_CONTEXT.Ptr

    /**
     * A pointer to the certificate revocation list context.
     */
    pCrlContext : CRL_CONTEXT.Ptr

}

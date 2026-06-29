#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CERT_CONTEXT.ahk" { CERT_CONTEXT }

/**
 * Contains the certificate contexts of both a subject and a certificate issuer.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-crl_find_issued_for_para
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRL_FIND_ISSUED_FOR_PARA {
    #StructPack 8

    /**
     * A pointer to a subject's certificate context.
     */
    pSubjectCert : CERT_CONTEXT.Ptr

    /**
     * A pointer to a certificate issuer's certificate context.
     */
    pIssuerCert : CERT_CONTEXT.Ptr

}

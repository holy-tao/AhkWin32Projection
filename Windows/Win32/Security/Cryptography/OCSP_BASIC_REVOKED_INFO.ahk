#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CERT_REVOCATION_STATUS_REASON.ahk" { CERT_REVOCATION_STATUS_REASON }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }

/**
 * Contains the reason a certificate was revoked.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-ocsp_basic_revoked_info
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct OCSP_BASIC_REVOKED_INFO {
    #StructPack 4

    /**
     * Date that the certificate was revoked. For more information, see the <b>RevocationDate</b> member description for <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crl_entry">CRL_ENTRY</a>.
     */
    RevocationDate : FILETIME

    dwCrlReasonCode : CERT_REVOCATION_STATUS_REASON

}

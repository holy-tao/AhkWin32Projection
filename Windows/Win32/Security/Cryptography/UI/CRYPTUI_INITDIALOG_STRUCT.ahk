#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\CERT_CONTEXT.ahk" { CERT_CONTEXT }
#Import "..\..\..\Foundation\LPARAM.ahk" { LPARAM }

/**
 * Supports the CRYPTUI_VIEWCERTIFICATE_STRUCT structure.
 * @see https://learn.microsoft.com/windows/win32/api/cryptuiapi/ns-cryptuiapi-cryptui_initdialog_struct
 * @namespace Windows.Win32.Security.Cryptography.UI
 */
export default struct CRYPTUI_INITDIALOG_STRUCT {
    #StructPack 8

    /**
     * The <b>lParam</b> in the <a href="https://docs.microsoft.com/windows/desktop/api/prsht/ns-prsht-propsheetpagea_v2">PROPSHEETPAGE</a> structure.
     */
    lParam : LPARAM

    /**
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_context">CERT_CONTEXT</a> structure for the certificate that <a href="https://docs.microsoft.com/windows/desktop/api/cryptuiapi/nf-cryptuiapi-cryptuidlgviewcertificatea">CryptUIDlgViewCertificate</a> is displaying.
     */
    pCertContext : CERT_CONTEXT.Ptr

}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Contains information about a certificate manager dialog box.
 * @see https://learn.microsoft.com/windows/win32/api/cryptuiapi/ns-cryptuiapi-cryptui_cert_mgr_struct
 * @namespace Windows.Win32.Security.Cryptography.UI
 */
export default struct CRYPTUI_CERT_MGR_STRUCT {
    #StructPack 8

    /**
     * The size, in bytes, of the structure. This value must be set to <c>sizeof(CRYPTUI_CERT_MGR_STRUCT)</c>.
     */
    dwSize : UInt32

    /**
     * Handle of the parent window of the dialog box.
     */
    hwndParent : HWND

    /**
     * Reserved. This value must be set to zero.
     */
    dwFlags : UInt32

    /**
     * Title of the dialog box.
     */
    pwszTitle : PWSTR

    /**
     * Enhanced key usage <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">object identifier</a> (OID) of the certificates that will initially appear in the dialog box. The default value is <b>NULL</b>, which displays all certificates.
     */
    pszInitUsageOID : PSTR

}

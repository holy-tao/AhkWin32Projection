#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\WinTrust\CRYPT_PROVIDER_DATA.ahk" { CRYPT_PROVIDER_DATA }
#Import ".\CRYPTUI_VIEWCERTIFICATE_FLAGS.ahk" { CRYPTUI_VIEWCERTIFICATE_FLAGS }
#Import "..\..\..\UI\Controls\PROPSHEETPAGEW.ahk" { PROPSHEETPAGEW }
#Import "..\..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\HCERTSTORE.ahk" { HCERTSTORE }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\Foundation\PSTR.ahk" { PSTR }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\CERT_CONTEXT.ahk" { CERT_CONTEXT }

/**
 * Contains information about a certificate to view. This structure is used in the CryptUIDlgViewCertificate function. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The cryptuiapi.h header defines CRYPTUI_VIEWCERTIFICATE_STRUCT as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/cryptuiapi/ns-cryptuiapi-cryptui_viewcertificate_structw
 * @namespace Windows.Win32.Security.Cryptography.UI
 * @charset Unicode
 */
export default struct CRYPTUI_VIEWCERTIFICATE_STRUCTW {
    #StructPack 8

    /**
     * The size, in bytes, of the <b>CRYPTUI_VIEWCERTIFICATE_STRUCT</b> structure.
     */
    dwSize : UInt32

    /**
     * A handle to the window that is the parent of the dialog box produced by <a href="https://docs.microsoft.com/windows/desktop/api/cryptuiapi/nf-cryptuiapi-cryptuidlgviewcertificatea">CryptUIDlgViewCertificate</a>.
     */
    hwndParent : HWND

    dwFlags : CRYPTUI_VIEWCERTIFICATE_FLAGS

    /**
     * A pointer to a null-terminated string that contains the title for the window.
     */
    szTitle : PWSTR

    /**
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_context">CERT_CONTEXT</a> structure that contains the certificate context to display.
     */
    pCertContext : CERT_CONTEXT.Ptr

    /**
     * An array of pointers to null-terminated strings that contain the purposes for which this certificate will be validated.
     */
    rgszPurposes : PSTR.Ptr

    /**
     * The number of purposes in the <b>rgszPurposes</b> array.
     */
    cPurposes : UInt32

    pCryptProviderData : CRYPT_PROVIDER_DATA.Ptr

    /**
     * If <a href="https://docs.microsoft.com/windows/desktop/api/wintrust/nf-wintrust-winverifytrust">WinVerifyTrust</a> was called, this is the result of whether the certificate was trusted.
     */
    fpCryptProviderDataTrustedUsage : BOOL

    /**
     * The index of the signer to view.
     */
    idxSigner : UInt32

    /**
     * The index of the certificate that is being viewed within the signer chain.  The certificate context of this cert must match <b>pCertContext</b>.
     */
    idxCert : UInt32

    /**
     * <b>TRUE</b> if a countersignature is being viewed.  If  this is <b>TRUE</b>, <b>idxCounterSigner</b> must be valid.
     */
    fCounterSigner : BOOL

    /**
     * The index of the countersigner to view.
     */
    idxCounterSigner : UInt32

    /**
     * The number of other stores in the  <b>rghStores</b> array of certificate stores to search when building and validating the certificate chain.
     */
    cStores : UInt32

    /**
     * An array of <b>HCERTSTORE</b> handles to other certificate stores to search when building and validating the certificate chain.
     */
    rghStores : HCERTSTORE.Ptr

    /**
     * The number of property pages to add to the dialog box.
     */
    cPropSheetPages : UInt32

    /**
     * An array of property pages to add to the dialog box.                        Each page in this array will not receive the <b>lParam</b> in the <a href="https://docs.microsoft.com/windows/desktop/api/prsht/ns-prsht-propsheetpagea_v2">PROPSHEETPAGE</a> structure as the <b>lParam</b> in the <a href="https://docs.microsoft.com/windows/desktop/dlgbox/wm-initdialog">WM_INITDIALOG</a> message. It will instead receive a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/cryptuiapi/ns-cryptuiapi-cryptui_initdialog_struct">CRYPTUI_INITDIALOG_STRUCT</a>  structure. It contains the <b>lParam</b> in  <b>PROPSHEETPAGE</b> and the pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_context">CERT_CONTEXT</a> for which the page is being displayed.
     */
    rgPropSheetPages : PROPSHEETPAGEW.Ptr

    /**
     * The index of the initial page that will be displayed.  If the highest bit (0x8000) is set, the index is assumed to index <b>rgPropSheetPages</b> (after the highest bit has been stripped off, for example, 0x8000 will indicate the first page in <b>rgPropSheetPages</b>).  If the highest bit is zero,  <b>nStartPage</b> will be the starting index of the default certificate dialog box property pages.
     */
    nStartPage : UInt32

    static __New() {
        DefineProp(this.Prototype, 'hWVTStateData', { type: HANDLE, offset: 56 })
        this.DeleteProp("__New")
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\HWND.ahk
#Include ..\..\..\Foundation\PSTR.ahk
#Include ..\..\..\Foundation\HANDLE.ahk
#Include ..\..\..\Foundation\BOOL.ahk

/**
 * Contains information about a certificate to view. This structure is used in the CryptUIDlgViewCertificate function.
 * @remarks
 * 
  * > [!NOTE]
  * > The cryptuiapi.h header defines CRYPTUI_VIEWCERTIFICATE_STRUCT as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
  * 
 * @see https://docs.microsoft.com/windows/win32/api//cryptuiapi/ns-cryptuiapi-cryptui_viewcertificate_structa
 * @namespace Windows.Win32.Security.Cryptography.UI
 * @version v4.0.30319
 * @charset ANSI
 */
class CRYPTUI_VIEWCERTIFICATE_STRUCTA extends Win32Struct
{
    static sizeof => 120

    static packingSize => 8

    /**
     * The size, in bytes, of the <b>CRYPTUI_VIEWCERTIFICATE_STRUCT</b> structure.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A handle to the window that is the parent of the dialog box produced by <a href="https://docs.microsoft.com/windows/desktop/api/cryptuiapi/nf-cryptuiapi-cryptuidlgviewcertificatea">CryptUIDlgViewCertificate</a>.
     * @type {HWND}
     */
    hwndParent{
        get {
            if(!this.HasProp("__hwndParent"))
                this.__hwndParent := HWND(this.ptr + 8)
            return this.__hwndParent
        }
    }

    /**
     * 
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * A pointer to a null-terminated string that contains the title for the window.
     * @type {PSTR}
     */
    szTitle{
        get {
            if(!this.HasProp("__szTitle"))
                this.__szTitle := PSTR(this.ptr + 24)
            return this.__szTitle
        }
    }

    /**
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_context">CERT_CONTEXT</a> structure that contains the certificate context to display.
     * @type {Pointer<CERT_CONTEXT>}
     */
    pCertContext {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * An array of pointers to null-terminated strings that contain the purposes for which this certificate will be validated.
     * @type {Pointer<PSTR>}
     */
    rgszPurposes {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * The number of purposes in the <b>rgszPurposes</b> array.
     * @type {Integer}
     */
    cPurposes {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Pointer<CRYPT_PROVIDER_DATA>}
     */
    pCryptProviderData {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {HANDLE}
     */
    hWVTStateData{
        get {
            if(!this.HasProp("__hWVTStateData"))
                this.__hWVTStateData := HANDLE(this.ptr + 56)
            return this.__hWVTStateData
        }
    }

    /**
     * If <a href="https://docs.microsoft.com/windows/desktop/api/wintrust/nf-wintrust-winverifytrust">WinVerifyTrust</a> was called, this is the result of whether the certificate was trusted.
     * @type {BOOL}
     */
    fpCryptProviderDataTrustedUsage{
        get {
            if(!this.HasProp("__fpCryptProviderDataTrustedUsage"))
                this.__fpCryptProviderDataTrustedUsage := BOOL(this.ptr + 64)
            return this.__fpCryptProviderDataTrustedUsage
        }
    }

    /**
     * The index of the signer to view.
     * @type {Integer}
     */
    idxSigner {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * The index of the certificate that is being viewed within the signer chain.  The certificate context of this cert must match <b>pCertContext</b>.
     * @type {Integer}
     */
    idxCert {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * <b>TRUE</b> if a countersignature is being viewed.  If  this is <b>TRUE</b>, <b>idxCounterSigner</b> must be valid.
     * @type {BOOL}
     */
    fCounterSigner{
        get {
            if(!this.HasProp("__fCounterSigner"))
                this.__fCounterSigner := BOOL(this.ptr + 76)
            return this.__fCounterSigner
        }
    }

    /**
     * The index of the countersigner to view.
     * @type {Integer}
     */
    idxCounterSigner {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * The number of other stores in the  <b>rghStores</b> array of certificate stores to search when building and validating the certificate chain.
     * @type {Integer}
     */
    cStores {
        get => NumGet(this, 84, "uint")
        set => NumPut("uint", value, this, 84)
    }

    /**
     * An array of <b>HCERTSTORE</b> handles to other certificate stores to search when building and validating the certificate chain.
     * @type {Pointer<HCERTSTORE>}
     */
    rghStores {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * The number of property pages to add to the dialog box.
     * @type {Integer}
     */
    cPropSheetPages {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * An array of property pages to add to the dialog box.                        Each page in this array will not receive the <b>lParam</b> in the <a href="https://docs.microsoft.com/windows/desktop/api/prsht/ns-prsht-propsheetpagea_v2">PROPSHEETPAGE</a> structure as the <b>lParam</b> in the <a href="https://docs.microsoft.com/windows/desktop/dlgbox/wm-initdialog">WM_INITDIALOG</a> message. It will instead receive a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/cryptuiapi/ns-cryptuiapi-cryptui_initdialog_struct">CRYPTUI_INITDIALOG_STRUCT</a>  structure. It contains the <b>lParam</b> in  <b>PROPSHEETPAGE</b> and the pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_context">CERT_CONTEXT</a> for which the page is being displayed.
     * @type {Pointer<PROPSHEETPAGEA>}
     */
    rgPropSheetPages {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }

    /**
     * The index of the initial page that will be displayed.  If the highest bit (0x8000) is set, the index is assumed to index <b>rgPropSheetPages</b> (after the highest bit has been stripped off, for example, 0x8000 will indicate the first page in <b>rgPropSheetPages</b>).  If the highest bit is zero,  <b>nStartPage</b> will be the starting index of the default certificate dialog box property pages.
     * @type {Integer}
     */
    nStartPage {
        get => NumGet(this, 112, "uint")
        set => NumPut("uint", value, this, 112)
    }
}

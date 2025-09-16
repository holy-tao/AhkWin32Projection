#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains criteria upon which to select certificates that are presented in a certificate selection dialog box. This structure is used in the CertSelectCertificate function. (Unicode)
 * @remarks
 * > [!NOTE]
  * > The cryptdlg.h header defines CERT_SELECT_STRUCT as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/cryptdlg/ns-cryptdlg-cert_select_struct_w
 * @namespace Windows.Win32.Security.Cryptography.UI
 * @version v4.0.30319
 * @charset Unicode
 */
class CERT_SELECT_STRUCT_W extends Win32Struct
{
    static sizeof => 136

    static packingSize => 8

    /**
     * The size, in bytes, of this structure.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A handle to the parent window of any dialog boxes that 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/cryptdlg/nf-cryptdlg-certselectcertificatea">CertSelectCertificate</a> generates.
     * @type {Pointer<HWND>}
     */
    hwndParent {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A handle to the module whose executable file contains the dialog box template.
     * @type {Pointer<HINSTANCE>}
     */
    hInstance {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * If the <b>CSS_ENABLETEMPLATE</b> flag is set in the <b>dwFlags</b> 
     *       member, set <b>pTemplateName</b> to a pointer to a global memory object that contains the 
     *       template that <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-dialogboxindirectparama">DialogBoxIndirectParam</a> 
     *       uses to create the dialog box. A dialog box template consists of a header that describes the dialog box. The 
     *       header is followed by one or more additional blocks of data that describe each of the controls in the dialog 
     *       box. The template can use either the standard format or the extended format.
     *       
     * 
     * If the <b>CSS_ENABLETEMPLATEHANDLE</b> flag is set in <b>dwFlags</b>, 
     *        <b>pTemplateName</b> specifies the dialog box template. 
     *        <b>pTemplateName</b> is either the pointer to a null-terminated character string that 
     *        specifies the name of the dialog box template or an integer value that specifies the resource identifier of the 
     *        dialog box template. If the  specifies a resource identifier, its high-order word must be zero and its 
     *        low-order word must contain the identifier. One way to create this integer value is to use the 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-makeintresourcea">MAKEINTRESOURCE</a> macro.
     * @type {Pointer<PWSTR>}
     */
    pTemplateName {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * 
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * A pointer to a string that contains the text for the title of the dialog box.
     * @type {Pointer<PWSTR>}
     */
    szTitle {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * The number of elements in <b>arrayCertStore</b> array.
     * @type {Integer}
     */
    cCertStore {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * A pointer to the array of certificate stores that the dialog box enumerates and displays the certificates 
     *       from. The <b>cCertStore</b> member contains the number of elements in this array.
     * @type {Pointer<HCERTSTORE>}
     */
    arrayCertStore {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * A pointer to a string representation of an object identifier (OID) for an enhanced key usage (EKU). If an 
     *       OID is provided, only certificates that include this EKU will be displayed.
     * @type {Pointer<PSTR>}
     */
    szPurposeOid {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * The number of elements in the <b>arrayCertContext</b> array. After the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/cryptdlg/nf-cryptdlg-certselectcertificatea">CertSelectCertificate</a> function returns, 
     *       this member contains the number of certificates that were selected by the user. Currently, only one certificate 
     *       can be selected by the user.
     * @type {Integer}
     */
    cCertContext {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_context">CERT_CONTEXT</a> 
     *      structures. The <b>cCertContext</b> member specifies the number of elements in this array. 
     *      This array must contain at least one element.
     *      
     * 
     * The certificates represented by these structures are selected when the dialog box displayed by the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/cryptdlg/nf-cryptdlg-certselectcertificatea">CertSelectCertificate</a> function is 
     *       initially displayed.  Currently, only the first certificate in this array is used. The first certificate in this 
     *       array will be released with the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certfreecertificatecontext">CertFreeCertificateContext</a> function 
     *       if the <b>CertSelectCertificate</b> function is 
     *       successful. If the first element in this array is <b>NULL</b>, no certificates are initially 
     *       selected in the dialog box.
     * 
     * After the <a href="https://docs.microsoft.com/windows/desktop/api/cryptdlg/nf-cryptdlg-certselectcertificatea">CertSelectCertificate</a> function 
     *       returns, this array contains the certificates that were selected by the user. Currently, only one certificate 
     *       can be selected by the user.
     * @type {Pointer<CERT_CONTEXT>}
     */
    arrayCertContext {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * A pointer to an array of byte values that hold custom data that is passed through to the filter procedure 
     *       referenced by <b>pfnFilter</b>. This custom data is not used by the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/cryptdlg/nf-cryptdlg-certselectcertificatea">CertSelectCertificate</a> function.
     * @type {Pointer}
     */
    lCustData {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/cryptdlg/nc-cryptdlg-pfncmhookproc">PFNCMHOOKPROC</a> function pointer to the Hook 
     *       callback function. This function is called before messages are processed by the dialog box. For more 
     *       information, see <a href="https://docs.microsoft.com/windows/desktop/winmsg/hooks">Hooks</a>.
     * @type {Pointer<PFNCMHOOKPROC>}
     */
    pfnHook {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/cryptdlg/nc-cryptdlg-pfncmfilterproc">PFNCMFILTERPROC</a> function pointer to the 
     *       filter callback function. This is called to determine which certificates will be displayed by the dialog 
     *       box.
     * @type {Pointer<PFNCMFILTERPROC>}
     */
    pfnFilter {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }

    /**
     * A pointer to a null-terminated string that contains the full path to the Help file.
     * @type {Pointer<PWSTR>}
     */
    szHelpFileName {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }

    /**
     * The context identifier for the topic. For more information, see  
     *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/htmlhelp/winhelp">WinHelp</a>.
     * @type {Integer}
     */
    dwHelpId {
        get => NumGet(this, 120, "uint")
        set => NumPut("uint", value, this, 120)
    }

    /**
     * A handle to the 
     *       <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/cryptographic-service-providers">Cryptographic Service Provider</a> (CSP) 
     *       to use for certificate verification.
     * @type {Pointer}
     */
    hprov {
        get => NumGet(this, 128, "ptr")
        set => NumPut("ptr", value, this, 128)
    }
}

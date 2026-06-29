#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\HWND.ahk" { HWND }
#Import "..\HCERTSTORE.ahk" { HCERTSTORE }
#Import "..\..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\..\..\Foundation\HINSTANCE.ahk" { HINSTANCE }
#Import "..\..\..\Foundation\PSTR.ahk" { PSTR }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\CERT_CONTEXT.ahk" { CERT_CONTEXT }
#Import ".\CERT_SELECT_STRUCT_FLAGS.ahk" { CERT_SELECT_STRUCT_FLAGS }

/**
 * Contains criteria upon which to select certificates that are presented in a certificate selection dialog box. This structure is used in the CertSelectCertificate function. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The cryptdlg.h header defines CERT_SELECT_STRUCT as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/cryptdlg/ns-cryptdlg-cert_select_struct_w
 * @namespace Windows.Win32.Security.Cryptography.UI
 * @charset Unicode
 */
export default struct CERT_SELECT_STRUCT_W {
    #StructPack 8

    /**
     * The size, in bytes, of this structure.
     */
    dwSize : UInt32

    /**
     * A handle to the parent window of any dialog boxes that 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/cryptdlg/nf-cryptdlg-certselectcertificatea">CertSelectCertificate</a> generates.
     */
    hwndParent : HWND

    /**
     * A handle to the module whose executable file contains the dialog box template.
     */
    hInstance : HINSTANCE

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
     */
    pTemplateName : PWSTR

    dwFlags : CERT_SELECT_STRUCT_FLAGS

    /**
     * A pointer to a string that contains the text for the title of the dialog box.
     */
    szTitle : PWSTR

    /**
     * The number of elements in <b>arrayCertStore</b> array.
     */
    cCertStore : UInt32

    /**
     * A pointer to the array of certificate stores that the dialog box enumerates and displays the certificates 
     *       from. The <b>cCertStore</b> member contains the number of elements in this array.
     */
    arrayCertStore : HCERTSTORE.Ptr

    /**
     * A pointer to a string representation of an object identifier (OID) for an enhanced key usage (EKU). If an 
     *       OID is provided, only certificates that include this EKU will be displayed.
     */
    szPurposeOid : PSTR

    /**
     * The number of elements in the <b>arrayCertContext</b> array. After the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/cryptdlg/nf-cryptdlg-certselectcertificatea">CertSelectCertificate</a> function returns, 
     *       this member contains the number of certificates that were selected by the user. Currently, only one certificate 
     *       can be selected by the user.
     */
    cCertContext : UInt32

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
     */
    arrayCertContext : IntPtr

    /**
     * A pointer to an array of byte values that hold custom data that is passed through to the filter procedure 
     *       referenced by <b>pfnFilter</b>. This custom data is not used by the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/cryptdlg/nf-cryptdlg-certselectcertificatea">CertSelectCertificate</a> function.
     */
    lCustData : LPARAM

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/cryptdlg/nc-cryptdlg-pfncmhookproc">PFNCMHOOKPROC</a> function pointer to the Hook 
     *       callback function. This function is called before messages are processed by the dialog box. For more 
     *       information, see <a href="https://docs.microsoft.com/windows/desktop/winmsg/hooks">Hooks</a>.
     */
    pfnHook : IntPtr

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/cryptdlg/nc-cryptdlg-pfncmfilterproc">PFNCMFILTERPROC</a> function pointer to the 
     *       filter callback function. This is called to determine which certificates will be displayed by the dialog 
     *       box.
     */
    pfnFilter : IntPtr

    /**
     * A pointer to a null-terminated string that contains the full path to the Help file.
     */
    szHelpFileName : PWSTR

    /**
     * The context identifier for the topic. For more information, see  
     *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/htmlhelp/winhelp">WinHelp</a>.
     */
    dwHelpId : UInt32

    /**
     * A handle to the 
     *       <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/cryptographic-service-providers">Cryptographic Service Provider</a> (CSP) 
     *       to use for certificate verification.
     */
    hprov : IntPtr

}

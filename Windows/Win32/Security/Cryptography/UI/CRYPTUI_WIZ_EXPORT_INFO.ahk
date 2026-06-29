#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\CERT_CONTEXT.ahk" { CERT_CONTEXT }
#Import ".\CRYPTUI_WIZ_EXPORT_SUBJECT.ahk" { CRYPTUI_WIZ_EXPORT_SUBJECT }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\CRL_CONTEXT.ahk" { CRL_CONTEXT }
#Import "..\HCERTSTORE.ahk" { HCERTSTORE }
#Import "..\CTL_CONTEXT.ahk" { CTL_CONTEXT }

/**
 * Contains information that controls the operation of the CryptUIWizExport function.
 * @see https://learn.microsoft.com/windows/win32/api/cryptuiapi/ns-cryptuiapi-cryptui_wiz_export_info
 * @namespace Windows.Win32.Security.Cryptography.UI
 */
export default struct CRYPTUI_WIZ_EXPORT_INFO {
    #StructPack 8

    /**
     * The size, in bytes, of this structure.
     */
    dwSize : UInt32

    /**
     * A pointer to a null-terminated Unicode string that contains the fully qualified file name to export to. If this member is
     * not <b>NULL</b> and the <b>CRYPTUI_WIZ_NO_UI</b> flag in the <i>dwFlags</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/cryptuiapi/nf-cryptuiapi-cryptuiwizexport">CryptUIWizExport</a> function is not set, this string is
     * displayed to the user as the default file name. This member is required if the <b>CRYPTUI_WIZ_NO_UI</b> flag is set.  This member is otherwise optional.
     */
    pwszExportFileName : PWSTR

    dwSubjectChoice : CRYPTUI_WIZ_EXPORT_SUBJECT

    pCertContext : CERT_CONTEXT.Ptr

    /**
     * The number of elements in the <b>rghStores</b> array.
     */
    cStores : UInt32

    /**
     * An array of extra certificate stores to search for certificates in the trust chain if the chain is being exported with a certificate.
     * This member is ignored if <b>dwSubjectChoice</b> is anything other than the   <b>CRYPTUI_WIZ_EXPORT_CERT_CONTEXT</b> value. The <b>cStores</b> member contains the number of elements in this array.
     */
    rghStores : HCERTSTORE.Ptr

    static __New() {
        DefineProp(this.Prototype, 'pCTLContext', { type: CTL_CONTEXT.Ptr, offset: 24 })
        DefineProp(this.Prototype, 'pCRLContext', { type: CRL_CONTEXT.Ptr, offset: 24 })
        DefineProp(this.Prototype, 'hCertStore', { type: HCERTSTORE, offset: 24 })
        this.DeleteProp("__New")
    }
}

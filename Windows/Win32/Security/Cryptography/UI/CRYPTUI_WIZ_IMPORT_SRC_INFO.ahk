#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\CERT_CONTEXT.ahk" { CERT_CONTEXT }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\CRL_CONTEXT.ahk" { CRL_CONTEXT }
#Import "..\HCERTSTORE.ahk" { HCERTSTORE }
#Import "..\CTL_CONTEXT.ahk" { CTL_CONTEXT }
#Import ".\CRYPTUI_WIZ_IMPORT_SUBJECT_OPTION.ahk" { CRYPTUI_WIZ_IMPORT_SUBJECT_OPTION }
#Import "..\CRYPT_KEY_FLAGS.ahk" { CRYPT_KEY_FLAGS }

/**
 * Contains the subject to import into the CryptUIWizImport function.
 * @see https://learn.microsoft.com/windows/win32/api/cryptuiapi/ns-cryptuiapi-cryptui_wiz_import_src_info
 * @namespace Windows.Win32.Security.Cryptography.UI
 */
export default struct CRYPTUI_WIZ_IMPORT_SRC_INFO {
    #StructPack 8

    /**
     * The size, in bytes, of this structure.
     */
    dwSize : UInt32

    dwSubjectChoice : CRYPTUI_WIZ_IMPORT_SUBJECT_OPTION

    pwszFileName : PWSTR

    dwFlags : CRYPT_KEY_FLAGS

    /**
     * Pointer to a null-terminated Unicode string that contains the password used to access the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">private key</a>.  A password is required if <b>pwszFileName</b> contains a PFX BLOB.  If a password is not required, the variable can be an empty string. This member cannot be <b>NULL</b>.
     */
    pwszPassword : PWSTR

    static __New() {
        DefineProp(this.Prototype, 'pCertContext', { type: CERT_CONTEXT.Ptr, offset: 8 })
        DefineProp(this.Prototype, 'pCTLContext', { type: CTL_CONTEXT.Ptr, offset: 8 })
        DefineProp(this.Prototype, 'pCRLContext', { type: CRL_CONTEXT.Ptr, offset: 8 })
        DefineProp(this.Prototype, 'hCertStore', { type: HCERTSTORE, offset: 8 })
        this.DeleteProp("__New")
    }
}

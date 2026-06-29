#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CRYPTUI_WIZ_DIGITAL_SIGN_SUBJECT.ahk" { CRYPTUI_WIZ_DIGITAL_SIGN_SUBJECT }
#Import ".\CRYPTUI_WIZ_DIGITAL_SIGN.ahk" { CRYPTUI_WIZ_DIGITAL_SIGN }
#Import ".\CRYPTUI_WIZ_DIGITAL_SIGN_CERT_PVK_INFO.ahk" { CRYPTUI_WIZ_DIGITAL_SIGN_CERT_PVK_INFO }
#Import ".\CRYPTUI_WIZ_DIGITAL_ADDITIONAL_CERT_CHOICE.ahk" { CRYPTUI_WIZ_DIGITAL_ADDITIONAL_CERT_CHOICE }
#Import ".\CRYPTUI_WIZ_DIGITAL_SIGN_EXTENDED_INFO.ahk" { CRYPTUI_WIZ_DIGITAL_SIGN_EXTENDED_INFO }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\CRYPTUI_WIZ_DIGITAL_SIGN_STORE_INFO.ahk" { CRYPTUI_WIZ_DIGITAL_SIGN_STORE_INFO }
#Import "..\CERT_CONTEXT.ahk" { CERT_CONTEXT }
#Import ".\CRYPTUI_WIZ_DIGITAL_SIGN_BLOB_INFO.ahk" { CRYPTUI_WIZ_DIGITAL_SIGN_BLOB_INFO }

/**
 * Contains information about digital signing.
 * @see https://learn.microsoft.com/windows/win32/api/cryptuiapi/ns-cryptuiapi-cryptui_wiz_digital_sign_info
 * @namespace Windows.Win32.Security.Cryptography.UI
 */
export default struct CRYPTUI_WIZ_DIGITAL_SIGN_INFO {
    #StructPack 8

    /**
     * The size, in bytes, of the structure.
     */
    dwSize : UInt32

    dwSubjectChoice : CRYPTUI_WIZ_DIGITAL_SIGN_SUBJECT

    pwszFileName : PWSTR

    dwSigningCertChoice : CRYPTUI_WIZ_DIGITAL_SIGN

    pSigningCertContext : CERT_CONTEXT.Ptr

    /**
     * A pointer to a null-terminated Unicode string that contains the URL for the time stamp.
     */
    pwszTimestampURL : PWSTR

    dwAdditionalCertChoice : CRYPTUI_WIZ_DIGITAL_ADDITIONAL_CERT_CHOICE

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/cryptuiapi/ns-cryptuiapi-cryptui_wiz_digital_sign_extended_info">CRYPTUI_WIZ_DIGITAL_SIGN_EXTENDED_INFO</a> structure that contains extended information about the signature.
     */
    pSignExtInfo : CRYPTUI_WIZ_DIGITAL_SIGN_EXTENDED_INFO.Ptr

    static __New() {
        DefineProp(this.Prototype, 'pSignBlobInfo', { type: CRYPTUI_WIZ_DIGITAL_SIGN_BLOB_INFO.Ptr, offset: 8 })
        DefineProp(this.Prototype, 'pSigningCertStore', { type: CRYPTUI_WIZ_DIGITAL_SIGN_STORE_INFO.Ptr, offset: 24 })
        DefineProp(this.Prototype, 'pSigningCertPvkInfo', { type: CRYPTUI_WIZ_DIGITAL_SIGN_CERT_PVK_INFO.Ptr, offset: 24 })
        this.DeleteProp("__New")
    }
}

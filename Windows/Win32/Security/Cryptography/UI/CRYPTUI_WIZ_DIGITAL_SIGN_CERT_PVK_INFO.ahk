#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CRYPTUI_WIZ_DIGITAL_SIGN_PVK_OPTION.ahk" { CRYPTUI_WIZ_DIGITAL_SIGN_PVK_OPTION }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\CRYPT_KEY_PROV_INFO.ahk" { CRYPT_KEY_PROV_INFO }
#Import ".\CRYPTUI_WIZ_DIGITAL_SIGN_PVK_FILE_INFO.ahk" { CRYPTUI_WIZ_DIGITAL_SIGN_PVK_FILE_INFO }

/**
 * Contains information about the PVK file that contains the certificates used by the CryptUIWizDigitalSign function.
 * @see https://learn.microsoft.com/windows/win32/api/cryptuiapi/ns-cryptuiapi-cryptui_wiz_digital_sign_cert_pvk_info
 * @namespace Windows.Win32.Security.Cryptography.UI
 */
export default struct CRYPTUI_WIZ_DIGITAL_SIGN_CERT_PVK_INFO {
    #StructPack 8

    /**
     * The size, in bytes, of the structure.
     */
    dwSize : UInt32

    /**
     * A pointer to a null-terminated Unicode string that contains the path and file named of the file that contains the signing certificates.
     */
    pwszSigningCertFileName : PWSTR

    dwPvkChoice : CRYPTUI_WIZ_DIGITAL_SIGN_PVK_OPTION

    pPvkFileInfo : CRYPTUI_WIZ_DIGITAL_SIGN_PVK_FILE_INFO.Ptr

    static __New() {
        DefineProp(this.Prototype, 'pPvkProvInfo', { type: CRYPT_KEY_PROV_INFO.Ptr, offset: 24 })
        this.DeleteProp("__New")
    }
}

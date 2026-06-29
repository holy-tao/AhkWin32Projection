#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SECPKG_SUPPLEMENTAL_CRED.ahk" { SECPKG_SUPPLEMENTAL_CRED }
#Import ".\LSA_UNICODE_STRING.ahk" { LSA_UNICODE_STRING }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * The SECPKG_SUPPLEMENTAL_CRED_ARRAY structure contains supplemental credentials information. This structure is used by the LsaApLogonUserEx2 and UpdateCredentials functions.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecpkg/ns-ntsecpkg-secpkg_supplemental_cred_array
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SECPKG_SUPPLEMENTAL_CRED_ARRAY {
    #StructPack 8

    /**
     * The number of supplemental credentials in the <b>Credentials</b> member.
     */
    CredentialCount : UInt32

    /**
     * An array containing supplemental credentials.
     */
    Credentials : SECPKG_SUPPLEMENTAL_CRED[1]

}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LSA_UNICODE_STRING.ahk" { LSA_UNICODE_STRING }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * The TRUSTED_PASSWORD_INFO structure is used to query or set the password for a trusted domain.
 * @remarks
 * When you have finished using the <b>TRUSTED_PASSWORD_INFO</b> structure, clear the sensitive information from memory by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa366877(v=vs.85)">SecureZeroMemory</a> function. For more information about protecting passwords, see <a href="https://docs.microsoft.com/windows/desktop/SecBP/handling-passwords">Handling Passwords</a>.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ns-ntsecapi-trusted_password_info
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct TRUSTED_PASSWORD_INFO {
    #StructPack 8

    /**
     * An 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_unicode_string">LSA_UNICODE_STRING</a> structure that contains the password to use when creating an authenticated connection to the domain.
     */
    Password : LSA_UNICODE_STRING

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_unicode_string">LSA_UNICODE_STRING</a> structure that contains the old password. On set operations, if the <b>Buffer</b> member of this structure is <b>NULL</b>, the old password is set to the current password.
     */
    OldPassword : LSA_UNICODE_STRING

}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\PWSTR.ahk
#Include .\LSA_UNICODE_STRING.ahk

/**
 * The TRUSTED_PASSWORD_INFO structure is used to query or set the password for a trusted domain.
 * @remarks
 * 
  * When you have finished using the <b>TRUSTED_PASSWORD_INFO</b> structure, clear the sensitive information from memory by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa366877(v=vs.85)">SecureZeroMemory</a> function. For more information about protecting passwords, see <a href="https://docs.microsoft.com/windows/desktop/SecBP/handling-passwords">Handling Passwords</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/ns-ntsecapi-trusted_password_info
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class TRUSTED_PASSWORD_INFO extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * An 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_unicode_string">LSA_UNICODE_STRING</a> structure that contains the password to use when creating an authenticated connection to the domain.
     * @type {LSA_UNICODE_STRING}
     */
    Password{
        get {
            if(!this.HasProp("__Password"))
                this.__Password := LSA_UNICODE_STRING(this.ptr + 0)
            return this.__Password
        }
    }

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_unicode_string">LSA_UNICODE_STRING</a> structure that contains the old password. On set operations, if the <b>Buffer</b> member of this structure is <b>NULL</b>, the old password is set to the current password.
     * @type {LSA_UNICODE_STRING}
     */
    OldPassword{
        get {
            if(!this.HasProp("__OldPassword"))
                this.__OldPassword := LSA_UNICODE_STRING(this.ptr + 16)
            return this.__OldPassword
        }
    }
}

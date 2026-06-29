#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DOMAIN_PASSWORD_PROPERTIES.ahk" { DOMAIN_PASSWORD_PROPERTIES }

/**
 * Contains information about a domain's password policy, such as the minimum length for passwords and how unique passwords must be.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ns-ntsecapi-domain_password_information
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct DOMAIN_PASSWORD_INFORMATION {
    #StructPack 8

    /**
     * Specifies the minimum length, in characters, of a valid password.
     */
    MinPasswordLength : UInt16

    /**
     * Indicates the number of previous passwords saved in the history list. A user cannot reuse a password in the history list.
     */
    PasswordHistoryLength : UInt16

    PasswordProperties : DOMAIN_PASSWORD_PROPERTIES

    /**
     * Specifies the maximum length of time that a password can remain the same. Passwords older than this must be changed. Because SAM stores relative times as negative values and absolute times as positive numbers, the time is stored as a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure with negative values.
     * 
     * The data type for this member is OLD_LARGE_INTEGER if MIDL_PASS is defined.
     */
    MaxPasswordAge : Int64

    /**
     * Specifies the minimum length of time before a password can be changed. Because SAM stores relative times as negative values and absolute times as positive numbers, the time is stored as a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure with negative values.
     * 
     * The data type for this member is OLD_LARGE_INTEGER if MIDL_PASS is defined.
     */
    MinPasswordAge : Int64

}

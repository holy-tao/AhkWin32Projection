#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LSA_UNICODE_STRING.ahk" { LSA_UNICODE_STRING }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\SR_SECURITY_DESCRIPTOR.ahk" { SR_SECURITY_DESCRIPTOR }
#Import ".\LOGON_HOURS.ahk" { LOGON_HOURS }

/**
 * Contains information on the session user.
 * @see https://learn.microsoft.com/windows/win32/api/subauth/ns-subauth-user_all_information
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct USER_ALL_INFORMATION {
    #StructPack 8

    /**
     * Indicates the date and time of the last logon.
     */
    LastLogon : Int64

    /**
     * Indicates the date and time of the last logoff.
     */
    LastLogoff : Int64

    /**
     * Indicates the date and time when the password was set or last changed.
     */
    PasswordLastSet : Int64

    /**
     * Indicates the date and time when the account will expire.
     */
    AccountExpires : Int64

    /**
     * Indicates the date and time when the password can be changed.
     */
    PasswordCanChange : Int64

    /**
     * Indicates the date and time when the password must change.
     */
    PasswordMustChange : Int64

    /**
     * Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> containing the name of the user account.
     */
    UserName : LSA_UNICODE_STRING

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> containing the full name of the user or account.
     */
    FullName : LSA_UNICODE_STRING

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> containing the home directory of the user.
     */
    HomeDirectory : LSA_UNICODE_STRING

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> containing the home drive name.
     */
    HomeDirectoryDrive : LSA_UNICODE_STRING

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> containing the path to any logon script.
     */
    ScriptPath : LSA_UNICODE_STRING

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> containing the path to the user's profile.
     */
    ProfilePath : LSA_UNICODE_STRING

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> containing a comment associated with the user account. This string can be a null string, or it can have any number of characters before the terminating null character.
     */
    AdminComment : LSA_UNICODE_STRING

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> containing the name of the workstation in use by the account.
     */
    WorkStations : LSA_UNICODE_STRING

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> containing a user comment. This string can be a null string, or it can have any number of characters before the terminating null character.
     */
    UserComment : LSA_UNICODE_STRING

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> reserved for use by applications. This string can be a null string, or it can have any number of characters before the terminating null character. Microsoft products use this member to store user configuration information. Do not modify this information.
     */
    Parameters : LSA_UNICODE_STRING

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> containing a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/h-gly">hash</a> of the user's local machine password.
     */
    LmPassword : LSA_UNICODE_STRING

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> containing a hash of the user's Windows domain password.
     */
    NtPassword : LSA_UNICODE_STRING

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> containing supplemental private data associated with the user account. If <b>PrivateDataSensitive</b> is <b>TRUE</b>, this data is encrypted.
     */
    PrivateData : LSA_UNICODE_STRING

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-sr_security_descriptor">SR_SECURITY_DESCRIPTOR</a> indicating the security <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">privileges</a> of the account.
     */
    SecurityDescriptor : SR_SECURITY_DESCRIPTOR

    /**
     * Contains the user ID from the account relative identifier (RID). This ID is used by the posix subsystem.
     */
    UserId : UInt32

    /**
     * Indicates the account's primary group. This ID is used by the posix subsystem.
     */
    PrimaryGroupId : UInt32

    /**
     * Contains flags defined in Subauth.h.
     */
    UserAccountControl : UInt32

    /**
     * Contains flags defined in Subauth.h.
     */
    WhichFields : UInt32

    /**
     * Indicates the hours when the user can logon.
     */
    LogonHours : LOGON_HOURS

    /**
     * Indicates the number of times the user tried to log on to this account using an incorrect password.
     */
    BadPasswordCount : UInt16

    /**
     * Indicates the number of logons by the user.
     */
    LogonCount : UInt16

    /**
     * Used for localization. If not equal to zero, value is the country/region code for the user's language of choice.
     */
    CountryCode : UInt16

    /**
     * Used for localization. If not equal to zero, the value is the code page for the user's language of choice.
     */
    CodePage : UInt16

    /**
     * Indicates whether there is a local machine password.
     */
    LmPasswordPresent : BOOLEAN

    /**
     * Indicates whether there is a Windows domain password.
     */
    NtPasswordPresent : BOOLEAN

    /**
     * Indicates whether the password has expired.
     */
    PasswordExpired : BOOLEAN

    /**
     * When set to <b>TRUE</b>, indicates that the <b>PrivateData</b> member is encrypted. A value of <b>FALSE</b> indicates that the <b>PrivateData</b> is in <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">plaintext</a>.
     */
    PrivateDataSensitive : BOOLEAN

}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\PWSTR.ahk
#Include .\LSA_UNICODE_STRING.ahk
#Include .\SR_SECURITY_DESCRIPTOR.ahk
#Include .\LOGON_HOURS.ahk
#Include ..\..\..\Foundation\BOOLEAN.ahk

/**
 * Contains information on the session user.
 * @see https://docs.microsoft.com/windows/win32/api//subauth/ns-subauth-user_all_information
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class USER_ALL_INFORMATION extends Win32Struct
{
    static sizeof => 320

    static packingSize => 8

    /**
     * Indicates the date and time of the last logon.
     * @type {Integer}
     */
    LastLogon {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }

    /**
     * Indicates the date and time of the last logoff.
     * @type {Integer}
     */
    LastLogoff {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }

    /**
     * Indicates the date and time when the password was set or last changed.
     * @type {Integer}
     */
    PasswordLastSet {
        get => NumGet(this, 16, "int64")
        set => NumPut("int64", value, this, 16)
    }

    /**
     * Indicates the date and time when the account will expire.
     * @type {Integer}
     */
    AccountExpires {
        get => NumGet(this, 24, "int64")
        set => NumPut("int64", value, this, 24)
    }

    /**
     * Indicates the date and time when the password can be changed.
     * @type {Integer}
     */
    PasswordCanChange {
        get => NumGet(this, 32, "int64")
        set => NumPut("int64", value, this, 32)
    }

    /**
     * Indicates the date and time when the password must change.
     * @type {Integer}
     */
    PasswordMustChange {
        get => NumGet(this, 40, "int64")
        set => NumPut("int64", value, this, 40)
    }

    /**
     * Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> containing the name of the user account.
     * @type {LSA_UNICODE_STRING}
     */
    UserName{
        get {
            if(!this.HasProp("__UserName"))
                this.__UserName := LSA_UNICODE_STRING(this.ptr + 48)
            return this.__UserName
        }
    }

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> containing the full name of the user or account.
     * @type {LSA_UNICODE_STRING}
     */
    FullName{
        get {
            if(!this.HasProp("__FullName"))
                this.__FullName := LSA_UNICODE_STRING(this.ptr + 64)
            return this.__FullName
        }
    }

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> containing the home directory of the user.
     * @type {LSA_UNICODE_STRING}
     */
    HomeDirectory{
        get {
            if(!this.HasProp("__HomeDirectory"))
                this.__HomeDirectory := LSA_UNICODE_STRING(this.ptr + 80)
            return this.__HomeDirectory
        }
    }

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> containing the home drive name.
     * @type {LSA_UNICODE_STRING}
     */
    HomeDirectoryDrive{
        get {
            if(!this.HasProp("__HomeDirectoryDrive"))
                this.__HomeDirectoryDrive := LSA_UNICODE_STRING(this.ptr + 96)
            return this.__HomeDirectoryDrive
        }
    }

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> containing the path to any logon script.
     * @type {LSA_UNICODE_STRING}
     */
    ScriptPath{
        get {
            if(!this.HasProp("__ScriptPath"))
                this.__ScriptPath := LSA_UNICODE_STRING(this.ptr + 112)
            return this.__ScriptPath
        }
    }

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> containing the path to the user's profile.
     * @type {LSA_UNICODE_STRING}
     */
    ProfilePath{
        get {
            if(!this.HasProp("__ProfilePath"))
                this.__ProfilePath := LSA_UNICODE_STRING(this.ptr + 128)
            return this.__ProfilePath
        }
    }

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> containing a comment associated with the user account. This string can be a null string, or it can have any number of characters before the terminating null character.
     * @type {LSA_UNICODE_STRING}
     */
    AdminComment{
        get {
            if(!this.HasProp("__AdminComment"))
                this.__AdminComment := LSA_UNICODE_STRING(this.ptr + 144)
            return this.__AdminComment
        }
    }

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> containing the name of the workstation in use by the account.
     * @type {LSA_UNICODE_STRING}
     */
    WorkStations{
        get {
            if(!this.HasProp("__WorkStations"))
                this.__WorkStations := LSA_UNICODE_STRING(this.ptr + 160)
            return this.__WorkStations
        }
    }

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> containing a user comment. This string can be a null string, or it can have any number of characters before the terminating null character.
     * @type {LSA_UNICODE_STRING}
     */
    UserComment{
        get {
            if(!this.HasProp("__UserComment"))
                this.__UserComment := LSA_UNICODE_STRING(this.ptr + 176)
            return this.__UserComment
        }
    }

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> reserved for use by applications. This string can be a null string, or it can have any number of characters before the terminating null character. Microsoft products use this member to store user configuration information. Do not modify this information.
     * @type {LSA_UNICODE_STRING}
     */
    Parameters{
        get {
            if(!this.HasProp("__Parameters"))
                this.__Parameters := LSA_UNICODE_STRING(this.ptr + 192)
            return this.__Parameters
        }
    }

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> containing a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/h-gly">hash</a> of the user's local machine password.
     * @type {LSA_UNICODE_STRING}
     */
    LmPassword{
        get {
            if(!this.HasProp("__LmPassword"))
                this.__LmPassword := LSA_UNICODE_STRING(this.ptr + 208)
            return this.__LmPassword
        }
    }

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> containing a hash of the user's Windows domain password.
     * @type {LSA_UNICODE_STRING}
     */
    NtPassword{
        get {
            if(!this.HasProp("__NtPassword"))
                this.__NtPassword := LSA_UNICODE_STRING(this.ptr + 224)
            return this.__NtPassword
        }
    }

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> containing supplemental private data associated with the user account. If <b>PrivateDataSensitive</b> is <b>TRUE</b>, this data is encrypted.
     * @type {LSA_UNICODE_STRING}
     */
    PrivateData{
        get {
            if(!this.HasProp("__PrivateData"))
                this.__PrivateData := LSA_UNICODE_STRING(this.ptr + 240)
            return this.__PrivateData
        }
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-sr_security_descriptor">SR_SECURITY_DESCRIPTOR</a> indicating the security <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">privileges</a> of the account.
     * @type {SR_SECURITY_DESCRIPTOR}
     */
    SecurityDescriptor{
        get {
            if(!this.HasProp("__SecurityDescriptor"))
                this.__SecurityDescriptor := SR_SECURITY_DESCRIPTOR(this.ptr + 256)
            return this.__SecurityDescriptor
        }
    }

    /**
     * Contains the user ID from the account relative identifier (RID). This ID is used by the posix subsystem.
     * @type {Integer}
     */
    UserId {
        get => NumGet(this, 272, "uint")
        set => NumPut("uint", value, this, 272)
    }

    /**
     * Indicates the account's primary group. This ID is used by the posix subsystem.
     * @type {Integer}
     */
    PrimaryGroupId {
        get => NumGet(this, 276, "uint")
        set => NumPut("uint", value, this, 276)
    }

    /**
     * Contains flags defined in Subauth.h.
     * @type {Integer}
     */
    UserAccountControl {
        get => NumGet(this, 280, "uint")
        set => NumPut("uint", value, this, 280)
    }

    /**
     * Contains flags defined in Subauth.h.
     * @type {Integer}
     */
    WhichFields {
        get => NumGet(this, 284, "uint")
        set => NumPut("uint", value, this, 284)
    }

    /**
     * Indicates the hours when the user can logon.
     * @type {LOGON_HOURS}
     */
    LogonHours{
        get {
            if(!this.HasProp("__LogonHours"))
                this.__LogonHours := LOGON_HOURS(this.ptr + 288)
            return this.__LogonHours
        }
    }

    /**
     * Indicates the number of times the user tried to log on to this account using an incorrect password.
     * @type {Integer}
     */
    BadPasswordCount {
        get => NumGet(this, 304, "ushort")
        set => NumPut("ushort", value, this, 304)
    }

    /**
     * Indicates the number of logons by the user.
     * @type {Integer}
     */
    LogonCount {
        get => NumGet(this, 306, "ushort")
        set => NumPut("ushort", value, this, 306)
    }

    /**
     * Used for localization. If not equal to zero, value is the country/region code for the user's language of choice.
     * @type {Integer}
     */
    CountryCode {
        get => NumGet(this, 308, "ushort")
        set => NumPut("ushort", value, this, 308)
    }

    /**
     * Used for localization. If not equal to zero, the value is the code page for the user's language of choice.
     * @type {Integer}
     */
    CodePage {
        get => NumGet(this, 310, "ushort")
        set => NumPut("ushort", value, this, 310)
    }

    /**
     * Indicates whether there is a local machine password.
     * @type {BOOLEAN}
     */
    LmPasswordPresent{
        get {
            if(!this.HasProp("__LmPasswordPresent"))
                this.__LmPasswordPresent := BOOLEAN(this.ptr + 312)
            return this.__LmPasswordPresent
        }
    }

    /**
     * Indicates whether there is a Windows domain password.
     * @type {BOOLEAN}
     */
    NtPasswordPresent{
        get {
            if(!this.HasProp("__NtPasswordPresent"))
                this.__NtPasswordPresent := BOOLEAN(this.ptr + 313)
            return this.__NtPasswordPresent
        }
    }

    /**
     * Indicates whether the password has expired.
     * @type {BOOLEAN}
     */
    PasswordExpired{
        get {
            if(!this.HasProp("__PasswordExpired"))
                this.__PasswordExpired := BOOLEAN(this.ptr + 314)
            return this.__PasswordExpired
        }
    }

    /**
     * When set to <b>TRUE</b>, indicates that the <b>PrivateData</b> member is encrypted. A value of <b>FALSE</b> indicates that the <b>PrivateData</b> is in <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">plaintext</a>.
     * @type {BOOLEAN}
     */
    PrivateDataSensitive{
        get {
            if(!this.HasProp("__PrivateDataSensitive"))
                this.__PrivateDataSensitive := BOOLEAN(this.ptr + 315)
            return this.__PrivateDataSensitive
        }
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The USER_INFO_22 structure contains information about a user account, including the account name, privilege level, the path to the user's home directory, a one-way encrypted LAN Manager 2.x-compatible password, and other user-related network statistics.
 * @remarks
 * User account names are limited to 20 characters and group names are limited to 256 characters. In addition, account names cannot be terminated by a period and they cannot include commas or any of the following printable characters: ", /, \, [, ], :, |, &lt;, &gt;, +, =, ;, ?, *. Names also cannot include characters in the range 1-31, which are nonprintable.
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/ns-lmaccess-user_info_22
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class USER_INFO_22 extends Win32Struct
{
    static sizeof => 160

    static packingSize => 8

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to a Unicode string that specifies the name of the user account. Calls to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netusersetinfo">NetUserSetInfo</a> function ignore this member. For more information, see the following Remarks section.
     * @type {Pointer<Ptr>}
     */
    usri22_name {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: <b>BYTE[ENCRYPTED_PWLEN]</b>
     * 
     * A one-way encrypted LAN Manager 2.<i>x</i>-compatible password.
     * @type {Array<Byte>}
     */
    usri22_password{
        get {
            if(!this.HasProp("__usri22_passwordProxyArray"))
                this.__usri22_passwordProxyArray := Win32FixedArray(this.ptr + 8, 1, Primitive, "char")
            return this.__usri22_passwordProxyArray
        }
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of seconds that have elapsed since the <b>usri22_password</b> member was last changed. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netuseradd">NetUserAdd</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netusersetinfo">NetUserSetInfo</a> functions ignore this member.
     * @type {Integer}
     */
    usri22_password_age {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The level of privilege assigned to the <b>usri22_name</b> member. Calls to the 
     * <b>NetUserAdd</b> function must specify USER_PRIV_USER. When you call the 
     * <b>NetUserSetInfo</b> function this member must be the value returned from the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netusergetinfo">NetUserGetInfo</a> or the
     * @type {Integer}
     */
    usri22_priv {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to a Unicode string specifying the path of the home directory for the user specified by the <b>usri22_name</b> member. The string can be null.
     * @type {Pointer<Ptr>}
     */
    usri22_home_dir {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to a Unicode string that contains a comment associated with the user account. This string can be a null string, or it can have any number of characters before the terminating null character.
     * @type {Pointer<Ptr>}
     */
    usri22_comment {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Type: <b>DWORD</b>
     * @type {Integer}
     */
    usri22_flags {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to a Unicode string specifying the path for the user's logon script file. The script file can be a .CMD file, an .EXE file, or a .BAT file. The string can also be null.
     * @type {Pointer<Ptr>}
     */
    usri22_script_path {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The user's operator privileges. 
     * 
     * 
     * 
     * 
     * Calls to the 
     * <b>NetUserGetInfo</b> function and the 
     * <b>NetUserEnum</b> function return a value based on the user's local group membership. If the user is a member of Print Operators, AF_OP_PRINT, is set. If the user is a member of Server Operators, AF_OP_SERVER, is set. If the user is a member of the Account Operators, AF_OP_ACCOUNTS, is set. AF_OP_COMM is never set.
     * 
     * The following restrictions apply:
     * 
     * <ul>
     * <li>When you call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netuseradd">NetUserAdd</a> function, this member must be zero.</li>
     * <li>When you call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netusersetinfo">NetUserSetInfo</a> function, this member must be the value returned from a call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netusergetinfo">NetUserGetInfo</a> or to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netuserenum">NetUserEnum</a>.</li>
     * </ul>
     * @type {Integer}
     */
    usri22_auth_flags {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to a Unicode string that contains the full name of the user. This string can be a null string, or it can have any number of characters before the terminating null character.
     * @type {Pointer<Ptr>}
     */
    usri22_full_name {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to a Unicode string that contains a user comment. This string can be a null string, or it can have any number of characters before the terminating null character.
     * @type {Pointer<Ptr>}
     */
    usri22_usr_comment {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to a Unicode string that is reserved for use by applications. This string can be a null string, or it can have any number of characters before the terminating null character. Microsoft products use this member to store user configuration information. Do not modify this information.
     * @type {Pointer<Ptr>}
     */
    usri22_parms {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * Type: <b>LPWSTR</b>
     * 
     * > [!IMPORTANT]
     * > You should no longer use **usri22_workstations**. Instead, you can control sign-in access to workstations by configuring the User Rights Assignment settings (**Allow log on locally** and **Deny log on locally**, or **Allow log on through Remote Desktop Services** and **Deny log on through Remote Desktop Services**).
     * 
     * A pointer to a Unicode string that contains the names of workstations from which the user can log on. As many as eight workstations can be specified; the names must be separated by commas. A null string indicates that there is no restriction. To disable logons from all workstations to this account, set the UF_ACCOUNTDISABLE value in the <b>usri22_flags</b> member.
     * @type {Pointer<Ptr>}
     */
    usri22_workstations {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The date and time when the last logon occurred. This value is stored as the number of seconds that have elapsed since 00:00:00, January 1, 1970, GMT. Calls to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netuseradd">NetUserAdd</a> and the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netusersetinfo">NetUserSetInfo</a> functions ignore this member. 
     * 
     * 
     * 
     * 
     * This member is maintained separately on each backup domain controller (BDC) in the domain. To obtain an accurate value, you must query each BDC in the domain. The last logon occurred at the time indicated by the largest retrieved value.
     * @type {Integer}
     */
    usri22_last_logon {
        get => NumGet(this, 104, "uint")
        set => NumPut("uint", value, this, 104)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * This member is currently not used. 
     * 
     * 
     * 
     * 
     * The date and time when the last logoff occurred. This value is stored as the number of seconds that have elapsed since 00:00:00, January 1, 1970, GMT. A value of zero means that the last logoff time is unknown. This element is ignored by calls to 
     * <b>NetUserAdd</b> and 
     * <b>NetUserSetInfo</b>.
     * 
     * This member is maintained separately on each backup domain controller (BDC) in the domain. To obtain an accurate value, you must query each BDC in the domain. The last logoff occurred at the time indicated by the largest retrieved value.
     * @type {Integer}
     */
    usri22_last_logoff {
        get => NumGet(this, 108, "uint")
        set => NumPut("uint", value, this, 108)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The date and time when the account expires. This value is stored as the number of seconds that have elapsed since 00:00:00, January 1, 1970, GMT. A value of TIMEQ_FOREVER indicates that the account never expires.
     * @type {Integer}
     */
    usri22_acct_expires {
        get => NumGet(this, 112, "uint")
        set => NumPut("uint", value, this, 112)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The maximum amount of disk space the user can use. Specify USER_MAXSTORAGE_UNLIMITED to use all available disk space.
     * @type {Integer}
     */
    usri22_max_storage {
        get => NumGet(this, 116, "uint")
        set => NumPut("uint", value, this, 116)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of equal-length time units into which the week is divided. This value is required to compute the length of the bit string in the <b>usri22_logon_hours</b> member. 
     * 
     * 
     * 
     * 
     * This value must be UNITS_PER_WEEK for LAN Manager 2.0. Calls to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netuseradd">NetUserAdd</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netusersetinfo">NetUserSetInfo</a> functions ignore this member.
     * 
     * For service applications, the units must be one of the following: SAM_DAYS_PER_WEEK, SAM_HOURS_PER_WEEK, or SAM_MINUTES_PER_WEEK.
     * @type {Integer}
     */
    usri22_units_per_week {
        get => NumGet(this, 120, "uint")
        set => NumPut("uint", value, this, 120)
    }

    /**
     * Type: <b>PBYTE</b>
     * 
     * A pointer to a 21-byte (168 bits) bit string that specifies the times during which the user can log on. Each bit represents a unique hour in the week, in Greenwich Mean Time (GMT). 
     * 
     * 
     * 
     * 
     * The first bit (bit 0, word 0) is Sunday, 0:00 to 0:59; the second bit (bit 1, word 0) is Sunday, 1:00 to 1:59; and so on. Note that bit 0 in word 0 represents Sunday from 0:00 to 0:59 only if you are in the GMT time zone. In all other cases you must adjust the bits according to your time zone offset (for example, GMT minus 8 hours for Pacific Standard Time).
     * 
     * Specify a null pointer in this member when calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netuseradd">NetUserAdd</a> function to indicate no time restriction. Specify a null pointer when calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netusersetinfo">NetUserSetInfo</a> function to indicate that no change is to be made to the times during which the user can log on.
     * @type {Pointer<Byte>}
     */
    usri22_logon_hours {
        get => NumGet(this, 128, "ptr")
        set => NumPut("ptr", value, this, 128)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of times the user tried to log on to this account using an incorrect password. A value of – 1 indicates that the value is unknown. Calls to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netuseradd">NetUserAdd</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netusersetinfo">NetUserSetInfo</a> functions ignore this member. 
     * 
     * 
     * 
     * 
     * This member is replicated from the primary domain controller (PDC); it is also maintained on each backup domain controller (BDC) in the domain. To obtain an accurate value, you must query each BDC in the domain. The number of times the user tried to log on using an incorrect password is the largest value retrieved.
     * @type {Integer}
     */
    usri22_bad_pw_count {
        get => NumGet(this, 136, "uint")
        set => NumPut("uint", value, this, 136)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of times the user logged on successfully to this account. A value of – 1 indicates that the value is unknown. Calls to the 
     * <b>NetUserAdd</b> and 
     * <b>NetUserSetInfo</b> functions ignore this member. 
     * 
     * 
     * 
     * 
     * This member is maintained separately on each backup domain controller (BDC) in the domain. To obtain an accurate value, you must query each BDC in the domain. The number of times the user logged on successfully is the sum of the retrieved values.
     * @type {Integer}
     */
    usri22_num_logons {
        get => NumGet(this, 140, "uint")
        set => NumPut("uint", value, this, 140)
    }

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to a Unicode string that contains the name of the server to which logon requests are sent. Server names should be preceded by two backslashes (\\). To indicate that the logon request can be handled by any logon server, specify an asterisk (\\*) for the server name. A null string indicates that requests should be sent to the domain controller. 
     * 
     * 
     * 
     * 
     * For Windows servers, the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netusergetinfo">NetUserGetInfo</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netuserenum">NetUserEnum</a> functions return \\*. Calls to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netuseradd">NetUserAdd</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netusersetinfo">NetUserSetInfo</a> functions ignore this member.
     * @type {Pointer<Ptr>}
     */
    usri22_logon_server {
        get => NumGet(this, 144, "ptr")
        set => NumPut("ptr", value, this, 144)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The country/region code for the user's language of choice. 
     * 
     * 
     * 
     * 
     * This value is ignored.
     * @type {Integer}
     */
    usri22_country_code {
        get => NumGet(this, 152, "uint")
        set => NumPut("uint", value, this, 152)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The code page for the user's language of choice. 
     * 
     * 
     * 
     * 
     * This value is ignored.
     * @type {Integer}
     */
    usri22_code_page {
        get => NumGet(this, 156, "uint")
        set => NumPut("uint", value, this, 156)
    }
}

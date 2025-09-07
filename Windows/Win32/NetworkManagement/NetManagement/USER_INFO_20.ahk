#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * Contains information about a user account, including the account name, the user's full name, a comment associated with the account, and the user's relative ID (RID).
 * @remarks
 * User account names are limited to 20 characters and group names are limited to 256 characters. In addition, account names cannot be terminated by a period and they cannot include commas or any of the following printable characters: ", /, \, [, ], :, |, &lt;, &gt;, +, =, ;, ?, *. Names also cannot include characters in the range 1-31, which are nonprintable.
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/ns-lmaccess-user_info_20
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class USER_INFO_20 extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to a Unicode string that specifies the name of the user account. Calls to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netusersetinfo">NetUserSetInfo</a> function ignore this member. For more information, see the following Remarks section.
     * @type {PWSTR}
     */
    usri20_name{
        get {
            if(!this.HasProp("__usri20_name"))
                this.__usri20_name := PWSTR(this.ptr + 0)
            return this.__usri20_name
        }
    }

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to a Unicode string that contains the full name of the user. This string can be a null string, or it can have any number of characters before the terminating null character.
     * @type {PWSTR}
     */
    usri20_full_name{
        get {
            if(!this.HasProp("__usri20_full_name"))
                this.__usri20_full_name := PWSTR(this.ptr + 8)
            return this.__usri20_full_name
        }
    }

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to a Unicode string that contains a comment associated with the user account. This string can be a null string, or it can have any number of characters before the terminating null character.
     * @type {PWSTR}
     */
    usri20_comment{
        get {
            if(!this.HasProp("__usri20_comment"))
                this.__usri20_comment := PWSTR(this.ptr + 16)
            return this.__usri20_comment
        }
    }

    /**
     * Type: <b>DWORD</b>
     * @type {Integer}
     */
    usri20_flags {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The user's relative identifier (RID). The RID is determined by the Security Account Manager (SAM) when the user is created. It uniquely defines this user account to SAM within the domain. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netuseradd">NetUserAdd</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netusersetinfo">NetUserSetInfo</a> functions ignore this member. For more information about RIDs, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/sid-components">SID Components</a>.
     * @type {Integer}
     */
    usri20_user_id {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }
}

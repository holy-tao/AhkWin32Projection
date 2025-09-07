#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * The USER_INFO_10 structure contains information about a user account, including the account name, comments associated with the account, and the user's full name.
 * @remarks
 * User account names are limited to 20 characters and group names are limited to 256 characters. In addition, account names cannot be terminated by a period and they cannot include commas or any of the following printable characters: ", /, \, [, ], :, |, &lt;, &gt;, +, =, ;, ?, *. Names also cannot include characters in the range 1-31, which are nonprintable.
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/ns-lmaccess-user_info_10
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class USER_INFO_10 extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Pointer to a Unicode string that specifies the name of the user account. Calls to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netusersetinfo">NetUserSetInfo</a> function ignore this member. For more information, see the following Remarks section.
     * @type {PWSTR}
     */
    usri10_name{
        get {
            if(!this.HasProp("__usri10_name"))
                this.__usri10_name := PWSTR(this.ptr + 0)
            return this.__usri10_name
        }
    }

    /**
     * Pointer to a Unicode string that contains a comment associated with the user account. The string can be a null string, or can have any number of characters before the terminating null character.
     * @type {PWSTR}
     */
    usri10_comment{
        get {
            if(!this.HasProp("__usri10_comment"))
                this.__usri10_comment := PWSTR(this.ptr + 8)
            return this.__usri10_comment
        }
    }

    /**
     * Pointer to a Unicode string that contains a user comment. This string can be a null string, or it can have any number of characters before the terminating null character.
     * @type {PWSTR}
     */
    usri10_usr_comment{
        get {
            if(!this.HasProp("__usri10_usr_comment"))
                this.__usri10_usr_comment := PWSTR(this.ptr + 16)
            return this.__usri10_usr_comment
        }
    }

    /**
     * Pointer to a Unicode string that contains the full name of the user. This string can be a null string, or it can have any number of characters before the terminating null character.
     * @type {PWSTR}
     */
    usri10_full_name{
        get {
            if(!this.HasProp("__usri10_full_name"))
                this.__usri10_full_name := PWSTR(this.ptr + 24)
            return this.__usri10_full_name
        }
    }
}

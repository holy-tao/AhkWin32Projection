#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about a user account, including the account name, the user's full name, a comment associated with the account, and the user's security identifier (SID).
 * @see https://docs.microsoft.com/windows/win32/api//lmaccess/ns-lmaccess-user_info_23
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class USER_INFO_23 extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to a Unicode string that specifies the name of the user account. Calls to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netusersetinfo">NetUserSetInfo</a> function ignore this member.
     * @type {PWSTR}
     */
    usri23_name {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to a Unicode string that contains the full name of the user. This string can be a null string, or it can have any number of characters before the terminating null character.
     * @type {PWSTR}
     */
    usri23_full_name {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to a Unicode string that contains a comment associated with the user account. This string can be a null string, or it can have any number of characters before the terminating null character.
     * @type {PWSTR}
     */
    usri23_comment {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Type: <b>DWORD</b>
     * @type {Integer}
     */
    usri23_flags {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Type: <b>PSID</b>
     * 
     * A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structure that contains the security identifier (SID) that uniquely identifies the user. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netuseradd">NetUserAdd</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netusersetinfo">NetUserSetInfo</a> functions ignore this member.
     * @type {PSID}
     */
    usri23_user_sid {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}

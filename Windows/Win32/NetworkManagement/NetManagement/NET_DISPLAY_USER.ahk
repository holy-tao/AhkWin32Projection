#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The NET_DISPLAY_USER structure contains information that an account manager can access to determine information about user accounts.
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/ns-lmaccess-net_display_user
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class NET_DISPLAY_USER extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to a Unicode string that specifies the name of the user account.
     * @type {Pointer<PWSTR>}
     */
    usri1_name {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to a Unicode string that contains a comment associated with the user. This string can be a null string, or it can have any number of characters before the terminating null character (MAXCOMMENTSZ).
     * @type {Pointer<PWSTR>}
     */
    usri1_comment {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: <b>DWORD</b>
     * @type {Integer}
     */
    usri1_flags {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to a Unicode string that contains the full name of the user. This string can be a null string, or it can have any number of characters before the terminating null character.
     * @type {Pointer<PWSTR>}
     */
    usri1_full_name {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The relative identifier (RID) of the user. The relative identifier is determined by the accounts database when the user is created. It uniquely defines this user account to the account manager within the domain. For more information about relative identifiers, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/sid-components">SID Components</a>.
     * @type {Integer}
     */
    usri1_user_id {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The index of the last entry returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netquerydisplayinformation">NetQueryDisplayInformation</a> function. Pass this value as the <i>Index</i> parameter to 
     * <b>NetQueryDisplayInformation</b> to return the next logical entry. Note that you should not use the value of this member for any purpose except to retrieve more data with additional calls to 
     * <b>NetQueryDisplayInformation</b>.
     * @type {Integer}
     */
    usri1_next_index {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }
}

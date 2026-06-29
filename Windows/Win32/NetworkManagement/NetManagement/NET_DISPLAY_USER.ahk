#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\USER_ACCOUNT_FLAGS.ahk" { USER_ACCOUNT_FLAGS }

/**
 * The NET_DISPLAY_USER structure contains information that an account manager can access to determine information about user accounts.
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/ns-lmaccess-net_display_user
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct NET_DISPLAY_USER {
    #StructPack 8

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to a Unicode string that specifies the name of the user account.
     */
    usri1_name : PWSTR

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to a Unicode string that contains a comment associated with the user. This string can be a null string, or it can have any number of characters before the terminating null character (MAXCOMMENTSZ).
     */
    usri1_comment : PWSTR

    /**
     * Type: <b>DWORD</b>
     */
    usri1_flags : USER_ACCOUNT_FLAGS

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to a Unicode string that contains the full name of the user. This string can be a null string, or it can have any number of characters before the terminating null character.
     */
    usri1_full_name : PWSTR

    /**
     * Type: <b>DWORD</b>
     * 
     * The relative identifier (RID) of the user. The relative identifier is determined by the accounts database when the user is created. It uniquely defines this user account to the account manager within the domain. For more information about relative identifiers, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/sid-components">SID Components</a>.
     */
    usri1_user_id : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The index of the last entry returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netquerydisplayinformation">NetQueryDisplayInformation</a> function. Pass this value as the <i>Index</i> parameter to 
     * <b>NetQueryDisplayInformation</b> to return the next logical entry. Note that you should not use the value of this member for any purpose except to retrieve more data with additional calls to 
     * <b>NetQueryDisplayInformation</b>.
     */
    usri1_next_index : UInt32

}

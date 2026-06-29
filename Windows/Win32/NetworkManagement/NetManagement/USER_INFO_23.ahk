#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Security\PSID.ahk" { PSID }
#Import ".\USER_ACCOUNT_FLAGS.ahk" { USER_ACCOUNT_FLAGS }

/**
 * Contains information about a user account, including the account name, the user's full name, a comment associated with the account, and the user's security identifier (SID).
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/ns-lmaccess-user_info_23
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct USER_INFO_23 {
    #StructPack 8

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to a Unicode string that specifies the name of the user account. Calls to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netusersetinfo">NetUserSetInfo</a> function ignore this member.
     */
    usri23_name : PWSTR

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to a Unicode string that contains the full name of the user. This string can be a null string, or it can have any number of characters before the terminating null character.
     */
    usri23_full_name : PWSTR

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to a Unicode string that contains a comment associated with the user account. This string can be a null string, or it can have any number of characters before the terminating null character.
     */
    usri23_comment : PWSTR

    /**
     * Type: <b>DWORD</b>
     */
    usri23_flags : USER_ACCOUNT_FLAGS

    /**
     * Type: <b>PSID</b>
     * 
     * A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structure that contains the security identifier (SID) that uniquely identifies the user. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netuseradd">NetUserAdd</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netusersetinfo">NetUserSetInfo</a> functions ignore this member.
     */
    usri23_user_sid : PSID

}

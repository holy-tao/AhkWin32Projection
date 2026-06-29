#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The USER_INFO_1017 structure contains expiration information for network user accounts. This information level is valid only when you call the NetUserSetInfo function.
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/ns-lmaccess-user_info_1017
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct USER_INFO_1017 {
    #StructPack 4

    /**
     * Specifies a <b>DWORD</b> value that indicates when the user account expires. The user account is specified in the <i>username</i> parameter to the 
     * <b>NetUserSetInfo</b> function. 
     * 
     * 
     * 
     * 
     * The value is stored as the number of seconds that have elapsed since 00:00:00, January 1, 1970, GMT. Specify TIMEQ_FOREVER to indicate that the account never expires.
     */
    usri1017_acct_expires : UInt32

}

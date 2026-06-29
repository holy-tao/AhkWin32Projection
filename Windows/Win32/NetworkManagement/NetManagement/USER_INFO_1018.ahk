#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The USER_INFO_1018 structure contains the maximum amount of disk space available to a network user account. This information level is valid only when you call the NetUserSetInfo function.
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/ns-lmaccess-user_info_1018
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct USER_INFO_1018 {
    #StructPack 4

    /**
     * Specifies a <b>DWORD</b> value that indicates the maximum amount of disk space the user can use. The user is specified in the <i>username</i> parameter to the 
     * <b>NetUserSetInfo</b> function. 
     * 
     * 
     * 
     * 
     * You must specify USER_MAXSTORAGE_UNLIMITED to indicate that there is no restriction on disk space.
     */
    usri1018_max_storage : UInt32

}

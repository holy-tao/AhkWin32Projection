#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The USER_INFO_1025 structure contains the code page for a network user's language of choice. This information level is valid only when you call the NetUserSetInfo function.
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/ns-lmaccess-user_info_1025
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct USER_INFO_1025 {
    #StructPack 4

    /**
     * Specifies a <b>DWORD</b> value that indicates the code page for the user's language of choice. The user is specified in the <i>username</i> parameter to the 
     * <b>NetUserSetInfo</b> function. 
     * 
     * 
     * 
     * 
     * This value is ignored.
     */
    usri1025_code_page : UInt32

}

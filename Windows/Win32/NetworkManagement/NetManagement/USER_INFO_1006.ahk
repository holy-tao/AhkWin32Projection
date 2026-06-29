#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * The USER_INFO_1006 structure contains the user's home directory path. This information level is valid only when you call the NetUserSetInfo function.
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/ns-lmaccess-user_info_1006
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct USER_INFO_1006 {
    #StructPack 8

    /**
     * Pointer to a Unicode string specifying the path of the home directory for the user account specified in the <i>username</i> parameter to the 
     * <b>NetUserSetInfo</b> function. The string can be null.
     */
    usri1006_home_dir : PWSTR

}

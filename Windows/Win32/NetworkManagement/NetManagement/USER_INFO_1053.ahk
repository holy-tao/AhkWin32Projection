#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * The USER_INFO_1053 structure contains user information for network accounts. This information level is valid only when you call the NetUserSetInfo function.
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/ns-lmaccess-user_info_1053
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct USER_INFO_1053 {
    #StructPack 8

    /**
     * Specifies the drive letter to assign to the user's home directory for logon purposes. The user is specified in the <i>username</i> parameter to the 
     * <b>NetUserSetInfo</b> function.
     */
    usri1053_home_dir_drive : PWSTR

}

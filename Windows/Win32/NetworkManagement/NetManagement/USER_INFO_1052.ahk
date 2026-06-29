#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * The USER_INFO_1052 structure contains the path to a network user's profile. This information level is valid only when you call the NetUserSetInfo function.
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/ns-lmaccess-user_info_1052
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct USER_INFO_1052 {
    #StructPack 8

    /**
     * Specifies a Unicode string that contains the path to the user's profile. The user is specified in the <i>username</i> parameter to the 
     * <b>NetUserSetInfo</b> function. This value can be a null string, a local absolute path, or a UNC path.
     */
    usri1052_profile : PWSTR

}

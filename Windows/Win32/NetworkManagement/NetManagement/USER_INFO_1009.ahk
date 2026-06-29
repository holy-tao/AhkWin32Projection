#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * The USER_INFO_1009 structure contains the path for a user's logon script file. This information level is valid only when you call the NetUserSetInfo function.
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/ns-lmaccess-user_info_1009
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct USER_INFO_1009 {
    #StructPack 8

    /**
     * Pointer to a Unicode string specifying the path for the user's logon script file. The user is specified in the <i>username</i> parameter to the 
     * <b>NetUserSetInfo</b> function. The script file can be a .CMD file, an .EXE file, or a .BAT file. The string can also be null.
     */
    usri1009_script_path : PWSTR

}

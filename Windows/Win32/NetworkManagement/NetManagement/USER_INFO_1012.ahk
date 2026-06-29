#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * The USER_INFO_1012 structure contains a user comment. This information level is valid only when you call the NetUserSetInfo function.
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/ns-lmaccess-user_info_1012
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct USER_INFO_1012 {
    #StructPack 8

    /**
     * Pointer to a Unicode string that contains a user comment. The user is specified in the <i>username</i> parameter to the 
     * <b>NetUserSetInfo</b> function. This string can be a null string, or it can have any number of characters before the terminating null character.
     */
    usri1012_usr_comment : PWSTR

}

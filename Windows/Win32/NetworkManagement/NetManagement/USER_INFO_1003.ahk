#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * The USER_INFO_1003 structure contains a user password. This information level is valid only when you call the NetUserSetInfo function.
 * @remarks
 * By convention, the length of passwords is limited to LM20_PWLEN characters.
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/ns-lmaccess-user_info_1003
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct USER_INFO_1003 {
    #StructPack 8

    /**
     * Specifies a Unicode string that contains the password for the user account specified in the <i>username</i> parameter to the 
     * <b>NetUserSetInfo</b> function. The length cannot exceed PWLEN bytes.
     */
    usri1003_password : PWSTR

}

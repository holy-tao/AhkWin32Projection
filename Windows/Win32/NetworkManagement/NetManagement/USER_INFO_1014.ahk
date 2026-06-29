#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * The USER_INFO_1014 structure contains the names of workstations from which the user can log on. This information level is valid only when you call the NetUserSetInfo function.
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/ns-lmaccess-user_info_1014
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct USER_INFO_1014 {
    #StructPack 8

    /**
     * > [!IMPORTANT]
     * > You should no longer use **usri1014_workstations**. Instead, you can control sign-in access to workstations by configuring the User Rights Assignment settings (**Allow log on locally** and **Deny log on locally**, or **Allow log on through Remote Desktop Services** and **Deny log on through Remote Desktop Services**).
     * 
     * Pointer to a Unicode string that contains the names of workstations from which the user can log on. The user is specified in the <i>username</i> parameter to the 
     * <b>NetUserSetInfo</b> function. 
     * 
     * As many as eight workstations can be specified; the names must be separated by commas. A null string indicates that there is no restriction.
     */
    usri1014_workstations : PWSTR

}

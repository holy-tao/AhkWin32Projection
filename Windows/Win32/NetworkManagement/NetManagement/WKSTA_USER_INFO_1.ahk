#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * The WKSTA_USER_INFO_1 structure contains user information as it pertains to a specific workstation. The information includes the name of the current user and the domains accessed by the workstation.
 * @see https://learn.microsoft.com/windows/win32/api/lmwksta/ns-lmwksta-wksta_user_info_1
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct WKSTA_USER_INFO_1 {
    #StructPack 8

    /**
     * Specifies the name of the user currently logged on to the workstation.
     * 
     * This string is Unicode if  <b>_WIN32_WINNT</b> or <b>FORCE_UNICODE</b> are defined.
     */
    wkui1_username : PWSTR

    /**
     * Specifies the name of the domain in which the user is currently logged on.
     * 
     * This string is Unicode if  <b>_WIN32_WINNT</b> or <b>FORCE_UNICODE</b> are defined.
     */
    wkui1_logon_domain : PWSTR

    /**
     * Specifies the list of operating system domains browsed by the workstation. The domain names are separated by blanks.
     * 
     * This string is Unicode if  <b>_WIN32_WINNT</b> or <b>FORCE_UNICODE</b> are defined.
     */
    wkui1_oth_domains : PWSTR

    /**
     * Specifies the name of the server that authenticated the user.
     * 
     * This string is Unicode if  <b>_WIN32_WINNT</b> or <b>FORCE_UNICODE</b> are defined.
     */
    wkui1_logon_server : PWSTR

}

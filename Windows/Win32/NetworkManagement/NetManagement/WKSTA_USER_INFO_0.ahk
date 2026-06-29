#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * The WKSTA_USER_INFO_0 structure contains the name of the user on a specified workstation.
 * @see https://learn.microsoft.com/windows/win32/api/lmwksta/ns-lmwksta-wksta_user_info_0
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct WKSTA_USER_INFO_0 {
    #StructPack 8

    /**
     * Specifies the name of the user currently logged on to the workstation.
     * 
     * This string is Unicode if  <b>_WIN32_WINNT</b> or <b>FORCE_UNICODE</b> are defined.
     */
    wkui0_username : PWSTR

}

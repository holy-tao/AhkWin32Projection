#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * The WKSTA_USER_INFO_1101 structure contains information about the domains accessed by a workstation.
 * @see https://learn.microsoft.com/windows/win32/api/lmwksta/ns-lmwksta-wksta_user_info_1101
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct WKSTA_USER_INFO_1101 {
    #StructPack 8

    /**
     * Specifies the list of operating system domains browsed by the workstation. The domain names are separated by blanks.
     * 
     * This string is Unicode if  <b>_WIN32_WINNT</b> or <b>FORCE_UNICODE</b> are defined.
     */
    wkui1101_oth_domains : PWSTR

}

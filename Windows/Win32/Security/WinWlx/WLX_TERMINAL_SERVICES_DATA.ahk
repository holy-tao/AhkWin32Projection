#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Used to provide GINA with Terminal Services user configuration information.
 * @remarks
 * The Terminal Services user configuration information is received from the Domain Controller and SAM database.
 * @see https://learn.microsoft.com/windows/win32/api/winwlx/ns-winwlx-wlx_terminal_services_data
 * @namespace Windows.Win32.Security.WinWlx
 */
export default struct WLX_TERMINAL_SERVICES_DATA {
    #StructPack 2

    /**
     * Terminal Services profile path, overrides the standard profile path.
     */
    ProfilePath : WCHAR[257]

    /**
     * Terminal Services home directory, overrides standard home directory.
     */
    HomeDir : WCHAR[257]

    /**
     * Terminal Services home directory drive, overrides the standard drive.
     */
    HomeDirDrive : WCHAR[4]

}

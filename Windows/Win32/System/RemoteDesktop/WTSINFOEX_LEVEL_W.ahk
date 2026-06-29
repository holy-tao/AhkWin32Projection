#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WTS_CONNECTSTATE_CLASS.ahk" { WTS_CONNECTSTATE_CLASS }
#Import ".\WTSINFOEX_LEVEL1_W.ahk" { WTSINFOEX_LEVEL1_W }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Contains a WTSINFOEX_LEVEL1 structure that contains extended information about a Remote Desktop Services session. (Unicode)
 * @see https://learn.microsoft.com/windows/win32/api/wtsapi32/ns-wtsapi32-wtsinfoex_level_w
 * @namespace Windows.Win32.System.RemoteDesktop
 * @charset Unicode
 */
export default struct WTSINFOEX_LEVEL_W {
    #StructPack 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/ns-wtsapi32-wtsinfoex_level1_a">WTSINFOEX_LEVEL1</a> structure that contains extended session information.
     */
    WTSInfoExLevel1 : WTSINFOEX_LEVEL1_W

}

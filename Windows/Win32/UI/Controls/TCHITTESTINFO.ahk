#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\POINT.ahk" { POINT }
#Import ".\TCHITTESTINFO_FLAGS.ahk" { TCHITTESTINFO_FLAGS }

/**
 * Contains information about a hit test. This structure supersedes the TC_HITTESTINFO structure.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-tchittestinfo
 * @namespace Windows.Win32.UI.Controls
 */
export default struct TCHITTESTINFO {
    #StructPack 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a></b>
     * 
     * Position to hit test, in client coordinates.
     */
    pt : POINT

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     */
    flags : TCHITTESTINFO_FLAGS

}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\EDITBALLOONTIP_ICON.ahk" { EDITBALLOONTIP_ICON }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Contains information about a balloon tip associated with a button control.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-editballoontip
 * @namespace Windows.Win32.UI.Controls
 */
export default struct EDITBALLOONTIP {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * A <b>DWORD</b> that contains the size, in bytes, of the structure.
     */
    cbStruct : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCWSTR</a></b>
     * 
     * A pointer to a Unicode string that contains the title of the balloon tip.
     */
    pszTitle : PWSTR

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCWSTR</a></b>
     * 
     * A pointer to a Unicode string that contains the balloon tip text.
     */
    pszText : PWSTR

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">INT</a></b>
     */
    ttiIcon : EDITBALLOONTIP_ICON

}

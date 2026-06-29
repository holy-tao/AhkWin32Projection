#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Provides information about the title of a tooltip control.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-ttgettitle
 * @namespace Windows.Win32.UI.Controls
 */
export default struct TTGETTITLE {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * <b>DWORD</b> that specifies size of structure. Set to sizeof(TTGETTITLE).
     */
    dwSize : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * <b>UINT</b> that specifies the tooltip icon.
     */
    uTitleBitmap : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * <b>UINT</b> that specifies the number of characters in the title.
     */
    cch : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">WCHAR</a>*</b>
     * 
     * Pointer to a wide character string that contains the title.
     */
    pszTitle : PWSTR

}

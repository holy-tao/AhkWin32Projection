#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\COLORREF.ahk" { COLORREF }

/**
 * Contains color settings for a composition string.
 * @see https://learn.microsoft.com/windows/win32/api/richedit/ns-richedit-compcolor
 * @namespace Windows.Win32.UI.Controls.RichEdit
 */
export default struct COMPCOLOR {
    #StructPack 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">COLORREF</a></b>
     * 
     * Color of text. To generate a <a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a>, use the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-rgb">RGB</a> macro.
     */
    crText : COLORREF

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">COLORREF</a></b>
     * 
     * Color of background. To generate a <a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a>, use the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-rgb">RGB</a> macro.
     */
    crBackground : COLORREF

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Character effect values as described for the 
     * 					<b>dwEffects</b> member in the <a href="https://docs.microsoft.com/windows/win32/api/richedit/ns-richedit-charformata">CHARFORMAT</a> structure.
     */
    dwEffects : UInt32

}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\COLORREF.ahk" { COLORREF }

/**
 * Contains information for the drawing of buttons in a toolbar or rebar.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-colorscheme
 * @namespace Windows.Win32.UI.Controls
 */
export default struct COLORSCHEME {
    #StructPack 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * The size of this structure, in bytes.
     */
    dwSize : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">COLORREF</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a> value that represents the highlight color of the buttons. Use 
     * 					<b>CLR_DEFAULT</b> for the default highlight color.
     */
    clrBtnHighlight : COLORREF

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">COLORREF</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a> value that represents the shadow color of the buttons. Use 
     * 					<b>CLR_DEFAULT</b> for the default shadow color.
     */
    clrBtnShadow : COLORREF

}

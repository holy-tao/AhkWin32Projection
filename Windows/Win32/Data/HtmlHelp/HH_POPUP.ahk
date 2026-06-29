#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\POINT.ahk" { POINT }
#Import "..\..\Foundation\HINSTANCE.ahk" { HINSTANCE }
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import "..\..\Foundation\COLORREF.ahk" { COLORREF }

/**
 * Use this structure to specify or modify the attributes of a pop-up window.
 * @see https://learn.microsoft.com/windows/win32/api/htmlhelp/ns-htmlhelp-hh_popup
 * @namespace Windows.Win32.Data.HtmlHelp
 */
export default struct HH_POPUP {
    #StructPack 8

    /**
     * Specifies the size of the structure. This value must always be filled in before passing the structure to HtmlHelp().
     */
    cbStruct : Int32

    /**
     * Instance handle of the program or DLL to retrieve the string resource from. Ignored if <i>idString</i> is zero, or if <i>idString</i> specifies a file name.
     */
    hinst : HINSTANCE

    /**
     * Specifies zero, a resource ID, or a topic number in a text file.
     */
    idString : UInt32

    /**
     * Specifies the text to display if <i>idString</i> is zero.
     */
    pszText : IntPtr

    /**
     * Specifies (in pixels) where the top center of the pop-up window should be located.
     */
    pt : POINT

    /**
     * Specifies the RGB value to use for the foreground color of the pop-up window. To use the system color for the window text, specify -1.
     */
    clrForeground : COLORREF

    /**
     * Specifies the RGB value to use for the background color of the pop-up window. To use the system color for the window background, specify -1.
     */
    clrBackground : COLORREF

    /**
     * Specifies (in pixels) the margins to use on the left, top, right, and bottom sides of the pop-up window. The default for all rectangle members is -1.
     */
    rcMargins : RECT

    /**
     * Specifies the font attributes to use for the text in the pop-up window.
     * 
     * 
     * Use the following format to specify font family, point size, character set, and font format:
     * 
     * facename[, point size[, charset[ BOLD ITALIC UNDERLINE]]]
     * 
     * To omit an attribute, enter a comma. For example, to specify bold, 10-pt, MS Sans Serif font, <i>pszFont</i> would be:
     * 
     * MS Sans Serif, 10, , BOLD
     */
    pszFont : IntPtr

}

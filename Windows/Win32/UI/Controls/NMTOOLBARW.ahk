#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NMHDR.ahk" { NMHDR }
#Import ".\TBBUTTON.ahk" { TBBUTTON }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\RECT.ahk" { RECT }

/**
 * Contains information used to process toolbar notification codes. This structure supersedes the TBNOTIFY structure. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The commctrl.h header defines NMTOOLBAR as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-nmtoolbarw
 * @namespace Windows.Win32.UI.Controls
 * @charset Unicode
 */
export default struct NMTOOLBARW {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a> structure that contains additional information about the notification.
     */
    hdr : NMHDR

    /**
     * Type: <b>int</b>
     * 
     * Command identifier of the button associated with the notification code.
     */
    iItem : Int32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/commctrl/ns-commctrl-tbbutton">TBBUTTON</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/ns-commctrl-tbbutton">TBBUTTON</a> structure that contains information about the toolbar button associated with the notification code. This member only contains valid information with the <a href="https://docs.microsoft.com/windows/desktop/Controls/tbn-queryinsert">TBN_QUERYINSERT</a> and <a href="https://docs.microsoft.com/windows/desktop/Controls/tbn-querydelete">TBN_QUERYDELETE</a> notification codes.
     */
    tbButton : TBBUTTON

    /**
     * Type: <b>int</b>
     * 
     * Count of characters in the button text.
     */
    cchText : Int32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPTSTR</a></b>
     * 
     * Address of a character buffer that contains the button text.
     */
    pszText : PWSTR

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/common-control-versions">Version 5.80.</a> A <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that defines the area covered by the button.
     */
    rcButton : RECT

}

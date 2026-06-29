#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\UI\Controls\NMHDR.ahk" { NMHDR }
#Import ".\HH_WINTYPE.ahk" { HH_WINTYPE }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * This structure returns the file name of the current topic and a constant that specifies the user action that is about to occur, such as hiding the Navigation pane by clicking the Hide button on the toolbar.
 * @see https://learn.microsoft.com/windows/win32/api/htmlhelp/ns-htmlhelp-hhntrack
 * @namespace Windows.Win32.Data.HtmlHelp
 */
export default struct HHNTRACK {
    #StructPack 8

    /**
     * Standard <b>WM_NOTIFY</b> header.
     */
    hdr : NMHDR

    /**
     * A multi-byte, zero-terminated string that specifies the current topic (before the action is taken).
     */
    pszCurUrl : PSTR

    /**
     * Specifies the action the user is about to take. This is an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/htmlhelp/idaction-member">HHACT_</a> constant.
     */
    idAction : Int32

    /**
     * A pointer to the current <a href="https://docs.microsoft.com/windows/desktop/api/htmlhelp/ns-htmlhelp-hh_wintype">HH_WINTYPE</a> structure.
     */
    phhWinType : HH_WINTYPE.Ptr

}

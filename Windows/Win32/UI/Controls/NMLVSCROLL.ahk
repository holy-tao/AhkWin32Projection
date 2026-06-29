#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NMHDR.ahk" { NMHDR }
#Import "..\..\Foundation\HWND.ahk" { HWND }

/**
 * Provides information about a scrolling operation.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-nmlvscroll
 * @namespace Windows.Win32.UI.Controls
 */
export default struct NMLVSCROLL {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a> structure that contains information about a <a href="https://docs.microsoft.com/windows/desktop/Controls/lvn-endscroll">LVN_ENDSCROLL</a> or a <a href="https://docs.microsoft.com/windows/desktop/Controls/lvn-beginscroll">LVN_BEGINSCROLL</a> notification code.
     */
    hdr : NMHDR

    /**
     * Type: <b>int</b>
     * 
     * Value of type <b>int</b> that specifies in pixels the horizontal position where a scrolling operation should begin or end.
     */
    dx : Int32

    /**
     * Type: <b>int</b>
     * 
     * Value of type <b>int</b> that specifies in pixels the vertical position where a scrolling operation should begin or end.
     */
    dy : Int32

}

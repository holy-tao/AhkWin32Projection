#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NMHDR.ahk" { NMHDR }
#Import "..\..\Foundation\HWND.ahk" { HWND }

/**
 * Contains information used to update the cached item information for use with a virtual list view.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-nmlvcachehint
 * @namespace Windows.Win32.UI.Controls
 */
export default struct NMLVCACHEHINT {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a> structure that contains information about this notification message.
     */
    hdr : NMHDR

    /**
     * Type: <b>int</b>
     * 
     * Starting index of the requested range of items. This value is inclusive.
     */
    iFrom : Int32

    /**
     * Type: <b>int</b>
     * 
     * Ending index of the requested range of items. This value is inclusive.
     */
    iTo : Int32

}

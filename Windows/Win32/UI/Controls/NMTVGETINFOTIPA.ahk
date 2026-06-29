#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import ".\NMHDR.ahk" { NMHDR }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import ".\HTREEITEM.ahk" { HTREEITEM }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Contains and receives tree-view item information needed to display a tooltip for an item. This structure is used with the TVN_GETINFOTIP notification code. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The commctrl.h header defines NMTVGETINFOTIP as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-nmtvgetinfotipa
 * @namespace Windows.Win32.UI.Controls
 * @charset ANSI
 */
export default struct NMTVGETINFOTIPA {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a> structure that contains information about this notification.
     */
    hdr : NMHDR

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPTSTR</a></b>
     * 
     * Address of a character buffer that contains the text to be displayed. If you want to change the text displayed in the tooltip, you will need to modify the contents of this buffer. The size of this buffer is specified by the 
     * 					<b>cchTextMax</b> structure.
     */
    pszText : PSTR

    /**
     * Type: <b>int</b>
     * 
     * Size of the buffer at 
     * 					<b>pszText</b>, in characters. Although you should never assume that this buffer will be of any particular size, the INFOTIPSIZE value can be used for design purposes.
     */
    cchTextMax : Int32

    /**
     * Type: <b>HTREEITEM</b>
     * 
     * Tree handle to the item for which the tooltip is being displayed.
     */
    hItem : HTREEITEM

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPARAM</a></b>
     * 
     * Application-defined data associated with the item for which the tooltip is being displayed.
     */
    lParam : LPARAM

}

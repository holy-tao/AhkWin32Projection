#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import ".\TVITEMEXA.ahk" { TVITEMEXA }
#Import ".\NMHDR.ahk" { NMHDR }
#Import ".\TVITEMEXW_CHILDREN.ahk" { TVITEMEXW_CHILDREN }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import ".\HTREEITEM.ahk" { HTREEITEM }
#Import ".\TVITEM_MASK.ahk" { TVITEM_MASK }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Contains information pertaining to extended TreeView notification information. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The commctrl.h header defines NMTVDISPINFOEX as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-nmtvdispinfoexa
 * @namespace Windows.Win32.UI.Controls
 * @charset ANSI
 */
export default struct NMTVDISPINFOEXA {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a> structure that contains information about this notification.
     */
    hdr : NMHDR

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/commctrl/ns-commctrl-tvitemexa">TVITEMEX</a></b>
     * 
     * Specifies or receives attributes of a TreeView item.
     */
    item : TVITEMEXA

}

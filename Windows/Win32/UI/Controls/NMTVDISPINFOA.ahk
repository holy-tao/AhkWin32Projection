#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\TVITEMA.ahk" { TVITEMA }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import ".\TVITEM_MASK.ahk" { TVITEM_MASK }
#Import ".\TREE_VIEW_ITEM_STATE_FLAGS.ahk" { TREE_VIEW_ITEM_STATE_FLAGS }
#Import ".\HTREEITEM.ahk" { HTREEITEM }
#Import ".\NMHDR.ahk" { NMHDR }
#Import ".\TVITEMEXW_CHILDREN.ahk" { TVITEMEXW_CHILDREN }

/**
 * Contains and receives display information for a tree-view item. This structure is identical to the TV_DISPINFO structure, but it has been renamed to follow current naming conventions. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The commctrl.h header defines NMTVDISPINFO as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-nmtvdispinfoa
 * @namespace Windows.Win32.UI.Controls
 * @charset ANSI
 */
export default struct NMTVDISPINFOA {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a> structure that contains information about this notification.
     */
    hdr : NMHDR

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/commctrl/ns-commctrl-tvitema">TVITEM</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/ns-commctrl-tvitema">TVITEM</a> structure that identifies and contains information about the tree-view item. The
     */
    item : TVITEMA

}

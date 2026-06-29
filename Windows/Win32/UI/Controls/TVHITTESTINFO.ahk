#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\TVHITTESTINFO_FLAGS.ahk" { TVHITTESTINFO_FLAGS }
#Import "..\..\Foundation\POINT.ahk" { POINT }
#Import ".\HTREEITEM.ahk" { HTREEITEM }

/**
 * Contains information used to determine the location of a point relative to a tree-view control.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-tvhittestinfo
 * @namespace Windows.Win32.UI.Controls
 */
export default struct TVHITTESTINFO {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a></b>
     * 
     * Client coordinates of the point to test.
     */
    pt : POINT

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     */
    flags : TVHITTESTINFO_FLAGS

    /**
     * Type: <b>HTREEITEM</b>
     * 
     * Handle to the item that occupies the point.
     */
    hItem : HTREEITEM

}

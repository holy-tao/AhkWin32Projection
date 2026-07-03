#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\POINT.ahk" { POINT }
#Import ".\LVHITTESTINFO_FLAGS.ahk" { LVHITTESTINFO_FLAGS }

/**
 * Contains information about a hit test.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-lvhittestinfo
 * @namespace Windows.Win32.UI.Controls
 */
export default struct LVHITTESTINFO {
    #StructPack 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a></b>
     * 
     * The position to hit test, in client coordinates.
     */
    pt : POINT

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     */
    flags : LVHITTESTINFO_FLAGS

    /**
     * Type: <b>int</b>
     * 
     * Receives the index of the matching item. Or if hit-testing a subitem, this value represents the subitem's parent item.
     */
    iItem : Int32

    /**
     * Type: <b>int</b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/common-control-versions">Version 4.70</a>. Receives the index of the matching subitem. When hit-testing an item, this member will be zero.
     */
    iSubItem : Int32

    /**
     * Type: <b>int</b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/common-control-versions">Windows Vista</a>. Group index of the item hit (read only). Valid only for owner data. If the point is within an item that is displayed in multiple groups then <b>iGroup</b> will specify the group index of the item.
     */
    iGroup : Int32

}

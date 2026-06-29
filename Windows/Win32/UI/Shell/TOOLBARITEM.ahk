#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import ".\IDockingWindow.ahk" { IDockingWindow }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Graphics\Gdi\HMONITOR.ahk" { HMONITOR }

/**
 * Deprecated. Data used in IBrowserService2::_GetToolbarItem, IBrowserService2::v_MayGetNextToolbarFocus, and IBrowserService2::_SetFocus to define a toolbar item.
 * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/ns-shdeprecated-toolbaritem
 * @namespace Windows.Win32.UI.Shell
 */
export default struct TOOLBARITEM {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-idockingwindow">IDockingWindow</a>*</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-idockingwindow">IDockingWindow</a> of the item's particular toolbar.
     */
    ptbar : IDockingWindow

    /**
     * Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/cc136564(v=vs.85)">BORDERWIDTHS</a></b>
     * 
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/cc136564(v=vs.85)">BORDERWIDTHS</a> structure that contains the dimensions of the item, including its borders.
     */
    rcBorderTool : RECT

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to a buffer that contains the name of the toolbar item as a Unicode string.
     */
    pwszItem : PWSTR

    /**
     * Type: <b>BOOL</b>
     * 
     * <b>TRUE</b> if the toolbar item is currently visible; otherwise, <b>FALSE</b>.
     */
    fShow : BOOL

    /**
     * Type: <b>HMONITOR</b>
     * 
     * The handle of the monitor on which the toolbar item appears.
     */
    hMon : HMONITOR

}

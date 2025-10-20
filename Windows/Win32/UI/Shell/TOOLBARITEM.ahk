#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\RECT.ahk
#Include ..\..\Graphics\Gdi\HMONITOR.ahk

/**
 * Deprecated. Data used in IBrowserService2::_GetToolbarItem, IBrowserService2::v_MayGetNextToolbarFocus, and IBrowserService2::_SetFocus to define a toolbar item.
 * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/ns-shdeprecated-toolbaritem
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class TOOLBARITEM extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-idockingwindow">IDockingWindow</a>*</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-idockingwindow">IDockingWindow</a> of the item's particular toolbar.
     * @type {IDockingWindow}
     */
    ptbar {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/cc136564(v=vs.85)">BORDERWIDTHS</a></b>
     * 
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/cc136564(v=vs.85)">BORDERWIDTHS</a> structure that contains the dimensions of the item, including its borders.
     * @type {RECT}
     */
    rcBorderTool{
        get {
            if(!this.HasProp("__rcBorderTool"))
                this.__rcBorderTool := RECT(8, this)
            return this.__rcBorderTool
        }
    }

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to a buffer that contains the name of the toolbar item as a Unicode string.
     * @type {PWSTR}
     */
    pwszItem {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * <b>TRUE</b> if the toolbar item is currently visible; otherwise, <b>FALSE</b>.
     * @type {BOOL}
     */
    fShow {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * Type: <b>HMONITOR</b>
     * 
     * The handle of the monitor on which the toolbar item appears.
     * @type {HMONITOR}
     */
    hMon{
        get {
            if(!this.HasProp("__hMon"))
                this.__hMon := HMONITOR(40, this)
            return this.__hMon
        }
    }
}

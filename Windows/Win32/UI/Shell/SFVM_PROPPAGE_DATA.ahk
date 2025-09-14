#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the details of a page to be added to an object's Properties sheet.
 * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-sfvm_proppage_data
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class SFVM_PROPPAGE_DATA extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Type: <b>DWORD</b>
     * @type {Integer}
     */
    dwReserved {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>LPFNADDPROPSHEETPAGE</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/prsht/nc-prsht-lpfnaddpropsheetpage">AddPropSheetPageProc</a> callback function used to add property pages. When this function is used by Windows Explorer, it provides <b>pfn</b> through the system folder view object's <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellview-addpropertysheetpages">IShellView::AddPropertySheetPages</a> method. The callback function can then pass the information to <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellpropsheetext-addpages">IShellPropSheetExt::AddPages</a>.
     * @type {Pointer<LPFNSVADDPROPSHEETPAGE>}
     */
    pfn {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: <b>LPARAM</b>
     * 
     * The details of the property sheet to be added. When this function is used by Windows Explorer, it provides <b>lParam</b> through the system folder view object's <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellview-addpropertysheetpages">IShellView::AddPropertySheetPages</a> method. The callback function can then pass the information to <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellpropsheetext-addpages">IShellPropSheetExt::AddPages</a>.
     * @type {Pointer}
     */
    lParam {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}

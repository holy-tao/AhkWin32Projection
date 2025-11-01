#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that allow a property sheet handler to add or replace pages in the property sheet displayed for a file object.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-ishellpropsheetext
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IShellPropSheetExt extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IShellPropSheetExt
     * @type {Guid}
     */
    static IID => Guid("{000214e9-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddPages", "ReplacePage"]

    /**
     * 
     * @param {Pointer<LPFNSVADDPROPSHEETPAGE>} pfnAddPage 
     * @param {LPARAM} lParam 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellpropsheetext-addpages
     */
    AddPages(pfnAddPage, lParam) {
        result := ComCall(3, this, "ptr", pfnAddPage, "ptr", lParam, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} uPageID 
     * @param {Pointer<LPFNSVADDPROPSHEETPAGE>} pfnReplaceWith 
     * @param {LPARAM} lParam 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellpropsheetext-replacepage
     */
    ReplacePage(uPageID, pfnReplaceWith, lParam) {
        result := ComCall(4, this, "uint", uPageID, "ptr", pfnReplaceWith, "ptr", lParam, "HRESULT")
        return result
    }
}

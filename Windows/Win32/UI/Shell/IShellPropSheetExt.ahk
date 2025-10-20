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
     * 
     * @param {Pointer<LPFNSVADDPROPSHEETPAGE>} pfnAddPage 
     * @param {LPARAM} lParam 
     * @returns {HRESULT} 
     */
    AddPages(pfnAddPage, lParam) {
        result := ComCall(3, this, "ptr", pfnAddPage, "ptr", lParam, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} uPageID 
     * @param {Pointer<LPFNSVADDPROPSHEETPAGE>} pfnReplaceWith 
     * @param {LPARAM} lParam 
     * @returns {HRESULT} 
     */
    ReplacePage(uPageID, pfnReplaceWith, lParam) {
        result := ComCall(4, this, "uint", uPageID, "ptr", pfnReplaceWith, "ptr", lParam, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

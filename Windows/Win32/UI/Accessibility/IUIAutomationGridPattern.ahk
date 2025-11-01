#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to a control that acts as a container for a collection of child controls that are organized in a two-dimensional logical coordinate system that can be traversed by row and column.
 * @remarks
 * 
  * This interface does not support active manipulation of a grid; the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationtransformpattern">IUIAutomationTransformPattern</a> interface is required for this functionality.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nn-uiautomationclient-iuiautomationgridpattern
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IUIAutomationGridPattern extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIAutomationGridPattern
     * @type {Guid}
     */
    static IID => Guid("{414c3cdc-856b-4f5b-8538-3131c6302550}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetItem", "get_CurrentRowCount", "get_CurrentColumnCount", "get_CachedRowCount", "get_CachedColumnCount"]

    /**
     * 
     * @param {Integer} row 
     * @param {Integer} column 
     * @param {Pointer<IUIAutomationElement>} element 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationgridpattern-getitem
     */
    GetItem(row, column, element) {
        result := ComCall(3, this, "int", row, "int", column, "ptr*", element, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationgridpattern-get_currentrowcount
     */
    get_CurrentRowCount(retVal) {
        retValMarshal := retVal is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, retValMarshal, retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationgridpattern-get_currentcolumncount
     */
    get_CurrentColumnCount(retVal) {
        retValMarshal := retVal is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, retValMarshal, retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationgridpattern-get_cachedrowcount
     */
    get_CachedRowCount(retVal) {
        retValMarshal := retVal is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, retValMarshal, retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationgridpattern-get_cachedcolumncount
     */
    get_CachedColumnCount(retVal) {
        retValMarshal := retVal is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, retValMarshal, retVal, "HRESULT")
        return result
    }
}

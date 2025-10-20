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
     * 
     * @param {Integer} row 
     * @param {Integer} column 
     * @param {Pointer<IUIAutomationElement>} element 
     * @returns {HRESULT} 
     */
    GetItem(row, column, element) {
        result := ComCall(3, this, "int", row, "int", column, "ptr", element, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} retVal 
     * @returns {HRESULT} 
     */
    get_CurrentRowCount(retVal) {
        result := ComCall(4, this, "int*", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} retVal 
     * @returns {HRESULT} 
     */
    get_CurrentColumnCount(retVal) {
        result := ComCall(5, this, "int*", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} retVal 
     * @returns {HRESULT} 
     */
    get_CachedRowCount(retVal) {
        result := ComCall(6, this, "int*", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} retVal 
     * @returns {HRESULT} 
     */
    get_CachedColumnCount(retVal) {
        result := ComCall(7, this, "int*", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

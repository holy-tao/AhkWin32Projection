#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUIAutomationElement.ahk
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
     * @type {Integer} 
     */
    CurrentRowCount {
        get => this.get_CurrentRowCount()
    }

    /**
     * @type {Integer} 
     */
    CurrentColumnCount {
        get => this.get_CurrentColumnCount()
    }

    /**
     * @type {Integer} 
     */
    CachedRowCount {
        get => this.get_CachedRowCount()
    }

    /**
     * @type {Integer} 
     */
    CachedColumnCount {
        get => this.get_CachedColumnCount()
    }

    /**
     * Retrieves a UI Automation element representing an item in the grid.
     * @param {Integer} row Type: <b>int</b>
     * 
     * The zero-based index of the row.
     * @param {Integer} column Type: <b>int</b>
     * 
     * The zero-based index of the column.
     * @returns {IUIAutomationElement} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement">IUIAutomationElement</a>**</b>
     * 
     * Receives a pointer to the element representing the grid item.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationgridpattern-getitem
     */
    GetItem(row, column) {
        result := ComCall(3, this, "int", row, "int", column, "ptr*", &element := 0, "HRESULT")
        return IUIAutomationElement(element)
    }

    /**
     * Retrieves the number of rows in the grid.
     * @remarks
     * 
     * Hidden rows and columns, depending on the provider implementation, may be loaded in the Microsoft UI Automation tree and will therefore be reflected in the row count and column count properties. If the hidden rows and columns have not yet been loaded they are not counted.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationgridpattern-get_currentrowcount
     */
    get_CurrentRowCount() {
        result := ComCall(4, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * The number of columns in the grid.
     * @remarks
     * 
     * Hidden rows and columns, depending on the provider implementation, may be loaded in the Microsoft UI Automation tree and will therefore be reflected in the row count and column count properties. If the hidden rows and columns have not yet been loaded they are not counted.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationgridpattern-get_currentcolumncount
     */
    get_CurrentColumnCount() {
        result := ComCall(5, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the cached number of rows in the grid.
     * @remarks
     * 
     * Hidden rows and columns, depending on the provider implementation, may be loaded in the Microsoft UI Automation tree and will therefore be reflected in the row count and column count properties. If the hidden rows and columns have not yet been loaded they are not counted.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationgridpattern-get_cachedrowcount
     */
    get_CachedRowCount() {
        result := ComCall(6, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the cached number of columns in the grid.
     * @remarks
     * 
     * Hidden rows and columns, depending on the provider implementation, may be loaded in the Microsoft UI Automation tree and will therefore be reflected in the row count and column count properties. If the hidden rows and columns have not yet been loaded they are not counted.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationgridpattern-get_cachedcolumncount
     */
    get_CachedColumnCount() {
        result := ComCall(7, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }
}

#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IUIAutomationElement.ahk" { IUIAutomationElement }

/**
 * Provides access to a control that acts as a container for a collection of child controls that are organized in a two-dimensional logical coordinate system that can be traversed by row and column.
 * @remarks
 * This interface does not support active manipulation of a grid; the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationtransformpattern">IUIAutomationTransformPattern</a> interface is required for this functionality.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nn-uiautomationclient-iuiautomationgridpattern
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IUIAutomationGridPattern extends IUnknown {
    /**
     * The interface identifier for IUIAutomationGridPattern
     * @type {Guid}
     */
    static IID := Guid("{414c3cdc-856b-4f5b-8538-3131c6302550}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUIAutomationGridPattern interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetItem                : IntPtr
        get_CurrentRowCount    : IntPtr
        get_CurrentColumnCount : IntPtr
        get_CachedRowCount     : IntPtr
        get_CachedColumnCount  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUIAutomationGridPattern.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @param {Integer} _column Type: <b>int</b>
     * 
     * The zero-based index of the column.
     * @returns {IUIAutomationElement} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement">IUIAutomationElement</a>**</b>
     * 
     * Receives a pointer to the element representing the grid item.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationgridpattern-getitem
     */
    GetItem(row, _column) {
        result := ComCall(3, this, "int", row, "int", _column, "ptr*", &element := 0, "HRESULT")
        return IUIAutomationElement(element)
    }

    /**
     * Retrieves the number of rows in the grid.
     * @remarks
     * Hidden rows and columns, depending on the provider implementation, may be loaded in the Microsoft UI Automation tree and will therefore be reflected in the row count and column count properties. If the hidden rows and columns have not yet been loaded they are not counted.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationgridpattern-get_currentrowcount
     */
    get_CurrentRowCount() {
        result := ComCall(4, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * The number of columns in the grid.
     * @remarks
     * Hidden rows and columns, depending on the provider implementation, may be loaded in the Microsoft UI Automation tree and will therefore be reflected in the row count and column count properties. If the hidden rows and columns have not yet been loaded they are not counted.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationgridpattern-get_currentcolumncount
     */
    get_CurrentColumnCount() {
        result := ComCall(5, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the cached number of rows in the grid.
     * @remarks
     * Hidden rows and columns, depending on the provider implementation, may be loaded in the Microsoft UI Automation tree and will therefore be reflected in the row count and column count properties. If the hidden rows and columns have not yet been loaded they are not counted.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationgridpattern-get_cachedrowcount
     */
    get_CachedRowCount() {
        result := ComCall(6, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the cached number of columns in the grid.
     * @remarks
     * Hidden rows and columns, depending on the provider implementation, may be loaded in the Microsoft UI Automation tree and will therefore be reflected in the row count and column count properties. If the hidden rows and columns have not yet been loaded they are not counted.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationgridpattern-get_cachedcolumncount
     */
    get_CachedColumnCount() {
        result := ComCall(7, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    Query(iid) {
        if (IUIAutomationGridPattern.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetItem := CallbackCreate(GetMethod(implObj, "GetItem"), flags, 4)
        this.vtbl.get_CurrentRowCount := CallbackCreate(GetMethod(implObj, "get_CurrentRowCount"), flags, 2)
        this.vtbl.get_CurrentColumnCount := CallbackCreate(GetMethod(implObj, "get_CurrentColumnCount"), flags, 2)
        this.vtbl.get_CachedRowCount := CallbackCreate(GetMethod(implObj, "get_CachedRowCount"), flags, 2)
        this.vtbl.get_CachedColumnCount := CallbackCreate(GetMethod(implObj, "get_CachedColumnCount"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetItem)
        CallbackFree(this.vtbl.get_CurrentRowCount)
        CallbackFree(this.vtbl.get_CurrentColumnCount)
        CallbackFree(this.vtbl.get_CachedRowCount)
        CallbackFree(this.vtbl.get_CachedColumnCount)
    }
}

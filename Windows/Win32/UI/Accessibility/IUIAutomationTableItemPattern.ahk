#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IUIAutomationElementArray.ahk" { IUIAutomationElementArray }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides access to a child element in a container that supports IUIAutomationTablePattern.
 * @remarks
 * Elements that support this interface must also support <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationgriditempattern">IUIAutomationGridItemPattern</a>, to provide properties that are not specific to tables.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nn-uiautomationclient-iuiautomationtableitempattern
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IUIAutomationTableItemPattern extends IUnknown {
    /**
     * The interface identifier for IUIAutomationTableItemPattern
     * @type {Guid}
     */
    static IID := Guid("{0b964eb3-ef2e-4464-9c79-61d61737a27e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUIAutomationTableItemPattern interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetCurrentRowHeaderItems    : IntPtr
        GetCurrentColumnHeaderItems : IntPtr
        GetCachedRowHeaderItems     : IntPtr
        GetCachedColumnHeaderItems  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUIAutomationTableItemPattern.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the row headers associated with a table item or cell.
     * @returns {IUIAutomationElementArray} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelementarray">IUIAutomationElementArray</a>**</b>
     * 
     * Receives a pointer to the collection of row headers.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtableitempattern-getcurrentrowheaderitems
     */
    GetCurrentRowHeaderItems() {
        result := ComCall(3, this, "ptr*", &retVal := 0, "HRESULT")
        return IUIAutomationElementArray(retVal)
    }

    /**
     * Retrieves the column headers associated with a table item or cell.
     * @returns {IUIAutomationElementArray} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelementarray">IUIAutomationElementArray</a>**</b>
     * 
     * Receives a pointer to the collection of column headers.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtableitempattern-getcurrentcolumnheaderitems
     */
    GetCurrentColumnHeaderItems() {
        result := ComCall(4, this, "ptr*", &retVal := 0, "HRESULT")
        return IUIAutomationElementArray(retVal)
    }

    /**
     * Retrieves the cached row headers associated with a table item or cell.
     * @returns {IUIAutomationElementArray} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelementarray">IUIAutomationElementArray</a>**</b>
     * 
     * Receives a pointer to the collection of cached row headers.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtableitempattern-getcachedrowheaderitems
     */
    GetCachedRowHeaderItems() {
        result := ComCall(5, this, "ptr*", &retVal := 0, "HRESULT")
        return IUIAutomationElementArray(retVal)
    }

    /**
     * Retrieves the cached column headers associated with a table item or cell.
     * @returns {IUIAutomationElementArray} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelementarray">IUIAutomationElementArray</a>**</b>
     * 
     * Receives a pointer to the collection of cached column headers.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtableitempattern-getcachedcolumnheaderitems
     */
    GetCachedColumnHeaderItems() {
        result := ComCall(6, this, "ptr*", &retVal := 0, "HRESULT")
        return IUIAutomationElementArray(retVal)
    }

    Query(iid) {
        if (IUIAutomationTableItemPattern.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetCurrentRowHeaderItems := CallbackCreate(GetMethod(implObj, "GetCurrentRowHeaderItems"), flags, 2)
        this.vtbl.GetCurrentColumnHeaderItems := CallbackCreate(GetMethod(implObj, "GetCurrentColumnHeaderItems"), flags, 2)
        this.vtbl.GetCachedRowHeaderItems := CallbackCreate(GetMethod(implObj, "GetCachedRowHeaderItems"), flags, 2)
        this.vtbl.GetCachedColumnHeaderItems := CallbackCreate(GetMethod(implObj, "GetCachedColumnHeaderItems"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetCurrentRowHeaderItems)
        CallbackFree(this.vtbl.GetCurrentColumnHeaderItems)
        CallbackFree(this.vtbl.GetCachedRowHeaderItems)
        CallbackFree(this.vtbl.GetCachedColumnHeaderItems)
    }
}

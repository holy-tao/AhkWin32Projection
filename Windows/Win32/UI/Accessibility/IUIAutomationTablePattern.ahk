#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IUIAutomationElementArray.ahk" { IUIAutomationElementArray }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\RowOrColumnMajor.ahk" { RowOrColumnMajor }

/**
 * Provides access to a control that acts as a container for a collection of child elements.
 * @remarks
 * This control pattern is analogous to <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationgridpattern">IUIAutomationGridPattern</a> with the distinction that any control that supports <b>IUIAutomationTablePattern</b> also exposes a column or row header relationship, or both, for each child element. Controls that support the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-implementingtableitem">Table</a> control pattern also support the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-implementinggrid">Grid</a> control pattern in order to provide access to the inherent grid functionality of a table.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nn-uiautomationclient-iuiautomationtablepattern
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IUIAutomationTablePattern extends IUnknown {
    /**
     * The interface identifier for IUIAutomationTablePattern
     * @type {Guid}
     */
    static IID := Guid("{620e691c-ea96-4710-a850-754b24ce2417}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUIAutomationTablePattern interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetCurrentRowHeaders        : IntPtr
        GetCurrentColumnHeaders     : IntPtr
        get_CurrentRowOrColumnMajor : IntPtr
        GetCachedRowHeaders         : IntPtr
        GetCachedColumnHeaders      : IntPtr
        get_CachedRowOrColumnMajor  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUIAutomationTablePattern.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {RowOrColumnMajor} 
     */
    CurrentRowOrColumnMajor {
        get => this.get_CurrentRowOrColumnMajor()
    }

    /**
     * @type {RowOrColumnMajor} 
     */
    CachedRowOrColumnMajor {
        get => this.get_CachedRowOrColumnMajor()
    }

    /**
     * Retrieves a collection of UI Automation elements representing all the row headers in a table.
     * @returns {IUIAutomationElementArray} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelementarray">IUIAutomationElementArray</a>**</b>
     * 
     * Receives a pointer to the collection of row headers. The default is an empty array.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtablepattern-getcurrentrowheaders
     */
    GetCurrentRowHeaders() {
        result := ComCall(3, this, "ptr*", &retVal := 0, "HRESULT")
        return IUIAutomationElementArray(retVal)
    }

    /**
     * Retrieves a collection of UI Automation elements representing all the column headers in a table.
     * @returns {IUIAutomationElementArray} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelementarray">IUIAutomationElementArray</a>**</b>
     * 
     * Receives a pointer to the collection of column headers. The default is an empty array.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtablepattern-getcurrentcolumnheaders
     */
    GetCurrentColumnHeaders() {
        result := ComCall(4, this, "ptr*", &retVal := 0, "HRESULT")
        return IUIAutomationElementArray(retVal)
    }

    /**
     * Retrieves the primary direction of traversal for the table.
     * @returns {RowOrColumnMajor} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtablepattern-get_currentroworcolumnmajor
     */
    get_CurrentRowOrColumnMajor() {
        result := ComCall(5, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves a cached collection of UI Automation elements representing all the row headers in a table.
     * @returns {IUIAutomationElementArray} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelementarray">IUIAutomationElementArray</a>**</b>
     * 
     * Receives a pointer to the collection of cached row headers. The default is an empty array.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtablepattern-getcachedrowheaders
     */
    GetCachedRowHeaders() {
        result := ComCall(6, this, "ptr*", &retVal := 0, "HRESULT")
        return IUIAutomationElementArray(retVal)
    }

    /**
     * Retrieves a cached collection of UI Automation elements representing all the column headers in a table.
     * @returns {IUIAutomationElementArray} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelementarray">IUIAutomationElementArray</a>**</b>
     * 
     * Receives a pointer to the collection of cached column headers. The default is an empty array.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtablepattern-getcachedcolumnheaders
     */
    GetCachedColumnHeaders() {
        result := ComCall(7, this, "ptr*", &retVal := 0, "HRESULT")
        return IUIAutomationElementArray(retVal)
    }

    /**
     * Retrieves the cached primary direction of traversal for the table.
     * @returns {RowOrColumnMajor} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtablepattern-get_cachedroworcolumnmajor
     */
    get_CachedRowOrColumnMajor() {
        result := ComCall(8, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    Query(iid) {
        if (IUIAutomationTablePattern.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetCurrentRowHeaders := CallbackCreate(GetMethod(implObj, "GetCurrentRowHeaders"), flags, 2)
        this.vtbl.GetCurrentColumnHeaders := CallbackCreate(GetMethod(implObj, "GetCurrentColumnHeaders"), flags, 2)
        this.vtbl.get_CurrentRowOrColumnMajor := CallbackCreate(GetMethod(implObj, "get_CurrentRowOrColumnMajor"), flags, 2)
        this.vtbl.GetCachedRowHeaders := CallbackCreate(GetMethod(implObj, "GetCachedRowHeaders"), flags, 2)
        this.vtbl.GetCachedColumnHeaders := CallbackCreate(GetMethod(implObj, "GetCachedColumnHeaders"), flags, 2)
        this.vtbl.get_CachedRowOrColumnMajor := CallbackCreate(GetMethod(implObj, "get_CachedRowOrColumnMajor"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetCurrentRowHeaders)
        CallbackFree(this.vtbl.GetCurrentColumnHeaders)
        CallbackFree(this.vtbl.get_CurrentRowOrColumnMajor)
        CallbackFree(this.vtbl.GetCachedRowHeaders)
        CallbackFree(this.vtbl.GetCachedColumnHeaders)
        CallbackFree(this.vtbl.get_CachedRowOrColumnMajor)
    }
}

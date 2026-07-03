#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IUIAutomationElement.ahk" { IUIAutomationElement }

/**
 * Provides access to a child control in a grid-style container that supports the IUIAutomationGridPattern interface.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nn-uiautomationclient-iuiautomationgriditempattern
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IUIAutomationGridItemPattern extends IUnknown {
    /**
     * The interface identifier for IUIAutomationGridItemPattern
     * @type {Guid}
     */
    static IID := Guid("{78f8ef57-66c3-4e09-bd7c-e79b2004894d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUIAutomationGridItemPattern interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_CurrentContainingGrid : IntPtr
        get_CurrentRow            : IntPtr
        get_CurrentColumn         : IntPtr
        get_CurrentRowSpan        : IntPtr
        get_CurrentColumnSpan     : IntPtr
        get_CachedContainingGrid  : IntPtr
        get_CachedRow             : IntPtr
        get_CachedColumn          : IntPtr
        get_CachedRowSpan         : IntPtr
        get_CachedColumnSpan      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUIAutomationGridItemPattern.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IUIAutomationElement} 
     */
    CurrentContainingGrid {
        get => this.get_CurrentContainingGrid()
    }

    /**
     * @type {Integer} 
     */
    CurrentRow {
        get => this.get_CurrentRow()
    }

    /**
     * @type {Integer} 
     */
    CurrentColumn {
        get => this.get_CurrentColumn()
    }

    /**
     * @type {Integer} 
     */
    CurrentRowSpan {
        get => this.get_CurrentRowSpan()
    }

    /**
     * @type {Integer} 
     */
    CurrentColumnSpan {
        get => this.get_CurrentColumnSpan()
    }

    /**
     * @type {IUIAutomationElement} 
     */
    CachedContainingGrid {
        get => this.get_CachedContainingGrid()
    }

    /**
     * @type {Integer} 
     */
    CachedRow {
        get => this.get_CachedRow()
    }

    /**
     * @type {Integer} 
     */
    CachedColumn {
        get => this.get_CachedColumn()
    }

    /**
     * @type {Integer} 
     */
    CachedRowSpan {
        get => this.get_CachedRowSpan()
    }

    /**
     * @type {Integer} 
     */
    CachedColumnSpan {
        get => this.get_CachedColumnSpan()
    }

    /**
     * Retrieves the element that contains the grid item.
     * @returns {IUIAutomationElement} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationgriditempattern-get_currentcontaininggrid
     */
    get_CurrentContainingGrid() {
        result := ComCall(3, this, "ptr*", &retVal := 0, "HRESULT")
        return IUIAutomationElement(retVal)
    }

    /**
     * Retrieves the zero-based index of the row that contains the grid item.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationgriditempattern-get_currentrow
     */
    get_CurrentRow() {
        result := ComCall(4, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the zero-based index of the column that contains the item.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationgriditempattern-get_currentcolumn
     */
    get_CurrentColumn() {
        result := ComCall(5, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the number of rows spanned by the grid item.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationgriditempattern-get_currentrowspan
     */
    get_CurrentRowSpan() {
        result := ComCall(6, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the number of columns spanned by the grid item.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationgriditempattern-get_currentcolumnspan
     */
    get_CurrentColumnSpan() {
        result := ComCall(7, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the cached element that contains the grid item.
     * @returns {IUIAutomationElement} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationgriditempattern-get_cachedcontaininggrid
     */
    get_CachedContainingGrid() {
        result := ComCall(8, this, "ptr*", &retVal := 0, "HRESULT")
        return IUIAutomationElement(retVal)
    }

    /**
     * Retrieves the cached zero-based index of the row that contains the item.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationgriditempattern-get_cachedrow
     */
    get_CachedRow() {
        result := ComCall(9, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the cached zero-based index of the column that contains the grid item.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationgriditempattern-get_cachedcolumn
     */
    get_CachedColumn() {
        result := ComCall(10, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the cached number of rows spanned by a grid item.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationgriditempattern-get_cachedrowspan
     */
    get_CachedRowSpan() {
        result := ComCall(11, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the cached number of columns spanned by the grid item.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationgriditempattern-get_cachedcolumnspan
     */
    get_CachedColumnSpan() {
        result := ComCall(12, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    Query(iid) {
        if (IUIAutomationGridItemPattern.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_CurrentContainingGrid := CallbackCreate(GetMethod(implObj, "get_CurrentContainingGrid"), flags, 2)
        this.vtbl.get_CurrentRow := CallbackCreate(GetMethod(implObj, "get_CurrentRow"), flags, 2)
        this.vtbl.get_CurrentColumn := CallbackCreate(GetMethod(implObj, "get_CurrentColumn"), flags, 2)
        this.vtbl.get_CurrentRowSpan := CallbackCreate(GetMethod(implObj, "get_CurrentRowSpan"), flags, 2)
        this.vtbl.get_CurrentColumnSpan := CallbackCreate(GetMethod(implObj, "get_CurrentColumnSpan"), flags, 2)
        this.vtbl.get_CachedContainingGrid := CallbackCreate(GetMethod(implObj, "get_CachedContainingGrid"), flags, 2)
        this.vtbl.get_CachedRow := CallbackCreate(GetMethod(implObj, "get_CachedRow"), flags, 2)
        this.vtbl.get_CachedColumn := CallbackCreate(GetMethod(implObj, "get_CachedColumn"), flags, 2)
        this.vtbl.get_CachedRowSpan := CallbackCreate(GetMethod(implObj, "get_CachedRowSpan"), flags, 2)
        this.vtbl.get_CachedColumnSpan := CallbackCreate(GetMethod(implObj, "get_CachedColumnSpan"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_CurrentContainingGrid)
        CallbackFree(this.vtbl.get_CurrentRow)
        CallbackFree(this.vtbl.get_CurrentColumn)
        CallbackFree(this.vtbl.get_CurrentRowSpan)
        CallbackFree(this.vtbl.get_CurrentColumnSpan)
        CallbackFree(this.vtbl.get_CachedContainingGrid)
        CallbackFree(this.vtbl.get_CachedRow)
        CallbackFree(this.vtbl.get_CachedColumn)
        CallbackFree(this.vtbl.get_CachedRowSpan)
        CallbackFree(this.vtbl.get_CachedColumnSpan)
    }
}

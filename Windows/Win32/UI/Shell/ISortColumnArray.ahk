#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\SORT_ORDER_TYPE.ahk" { SORT_ORDER_TYPE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\SORTCOLUMN.ahk" { SORTCOLUMN }

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct ISortColumnArray extends IUnknown {
    /**
     * The interface identifier for ISortColumnArray
     * @type {Guid}
     */
    static IID := Guid("{6dfc60fb-f2e9-459b-beb5-288f1a7c7d54}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISortColumnArray interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetCount    : IntPtr
        GetAt       : IntPtr
        GetSortType : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISortColumnArray.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetCount() {
        result := ComCall(3, this, "uint*", &columnCount := 0, "HRESULT")
        return columnCount
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {SORTCOLUMN} 
     */
    GetAt(index) {
        _sortcolumn := SORTCOLUMN()
        result := ComCall(4, this, "uint", index, SORTCOLUMN.Ptr, _sortcolumn, "HRESULT")
        return _sortcolumn
    }

    /**
     * 
     * @returns {SORT_ORDER_TYPE} 
     */
    GetSortType() {
        result := ComCall(5, this, "int*", &type := 0, "HRESULT")
        return type
    }

    Query(iid) {
        if (ISortColumnArray.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetCount := CallbackCreate(GetMethod(implObj, "GetCount"), flags, 2)
        this.vtbl.GetAt := CallbackCreate(GetMethod(implObj, "GetAt"), flags, 3)
        this.vtbl.GetSortType := CallbackCreate(GetMethod(implObj, "GetSortType"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetCount)
        CallbackFree(this.vtbl.GetAt)
        CallbackFree(this.vtbl.GetSortType)
    }
}

#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\ISyncFilter.ahk" { ISyncFilter }

/**
 * @namespace Windows.Win32.System.WindowsSync
 */
export default struct IFilterKeyMap extends IUnknown {
    /**
     * The interface identifier for IFilterKeyMap
     * @type {Guid}
     */
    static IID := Guid("{ca169652-07c6-4708-a3da-6e4eba8d2297}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFilterKeyMap interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetCount  : IntPtr
        AddFilter : IntPtr
        GetFilter : IntPtr
        Serialize : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFilterKeyMap.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwCount 
     * @returns {HRESULT} 
     */
    GetCount(pdwCount) {
        pdwCountMarshal := pdwCount is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pdwCountMarshal, pdwCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISyncFilter} pISyncFilter 
     * @param {Pointer<Integer>} pdwFilterKey 
     * @returns {HRESULT} 
     */
    AddFilter(pISyncFilter, pdwFilterKey) {
        pdwFilterKeyMarshal := pdwFilterKey is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "ptr", pISyncFilter, pdwFilterKeyMarshal, pdwFilterKey, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFilterKey 
     * @returns {ISyncFilter} 
     */
    GetFilter(dwFilterKey) {
        result := ComCall(5, this, "uint", dwFilterKey, "ptr*", &ppISyncFilter := 0, "HRESULT")
        return ISyncFilter(ppISyncFilter)
    }

    /**
     * 
     * @param {Pointer<Integer>} pbFilterKeyMap 
     * @param {Pointer<Integer>} pcbFilterKeyMap 
     * @returns {HRESULT} 
     */
    Serialize(pbFilterKeyMap, pcbFilterKeyMap) {
        pbFilterKeyMapMarshal := pbFilterKeyMap is VarRef ? "char*" : "ptr"
        pcbFilterKeyMapMarshal := pcbFilterKeyMap is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, pbFilterKeyMapMarshal, pbFilterKeyMap, pcbFilterKeyMapMarshal, pcbFilterKeyMap, "HRESULT")
        return result
    }

    Query(iid) {
        if (IFilterKeyMap.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetCount := CallbackCreate(GetMethod(implObj, "GetCount"), flags, 2)
        this.vtbl.AddFilter := CallbackCreate(GetMethod(implObj, "AddFilter"), flags, 3)
        this.vtbl.GetFilter := CallbackCreate(GetMethod(implObj, "GetFilter"), flags, 3)
        this.vtbl.Serialize := CallbackCreate(GetMethod(implObj, "Serialize"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetCount)
        CallbackFree(this.vtbl.AddFilter)
        CallbackFree(this.vtbl.GetFilter)
        CallbackFree(this.vtbl.Serialize)
    }
}

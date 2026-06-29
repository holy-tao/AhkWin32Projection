#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\DBBINDING.ahk" { DBBINDING }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\HACCESSOR.ahk" { HACCESSOR }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct IViewFilter extends IUnknown {
    /**
     * The interface identifier for IViewFilter
     * @type {Guid}
     */
    static IID := Guid("{0c733a9b-2a1c-11ce-ade5-00aa0044773d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IViewFilter interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetFilter         : IntPtr
        GetFilterBindings : IntPtr
        SetFilter         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IViewFilter.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {HACCESSOR} _hAccessor 
     * @param {Pointer<Pointer>} pcRows 
     * @param {Pointer<Pointer<Integer>>} pCompareOps 
     * @param {Pointer<Void>} pCriteriaData 
     * @returns {HRESULT} 
     */
    GetFilter(_hAccessor, pcRows, pCompareOps, pCriteriaData) {
        pcRowsMarshal := pcRows is VarRef ? "ptr*" : "ptr"
        pCompareOpsMarshal := pCompareOps is VarRef ? "ptr*" : "ptr"
        pCriteriaDataMarshal := pCriteriaData is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, HACCESSOR, _hAccessor, pcRowsMarshal, pcRows, pCompareOpsMarshal, pCompareOps, pCriteriaDataMarshal, pCriteriaData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer>} pcBindings 
     * @param {Pointer<Pointer<DBBINDING>>} prgBindings 
     * @returns {HRESULT} 
     */
    GetFilterBindings(pcBindings, prgBindings) {
        pcBindingsMarshal := pcBindings is VarRef ? "ptr*" : "ptr"
        prgBindingsMarshal := prgBindings is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, pcBindingsMarshal, pcBindings, prgBindingsMarshal, prgBindings, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HACCESSOR} _hAccessor 
     * @param {Pointer} cRows 
     * @param {Pointer<Integer>} CompareOps 
     * @param {Pointer<Void>} pCriteriaData 
     * @returns {HRESULT} 
     */
    SetFilter(_hAccessor, cRows, CompareOps, pCriteriaData) {
        CompareOpsMarshal := CompareOps is VarRef ? "uint*" : "ptr"
        pCriteriaDataMarshal := pCriteriaData is VarRef ? "ptr" : "ptr"

        result := ComCall(5, this, HACCESSOR, _hAccessor, "ptr", cRows, CompareOpsMarshal, CompareOps, pCriteriaDataMarshal, pCriteriaData, "HRESULT")
        return result
    }

    Query(iid) {
        if (IViewFilter.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetFilter := CallbackCreate(GetMethod(implObj, "GetFilter"), flags, 5)
        this.vtbl.GetFilterBindings := CallbackCreate(GetMethod(implObj, "GetFilterBindings"), flags, 3)
        this.vtbl.SetFilter := CallbackCreate(GetMethod(implObj, "SetFilter"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetFilter)
        CallbackFree(this.vtbl.GetFilterBindings)
        CallbackFree(this.vtbl.SetFilter)
    }
}

#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct IMultipleResults extends IUnknown {
    /**
     * The interface identifier for IMultipleResults
     * @type {Guid}
     */
    static IID := Guid("{0c733a90-2a1c-11ce-ade5-00aa0044773d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMultipleResults interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetResult : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMultipleResults.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @param {IUnknown} pUnkOuter 
     * @param {Pointer} lResultFlag 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer>} pcRowsAffected 
     * @param {Pointer<IUnknown>} ppRowset 
     * @returns {HRESULT} 
     */
    GetResult(pUnkOuter, lResultFlag, riid, pcRowsAffected, ppRowset) {
        pUnkOuterMarshal := pUnkOuter == 0 ? IntPtr : "ptr"
        pcRowsAffectedMarshal := pcRowsAffected is VarRef ? "ptr*" : IntPtr
        pcRowsAffectedMarshal := pcRowsAffected == 0 ? IntPtr : "ptr*"
        ppRowsetMarshal := ppRowset == 0 ? IntPtr : IUnknown.Ptr

        result := ComCall(3, this, pUnkOuterMarshal, pUnkOuter, IntPtr, lResultFlag, Guid.Ptr, riid, pcRowsAffectedMarshal, pcRowsAffected, ppRowsetMarshal, ppRowset, "HRESULT")
        return result
    }

    _Query(iid) {
        if (IMultipleResults.IID.Equals(iid)) {
            return true
        }
        return super._Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetResult := CallbackCreate(ObjBindMethod(implObj, "GetResult"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetResult)
    }
}

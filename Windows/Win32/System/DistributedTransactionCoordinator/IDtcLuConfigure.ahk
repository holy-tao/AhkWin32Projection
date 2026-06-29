#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 */
export default struct IDtcLuConfigure extends IUnknown {
    /**
     * The interface identifier for IDtcLuConfigure
     * @type {Guid}
     */
    static IID := Guid("{4131e760-1aea-11d0-944b-00a0c905416e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDtcLuConfigure interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Add    : IntPtr
        Delete : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDtcLuConfigure.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<Integer>} pucLuPair 
     * @param {Integer} cbLuPair 
     * @returns {HRESULT} 
     */
    Add(pucLuPair, cbLuPair) {
        pucLuPairMarshal := pucLuPair is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, pucLuPairMarshal, pucLuPair, "uint", cbLuPair, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pucLuPair 
     * @param {Integer} cbLuPair 
     * @returns {HRESULT} 
     */
    Delete(pucLuPair, cbLuPair) {
        pucLuPairMarshal := pucLuPair is VarRef ? "char*" : "ptr"

        result := ComCall(4, this, pucLuPairMarshal, pucLuPair, "uint", cbLuPair, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDtcLuConfigure.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Add := CallbackCreate(GetMethod(implObj, "Add"), flags, 3)
        this.vtbl.Delete := CallbackCreate(GetMethod(implObj, "Delete"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Add)
        CallbackFree(this.vtbl.Delete)
    }
}

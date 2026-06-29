#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\DTCINITIATEDRECOVERYWORK.ahk" { DTCINITIATEDRECOVERYWORK }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 */
export default struct IDtcLuRecoveryInitiatedByDtc extends IUnknown {
    /**
     * The interface identifier for IDtcLuRecoveryInitiatedByDtc
     * @type {Guid}
     */
    static IID := Guid("{4131e764-1aea-11d0-944b-00a0c905416e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDtcLuRecoveryInitiatedByDtc interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetWork : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDtcLuRecoveryInitiatedByDtc.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<DTCINITIATEDRECOVERYWORK>} pWork 
     * @param {Pointer<Pointer<Void>>} ppv 
     * @returns {HRESULT} 
     */
    GetWork(pWork, ppv) {
        pWorkMarshal := pWork is VarRef ? "int*" : "ptr"
        ppvMarshal := ppv is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, pWorkMarshal, pWork, ppvMarshal, ppv, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDtcLuRecoveryInitiatedByDtc.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetWork := CallbackCreate(GetMethod(implObj, "GetWork"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetWork)
    }
}

#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 */
export default struct IDtcLuRecoveryInitiatedByDtcStatusWork extends IUnknown {
    /**
     * The interface identifier for IDtcLuRecoveryInitiatedByDtcStatusWork
     * @type {Guid}
     */
    static IID := Guid("{4131e766-1aea-11d0-944b-00a0c905416e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDtcLuRecoveryInitiatedByDtcStatusWork interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        HandleCheckLuStatus : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDtcLuRecoveryInitiatedByDtcStatusWork.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} lRecoverySeqNum 
     * @returns {HRESULT} 
     */
    HandleCheckLuStatus(lRecoverySeqNum) {
        result := ComCall(3, this, "int", lRecoverySeqNum, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDtcLuRecoveryInitiatedByDtcStatusWork.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.HandleCheckLuStatus := CallbackCreate(GetMethod(implObj, "HandleCheckLuStatus"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.HandleCheckLuStatus)
    }
}

#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ITransactionOutcomeEvents.ahk" { ITransactionOutcomeEvents }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 */
export default struct ITransactionVoterNotifyAsync2 extends ITransactionOutcomeEvents {
    /**
     * The interface identifier for ITransactionVoterNotifyAsync2
     * @type {Guid}
     */
    static IID := Guid("{5433376b-414d-11d3-b206-00c04fc2f3ef}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITransactionVoterNotifyAsync2 interfaces
    */
    struct Vtbl extends ITransactionOutcomeEvents.Vtbl {
        VoteRequest : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITransactionVoterNotifyAsync2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    VoteRequest() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITransactionVoterNotifyAsync2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.VoteRequest := CallbackCreate(GetMethod(implObj, "VoteRequest"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.VoteRequest)
    }
}

#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\BOID.ahk" { BOID }

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 */
export default struct ITransactionVoterBallotAsync2 extends IUnknown {
    /**
     * The interface identifier for ITransactionVoterBallotAsync2
     * @type {Guid}
     */
    static IID := Guid("{5433376c-414d-11d3-b206-00c04fc2f3ef}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITransactionVoterBallotAsync2 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        VoteRequestDone : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITransactionVoterBallotAsync2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {HRESULT} hr 
     * @param {Pointer<BOID>} pboidReason 
     * @returns {HRESULT} 
     */
    VoteRequestDone(hr, pboidReason) {
        result := ComCall(3, this, "int", hr, BOID.Ptr, pboidReason, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITransactionVoterBallotAsync2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.VoteRequestDone := CallbackCreate(GetMethod(implObj, "VoteRequestDone"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.VoteRequestDone)
    }
}

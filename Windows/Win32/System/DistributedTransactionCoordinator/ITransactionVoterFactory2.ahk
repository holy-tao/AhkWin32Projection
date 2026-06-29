#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ITransactionVoterNotifyAsync2.ahk" { ITransactionVoterNotifyAsync2 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\ITransaction.ahk" { ITransaction }
#Import ".\ITransactionVoterBallotAsync2.ahk" { ITransactionVoterBallotAsync2 }

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 */
export default struct ITransactionVoterFactory2 extends IUnknown {
    /**
     * The interface identifier for ITransactionVoterFactory2
     * @type {Guid}
     */
    static IID := Guid("{5433376a-414d-11d3-b206-00c04fc2f3ef}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITransactionVoterFactory2 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Create : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITransactionVoterFactory2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The Create Time/Date Summary property conveys the time and date when an author created the installation package, transform, or patch package.
     * @param {ITransaction} pTransaction 
     * @param {ITransactionVoterNotifyAsync2} pVoterNotify 
     * @returns {ITransactionVoterBallotAsync2} 
     * @see https://learn.microsoft.com/windows/win32/Msi/create-time-date-summary
     */
    Create(pTransaction, pVoterNotify) {
        result := ComCall(3, this, "ptr", pTransaction, "ptr", pVoterNotify, "ptr*", &ppVoterBallot := 0, "HRESULT")
        return ITransactionVoterBallotAsync2(ppVoterBallot)
    }

    Query(iid) {
        if (ITransactionVoterFactory2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Create := CallbackCreate(GetMethod(implObj, "Create"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Create)
    }
}

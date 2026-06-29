#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMSMQTransaction.ahk" { IMSMQTransaction }

/**
 * @namespace Windows.Win32.System.MessageQueuing
 */
export default struct IMSMQCoordinatedTransactionDispenser extends IDispatch {
    /**
     * The interface identifier for IMSMQCoordinatedTransactionDispenser
     * @type {Guid}
     */
    static IID := Guid("{d7d6e081-dccd-11d0-aa4b-0060970debae}")

    /**
     * The class identifier for MSMQCoordinatedTransactionDispenser
     * @type {Guid}
     */
    static CLSID := Guid("{d7d6e082-dccd-11d0-aa4b-0060970debae}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMSMQCoordinatedTransactionDispenser interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        BeginTransaction : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMSMQCoordinatedTransactionDispenser.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {IMSMQTransaction} 
     */
    BeginTransaction() {
        result := ComCall(7, this, "ptr*", &ptransaction := 0, "HRESULT")
        return IMSMQTransaction(ptransaction)
    }

    Query(iid) {
        if (IMSMQCoordinatedTransactionDispenser.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.BeginTransaction := CallbackCreate(GetMethod(implObj, "BeginTransaction"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.BeginTransaction)
    }
}

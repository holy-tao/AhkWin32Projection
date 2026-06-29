#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\XID.ahk" { XID }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\ITransaction.ahk" { ITransaction }

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 */
export default struct IDtcToXaHelper extends IUnknown {
    /**
     * The interface identifier for IDtcToXaHelper
     * @type {Guid}
     */
    static IID := Guid("{a9861611-304a-11d1-9813-00a0c905416e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDtcToXaHelper interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Close              : IntPtr
        TranslateTridToXid : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDtcToXaHelper.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {BOOL} i_fDoRecovery 
     * @returns {HRESULT} 
     */
    Close(i_fDoRecovery) {
        result := ComCall(3, this, BOOL, i_fDoRecovery, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ITransaction} pITransaction 
     * @param {Pointer<Guid>} pguidBqual 
     * @returns {XID} 
     */
    TranslateTridToXid(pITransaction, pguidBqual) {
        pXid := XID()
        result := ComCall(4, this, "ptr", pITransaction, Guid.Ptr, pguidBqual, XID.Ptr, pXid, "HRESULT")
        return pXid
    }

    Query(iid) {
        if (IDtcToXaHelper.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Close := CallbackCreate(GetMethod(implObj, "Close"), flags, 2)
        this.vtbl.TranslateTridToXid := CallbackCreate(GetMethod(implObj, "TranslateTridToXid"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Close)
        CallbackFree(this.vtbl.TranslateTridToXid)
    }
}

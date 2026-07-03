#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\ITransaction.ahk" { ITransaction }

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 */
export default struct ITransactionPhase0EnlistmentAsync extends IUnknown {
    /**
     * The interface identifier for ITransactionPhase0EnlistmentAsync
     * @type {Guid}
     */
    static IID := Guid("{82dc88e1-a954-11d1-8f88-00600895e7d5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITransactionPhase0EnlistmentAsync interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Enable            : IntPtr
        WaitForEnlistment : IntPtr
        Phase0Done        : IntPtr
        Unenlist          : IntPtr
        GetTransaction    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITransactionPhase0EnlistmentAsync.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Enables monitoring on a particular drive.
     * @remarks
     * The **Enable** method does not wait for monitoring to be enabled completely before it returns, because this could take a while. Instead, it returns immediately after starting the System Restore service and filter driver.
     * 
     * To enable System Restore on a non-system drive, you must first enable System Restore on the system drive.
     * 
     * This method fails in safe mode.
     * @returns {HRESULT} If the method succeeds, the return value is S\_OK. Otherwise, the method returns one of the COM error codes defined in WinError.h.
     * @see https://learn.microsoft.com/windows/win32/sr/enable-systemrestore
     */
    Enable() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    WaitForEnlistment() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Phase0Done() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Unenlist() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ITransaction} 
     */
    GetTransaction() {
        result := ComCall(7, this, "ptr*", &ppITransaction := 0, "HRESULT")
        return ITransaction(ppITransaction)
    }

    Query(iid) {
        if (ITransactionPhase0EnlistmentAsync.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Enable := CallbackCreate(GetMethod(implObj, "Enable"), flags, 1)
        this.vtbl.WaitForEnlistment := CallbackCreate(GetMethod(implObj, "WaitForEnlistment"), flags, 1)
        this.vtbl.Phase0Done := CallbackCreate(GetMethod(implObj, "Phase0Done"), flags, 1)
        this.vtbl.Unenlist := CallbackCreate(GetMethod(implObj, "Unenlist"), flags, 1)
        this.vtbl.GetTransaction := CallbackCreate(GetMethod(implObj, "GetTransaction"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Enable)
        CallbackFree(this.vtbl.WaitForEnlistment)
        CallbackFree(this.vtbl.Phase0Done)
        CallbackFree(this.vtbl.Unenlist)
        CallbackFree(this.vtbl.GetTransaction)
    }
}

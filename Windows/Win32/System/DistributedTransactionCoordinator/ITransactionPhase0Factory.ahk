#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ITransactionPhase0NotifyAsync.ahk" { ITransactionPhase0NotifyAsync }
#Import ".\ITransactionPhase0EnlistmentAsync.ahk" { ITransactionPhase0EnlistmentAsync }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 */
export default struct ITransactionPhase0Factory extends IUnknown {
    /**
     * The interface identifier for ITransactionPhase0Factory
     * @type {Guid}
     */
    static IID := Guid("{82dc88e0-a954-11d1-8f88-00600895e7d5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITransactionPhase0Factory interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Create : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITransactionPhase0Factory.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The Create Time/Date Summary property conveys the time and date when an author created the installation package, transform, or patch package.
     * @param {ITransactionPhase0NotifyAsync} pPhase0Notify 
     * @returns {ITransactionPhase0EnlistmentAsync} 
     * @see https://learn.microsoft.com/windows/win32/Msi/create-time-date-summary
     */
    Create(pPhase0Notify) {
        result := ComCall(3, this, "ptr", pPhase0Notify, "ptr*", &ppPhase0Enlistment := 0, "HRESULT")
        return ITransactionPhase0EnlistmentAsync(ppPhase0Enlistment)
    }

    Query(iid) {
        if (ITransactionPhase0Factory.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Create := CallbackCreate(GetMethod(implObj, "Create"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Create)
    }
}

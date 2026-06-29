#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ITransactionReceiver.ahk" { ITransactionReceiver }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 */
export default struct ITransactionReceiverFactory extends IUnknown {
    /**
     * The interface identifier for ITransactionReceiverFactory
     * @type {Guid}
     */
    static IID := Guid("{59313e02-b36c-11cf-a539-00aa006887c3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITransactionReceiverFactory interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Create : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITransactionReceiverFactory.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The Create Time/Date Summary property conveys the time and date when an author created the installation package, transform, or patch package.
     * @returns {ITransactionReceiver} 
     * @see https://learn.microsoft.com/windows/win32/Msi/create-time-date-summary
     */
    Create() {
        result := ComCall(3, this, "ptr*", &ppReceiver := 0, "HRESULT")
        return ITransactionReceiver(ppReceiver)
    }

    Query(iid) {
        if (ITransactionReceiverFactory.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Create := CallbackCreate(GetMethod(implObj, "Create"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Create)
    }
}

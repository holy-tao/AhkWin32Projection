#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 */
export default struct IKernelTransaction extends IUnknown {
    /**
     * The interface identifier for IKernelTransaction
     * @type {Guid}
     */
    static IID := Guid("{79427a2b-f895-40e0-be79-b57dc82ed231}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IKernelTransaction interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetHandle : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IKernelTransaction.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {HANDLE} 
     */
    GetHandle() {
        pHandle := HANDLE.Owned()
        result := ComCall(3, this, HANDLE.Ptr, pHandle, "HRESULT")
        return pHandle
    }

    Query(iid) {
        if (IKernelTransaction.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetHandle := CallbackCreate(GetMethod(implObj, "GetHandle"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetHandle)
    }
}

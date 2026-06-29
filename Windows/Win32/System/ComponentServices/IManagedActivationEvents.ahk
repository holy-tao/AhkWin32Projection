#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IManagedObjectInfo.ahk" { IManagedObjectInfo }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Used to create and destroy stubs for managed objects within the current COM+ context.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-imanagedactivationevents
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct IManagedActivationEvents extends IUnknown {
    /**
     * The interface identifier for IManagedActivationEvents
     * @type {Guid}
     */
    static IID := Guid("{a5f325af-572f-46da-b8ab-827c3d95d99e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IManagedActivationEvents interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateManagedStub  : IntPtr
        DestroyManagedStub : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IManagedActivationEvents.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates a stub for a managed object within the current COM+ context.
     * @param {IManagedObjectInfo} pInfo A pointer to <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nn-comsvcs-imanagedobjectinfo">IManagedObjectInfo</a> that describes the stub for a managed object.
     * @param {BOOL} fDist Indicates whether the created stub is the distinguished stub. A distinguished stub is the stub that controls the lifetime of the current COM+ context.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-imanagedactivationevents-createmanagedstub
     */
    CreateManagedStub(pInfo, fDist) {
        result := ComCall(3, this, "ptr", pInfo, BOOL, fDist, "HRESULT")
        return result
    }

    /**
     * Destroys a stub that was created by CreateManagedStub.
     * @param {IManagedObjectInfo} pInfo A pointer to <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nn-comsvcs-imanagedobjectinfo">IManagedObjectInfo</a> that describes the stub for a managed object.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-imanagedactivationevents-destroymanagedstub
     */
    DestroyManagedStub(pInfo) {
        result := ComCall(4, this, "ptr", pInfo, "HRESULT")
        return result
    }

    Query(iid) {
        if (IManagedActivationEvents.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateManagedStub := CallbackCreate(GetMethod(implObj, "CreateManagedStub"), flags, 3)
        this.vtbl.DestroyManagedStub := CallbackCreate(GetMethod(implObj, "DestroyManagedStub"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateManagedStub)
        CallbackFree(this.vtbl.DestroyManagedStub)
    }
}

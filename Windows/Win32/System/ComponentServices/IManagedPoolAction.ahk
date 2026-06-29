#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Enables an object to be notified before it is released from a COM+ object pool.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-imanagedpoolaction
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct IManagedPoolAction extends IUnknown {
    /**
     * The interface identifier for IManagedPoolAction
     * @type {Guid}
     */
    static IID := Guid("{da91b74e-5388-4783-949d-c1cd5fb00506}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IManagedPoolAction interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        LastRelease : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IManagedPoolAction.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Called when a COM+ object pool drops the last reference to the object that implements it.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-imanagedpoolaction-lastrelease
     */
    LastRelease() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IManagedPoolAction.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.LastRelease := CallbackCreate(GetMethod(implObj, "LastRelease"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.LastRelease)
    }
}

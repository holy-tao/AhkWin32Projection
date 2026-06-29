#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Describes how a managed object is used in the COM+ object pool.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-imanagedpooledobj
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct IManagedPooledObj extends IUnknown {
    /**
     * The interface identifier for IManagedPooledObj
     * @type {Guid}
     */
    static IID := Guid("{c5da4bea-1b42-4437-8926-b6a38860a770}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IManagedPooledObj interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetHeld : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IManagedPooledObj.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets whether the managed object should go back into the COM+ object pool.
     * @param {BOOL} m_bHeld Indicates whether the managed object should go back into the COM+ object pool.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-imanagedpooledobj-setheld
     */
    SetHeld(m_bHeld) {
        result := ComCall(3, this, BOOL, m_bHeld, "HRESULT")
        return result
    }

    Query(iid) {
        if (IManagedPooledObj.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetHeld := CallbackCreate(GetMethod(implObj, "SetHeld"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetHeld)
    }
}

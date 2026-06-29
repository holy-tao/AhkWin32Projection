#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Enables the caller to control an object pool.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-ipoolmanager
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct IPoolManager extends IDispatch {
    /**
     * The interface identifier for IPoolManager
     * @type {Guid}
     */
    static IID := Guid("{0a469861-5a91-43a0-99b6-d5e179bb0631}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPoolManager interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        ShutdownPool : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPoolManager.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Shuts down the object pool.
     * @param {BSTR} CLSIDOrProgID A string containing the CLSID or ProgID of the pool to be shut down.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-ipoolmanager-shutdownpool
     */
    ShutdownPool(CLSIDOrProgID) {
        CLSIDOrProgID := CLSIDOrProgID is String ? BSTR.Alloc(CLSIDOrProgID).Value : CLSIDOrProgID

        result := ComCall(7, this, BSTR, CLSIDOrProgID, "HRESULT")
        return result
    }

    Query(iid) {
        if (IPoolManager.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ShutdownPool := CallbackCreate(GetMethod(implObj, "ShutdownPool"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ShutdownPool)
    }
}

#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Activates the COM+ component load balancing service.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-iselectcomlbserver
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct ISelectCOMLBServer extends IUnknown {
    /**
     * The interface identifier for ISelectCOMLBServer
     * @type {Guid}
     */
    static IID := Guid("{dcf443f4-3f8a-4872-b9f0-369a796d12d6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISelectCOMLBServer interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Init        : IntPtr
        GetLBServer : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISelectCOMLBServer.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Initializes the load balancing server object.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iselectcomlbserver-init
     */
    Init() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * Retrieves the name of the load balancing server.
     * @param {IUnknown} pUnk A pointer to the load balancing server's name.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iselectcomlbserver-getlbserver
     */
    GetLBServer(pUnk) {
        result := ComCall(4, this, "ptr", pUnk, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISelectCOMLBServer.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Init := CallbackCreate(GetMethod(implObj, "Init"), flags, 1)
        this.vtbl.GetLBServer := CallbackCreate(GetMethod(implObj, "GetLBServer"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Init)
        CallbackFree(this.vtbl.GetLBServer)
    }
}

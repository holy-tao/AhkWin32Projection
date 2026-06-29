#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Binds a managed object to an application domain, which is an isolated environment where applications execute.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-iappdomainhelper
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct IAppDomainHelper extends IDispatch {
    /**
     * The interface identifier for IAppDomainHelper
     * @type {Guid}
     */
    static IID := Guid("{c7b67079-8255-42c6-9ec0-6994a3548780}")

    /**
     * The class identifier for AppDomainHelper
     * @type {Guid}
     */
    static CLSID := Guid("{ef24f689-14f8-4d92-b4af-d7b1f0e70fd4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAppDomainHelper interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        Initialize : IntPtr
        DoCallback : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAppDomainHelper.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Binds the calling object to the current application domain and provides a callback function for shutdown that is executed when the application domain is unloaded.
     * @param {IUnknown} pUnkAD Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> of the current application domain.
     * @param {Pointer} __MIDL__IAppDomainHelper0000 Reference to the shutdown function that is executed when the application domain is unloaded. The parameter of this function, <i>pv</i>, comes from the <i>pPool</i> parameter, which is defined next.
     * @param {Pointer<Void>} pPool This parameter is used to provide any data that the shutdown function might need.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iappdomainhelper-initialize
     */
    Initialize(pUnkAD, __MIDL__IAppDomainHelper0000, pPool) {
        pPoolMarshal := pPool is VarRef ? "ptr" : "ptr"

        result := ComCall(7, this, "ptr", pUnkAD, "ptr", __MIDL__IAppDomainHelper0000, pPoolMarshal, pPool, "HRESULT")
        return result
    }

    /**
     * Switches into a given application domain (which the calling object must be bound to), executes the supplied callback function in that application domain, and then returns to the original application domain.
     * @param {IUnknown} pUnkAD Reference to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> of the application domain that you want to switch to. The object calling <b>DoCallback</b> must be bound to that application domain.
     * @param {Pointer} __MIDL__IAppDomainHelper0001 Reference to the callback function. This function is executed in the application domain that you switched to. The parameter of this function, <i>pv</i>, comes from the <i>pPool</i> parameter, which is defined next.
     * @param {Pointer<Void>} pPool This parameter is used to provide any data that the callback function might need.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iappdomainhelper-docallback
     */
    DoCallback(pUnkAD, __MIDL__IAppDomainHelper0001, pPool) {
        pPoolMarshal := pPool is VarRef ? "ptr" : "ptr"

        result := ComCall(8, this, "ptr", pUnkAD, "ptr", __MIDL__IAppDomainHelper0001, pPoolMarshal, pPool, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAppDomainHelper.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 4)
        this.vtbl.DoCallback := CallbackCreate(GetMethod(implObj, "DoCallback"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Initialize)
        CallbackFree(this.vtbl.DoCallback)
    }
}

#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides methods that can be called whenever Dllhost.exe starts up or shuts down.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-iprocessinitializer
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct IProcessInitializer extends IUnknown {
    /**
     * The interface identifier for IProcessInitializer
     * @type {Guid}
     */
    static IID := Guid("{1113f52d-dc7f-4943-aed6-88d04027e32a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IProcessInitializer interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Startup  : IntPtr
        Shutdown : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IProcessInitializer.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Called when Dllhost.exe starts.
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface referenced by <i>punkProcessControl</i> must belong to a COM component that implements an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-iprocessinitcontrol">IProcessInitControl</a> interface; this interface supports the single method <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-iprocessinitcontrol-resetinitializertimeout">ResetInitializerTimeout</a>. The initialization code in <b>Startup</b> can call the <b>ResetInitializerTimeout</b> method, with <i>dwSecondsRemaining</i> set equal to the number of seconds remaining before the startup of the component times out.
     * @param {IUnknown} punkProcessControl A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface of the COM component starting up.
     * 
     * <b>Windows XP/2000:  </b>This parameter is always <b>NULL</b>.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iprocessinitializer-startup
     */
    Startup(punkProcessControl) {
        result := ComCall(3, this, "ptr", punkProcessControl, "HRESULT")
        return result
    }

    /**
     * Called when Dllhost.exe shuts down.
     * @remarks
     * The Shutdown method is not called during a failfast or other catastrophic shutdown events.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iprocessinitializer-shutdown
     */
    Shutdown() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IProcessInitializer.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Startup := CallbackCreate(GetMethod(implObj, "Startup"), flags, 2)
        this.vtbl.Shutdown := CallbackCreate(GetMethod(implObj, "Shutdown"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Startup)
        CallbackFree(this.vtbl.Shutdown)
    }
}

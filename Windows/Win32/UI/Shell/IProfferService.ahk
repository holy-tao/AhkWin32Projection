#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IServiceProvider.ahk" { IServiceProvider }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes a general mechanism for objects to offer services to other objects on the same host.
 * @remarks
 * Objects that expose a service first call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> on their host for this interface, then execute <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iprofferservice-profferservice">IProfferService::ProfferService</a>.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iprofferservice
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IProfferService extends IUnknown {
    /**
     * The interface identifier for IProfferService
     * @type {Guid}
     */
    static IID := Guid("{cb728b20-f786-11ce-92ad-00aa00a74cd0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IProfferService interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ProfferService : IntPtr
        RevokeService  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IProfferService.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Makes a service available to other objects on the same host.
     * @param {Pointer<Guid>} serviceId 
     * @param {IServiceProvider} serviceProvider 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iprofferservice-profferservice
     */
    ProfferService(serviceId, serviceProvider) {
        result := ComCall(3, this, Guid.Ptr, serviceId, "ptr", serviceProvider, "uint*", &cookie := 0, "HRESULT")
        return cookie
    }

    /**
     * Makes a service unavailable that had previously been available to other objects through IProfferService::ProfferService.
     * @param {Integer} cookie 
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iprofferservice-revokeservice
     */
    RevokeService(cookie) {
        result := ComCall(4, this, "uint", cookie, "HRESULT")
        return result
    }

    Query(iid) {
        if (IProfferService.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ProfferService := CallbackCreate(GetMethod(implObj, "ProfferService"), flags, 4)
        this.vtbl.RevokeService := CallbackCreate(GetMethod(implObj, "RevokeService"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ProfferService)
        CallbackFree(this.vtbl.RevokeService)
    }
}

#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IWorkspaceClientExt.ahk" { IWorkspaceClientExt }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods that add and remove references to custom clients in RemoteApp and Desktop Connection. (IWorkspaceRegistration)
 * @see https://learn.microsoft.com/windows/win32/api/workspaceruntime/nn-workspaceruntime-iworkspaceregistration
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct IWorkspaceRegistration extends IUnknown {
    /**
     * The interface identifier for IWorkspaceRegistration
     * @type {Guid}
     */
    static IID := Guid("{b922bbb8-4c55-4fea-8496-beb0b44285e6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWorkspaceRegistration interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AddResource    : IntPtr
        RemoveResource : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWorkspaceRegistration.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Adds a resource to the connection in RemoteApp and Desktop Connection. (IWorkspaceRegistration2.AddResource)
     * @param {IWorkspaceClientExt} pUnk A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/workspaceruntimeclientext/nn-workspaceruntimeclientext-iworkspaceclientext">IWorkspaceClientExt</a> object  that called this method.
     * @returns {Integer} A pointer to a <b>DWORD</b> variable to receive the connection cookie for a new resource.
     * @see https://learn.microsoft.com/windows/win32/api/workspaceruntime/nf-workspaceruntime-iworkspaceregistration-addresource
     */
    AddResource(pUnk) {
        result := ComCall(3, this, "ptr", pUnk, "uint*", &pdwCookie := 0, "HRESULT")
        return pdwCookie
    }

    /**
     * Notifies the RemoteApp and Desktop Connection runtime that the client is disconnecting the connection. (IWorkspaceRegistration2.RemoveResource)
     * @param {Integer} dwCookieConnection A <b>DWORD</b> value that contains a connection cookie returned by the <a href="https://docs.microsoft.com/windows/desktop/api/workspaceruntime/nf-workspaceruntime-iworkspaceregistration-addresource">AddResource</a> method.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/workspaceruntime/nf-workspaceruntime-iworkspaceregistration-removeresource
     */
    RemoveResource(dwCookieConnection) {
        result := ComCall(4, this, "uint", dwCookieConnection, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWorkspaceRegistration.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddResource := CallbackCreate(GetMethod(implObj, "AddResource"), flags, 3)
        this.vtbl.RemoveResource := CallbackCreate(GetMethod(implObj, "RemoveResource"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddResource)
        CallbackFree(this.vtbl.RemoveResource)
    }
}

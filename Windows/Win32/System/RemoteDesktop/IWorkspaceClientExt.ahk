#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods that allow the runtime to disconnect a custom client in RemoteApp and Desktop Connection.
 * @see https://learn.microsoft.com/windows/win32/api/workspaceruntimeclientext/nn-workspaceruntimeclientext-iworkspaceclientext
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct IWorkspaceClientExt extends IUnknown {
    /**
     * The interface identifier for IWorkspaceClientExt
     * @type {Guid}
     */
    static IID := Guid("{12b952f4-41ca-4f21-a829-a6d07d9a16e5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWorkspaceClientExt interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetResourceId          : IntPtr
        GetResourceDisplayName : IntPtr
        IssueDisconnect        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWorkspaceClientExt.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Returns the ID of the custom client in RemoteApp and Desktop Connection.
     * @returns {BSTR} A pointer to a <b>BSTR</b> variable to receive the ID of the custom client.
     * @see https://learn.microsoft.com/windows/win32/api/workspaceruntimeclientext/nf-workspaceruntimeclientext-iworkspaceclientext-getresourceid
     */
    GetResourceId() {
        bstrWorkspaceId := BSTR.Owned()
        result := ComCall(3, this, BSTR.Ptr, bstrWorkspaceId, "HRESULT")
        return bstrWorkspaceId
    }

    /**
     * Returns the display name of the custom client in RemoteApp and Desktop Connection.
     * @returns {BSTR} A pointer to a <b>BSTR</b> variable to receive the display name.
     * @see https://learn.microsoft.com/windows/win32/api/workspaceruntimeclientext/nf-workspaceruntimeclientext-iworkspaceclientext-getresourcedisplayname
     */
    GetResourceDisplayName() {
        bstrWorkspaceDisplayName := BSTR.Owned()
        result := ComCall(4, this, BSTR.Ptr, bstrWorkspaceDisplayName, "HRESULT")
        return bstrWorkspaceDisplayName
    }

    /**
     * Disconnects the custom client in RemoteApp and Desktop Connection.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/workspaceruntimeclientext/nf-workspaceruntimeclientext-iworkspaceclientext-issuedisconnect
     */
    IssueDisconnect() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWorkspaceClientExt.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetResourceId := CallbackCreate(GetMethod(implObj, "GetResourceId"), flags, 2)
        this.vtbl.GetResourceDisplayName := CallbackCreate(GetMethod(implObj, "GetResourceDisplayName"), flags, 2)
        this.vtbl.IssueDisconnect := CallbackCreate(GetMethod(implObj, "IssueDisconnect"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetResourceId)
        CallbackFree(this.vtbl.GetResourceDisplayName)
        CallbackFree(this.vtbl.IssueDisconnect)
    }
}

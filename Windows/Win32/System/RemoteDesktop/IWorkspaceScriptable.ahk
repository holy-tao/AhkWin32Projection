#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * Exposes methods that manage RemoteApp and Desktop Connection credentials and connections. (IWorkspaceScriptable)
 * @see https://learn.microsoft.com/windows/win32/api/workspaceruntime/nn-workspaceruntime-iworkspacescriptable
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct IWorkspaceScriptable extends IDispatch {
    /**
     * The interface identifier for IWorkspaceScriptable
     * @type {Guid}
     */
    static IID := Guid("{efea49a2-dda5-429d-8f42-b23b92c4c347}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWorkspaceScriptable interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        DisconnectWorkspace               : IntPtr
        StartWorkspace                    : IntPtr
        IsWorkspaceCredentialSpecified    : IntPtr
        IsWorkspaceSSOEnabled             : IntPtr
        ClearWorkspaceCredential          : IntPtr
        OnAuthenticated                   : IntPtr
        DisconnectWorkspaceByFriendlyName : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWorkspaceScriptable.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Disconnects all existing connections associated with the specified connection ID.
     * @param {BSTR} bstrWorkspaceId A string that contains the connection ID of the connection to disconnect.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/workspaceruntime/nf-workspaceruntime-iworkspacescriptable-disconnectworkspace
     */
    DisconnectWorkspace(bstrWorkspaceId) {
        bstrWorkspaceId := bstrWorkspaceId is String ? BSTR.Alloc(bstrWorkspaceId).Value : bstrWorkspaceId

        result := ComCall(7, this, BSTR, bstrWorkspaceId, "HRESULT")
        return result
    }

    /**
     * Associates user credentials and certificates with a connection ID.
     * @param {BSTR} bstrWorkspaceId A string that contains the connection ID.
     * @param {BSTR} bstrUserName A string that contains a user name.
     * @param {BSTR} bstrPassword A string that contains a password.
     * @param {BSTR} bstrWorkspaceParams A string that contains one or more Secure Hash Algorithm 1 (SHA-1) hashes of signing certificates to associate with the specified connection ID. The hash values should be in hexadecimal string format and delimited by semicolons.
     * @param {Integer} lTimeout The time period, in minutes, after which the credentials are deleted.
     * @param {Integer} lFlags 
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list.
     * @see https://learn.microsoft.com/windows/win32/api/workspaceruntime/nf-workspaceruntime-iworkspacescriptable-startworkspace
     */
    StartWorkspace(bstrWorkspaceId, bstrUserName, bstrPassword, bstrWorkspaceParams, lTimeout, lFlags) {
        bstrWorkspaceId := bstrWorkspaceId is String ? BSTR.Alloc(bstrWorkspaceId).Value : bstrWorkspaceId
        bstrUserName := bstrUserName is String ? BSTR.Alloc(bstrUserName).Value : bstrUserName
        bstrPassword := bstrPassword is String ? BSTR.Alloc(bstrPassword).Value : bstrPassword
        bstrWorkspaceParams := bstrWorkspaceParams is String ? BSTR.Alloc(bstrWorkspaceParams).Value : bstrWorkspaceParams

        result := ComCall(8, this, BSTR, bstrWorkspaceId, BSTR, bstrUserName, BSTR, bstrPassword, BSTR, bstrWorkspaceParams, "int", lTimeout, "int", lFlags, "HRESULT")
        return result
    }

    /**
     * Determines whether user credentials exist for the specified connection ID.
     * @param {BSTR} bstrWorkspaceId A string that contains the connection ID.
     * @param {VARIANT_BOOL} bCountUnauthenticatedCredentials <b>VARIANT_TRUE</b> to specify that the <i>pbCredExist</i> parameter should return <b>VARIANT_TRUE</b> if credentials (authenticated or unauthenticated) exist for the connection ID specified in the <i>bstrWorkspaceId</i> parameter. <b>VARIANT_FALSE</b> to specify that the <i>pbCredExist</i> parameter should return <b>VARIANT_TRUE</b> only if authenticated credentials exist for the connection ID specified in the <i>bstrWorkspaceId</i> parameter.
     * @returns {VARIANT_BOOL} A pointer to a <b>VARIANT_BOOL</b> variable to receive whether credentials exist for the connection ID specified in the <i>bstrWorkspaceId</i> parameter. This value is <b>VARIANT_TRUE</b> if credentials exist; otherwise, <b>VARIANT_FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/workspaceruntime/nf-workspaceruntime-iworkspacescriptable-isworkspacecredentialspecified
     */
    IsWorkspaceCredentialSpecified(bstrWorkspaceId, bCountUnauthenticatedCredentials) {
        bstrWorkspaceId := bstrWorkspaceId is String ? BSTR.Alloc(bstrWorkspaceId).Value : bstrWorkspaceId

        result := ComCall(9, this, BSTR, bstrWorkspaceId, VARIANT_BOOL, bCountUnauthenticatedCredentials, VARIANT_BOOL.Ptr, &pbCredExist := 0, "HRESULT")
        return pbCredExist
    }

    /**
     * Determines whether single sign on (SSO) is enabled for RemoteApp and Desktop Connection.
     * @returns {VARIANT_BOOL} A pointer to a <b>VARIANT_BOOL</b> variable to receive  whether SSO is enabled. This value is <b>VARIANT_TRUE</b> if SSO is enabled; otherwise, <b>VARIANT_FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/workspaceruntime/nf-workspaceruntime-iworkspacescriptable-isworkspacessoenabled
     */
    IsWorkspaceSSOEnabled() {
        result := ComCall(10, this, VARIANT_BOOL.Ptr, &pbSSOEnabled := 0, "HRESULT")
        return pbSSOEnabled
    }

    /**
     * Deletes the user credentials associated with the specified connection ID.
     * @remarks
     * If the connection ID has no active connections, it is removed from the credential store.
     * @param {BSTR} bstrWorkspaceId A string that contains a connection ID.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/workspaceruntime/nf-workspaceruntime-iworkspacescriptable-clearworkspacecredential
     */
    ClearWorkspaceCredential(bstrWorkspaceId) {
        bstrWorkspaceId := bstrWorkspaceId is String ? BSTR.Alloc(bstrWorkspaceId).Value : bstrWorkspaceId

        result := ComCall(11, this, BSTR, bstrWorkspaceId, "HRESULT")
        return result
    }

    /**
     * Marks the authentication of user credentials for the connection ID, and subsequently shows the connect notification in the taskbar notification area.
     * @param {BSTR} bstrWorkspaceId A string that contains the connection ID.
     * @param {BSTR} bstrUserName A string that contains a user name.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/workspaceruntime/nf-workspaceruntime-iworkspacescriptable-onauthenticated
     */
    OnAuthenticated(bstrWorkspaceId, bstrUserName) {
        bstrWorkspaceId := bstrWorkspaceId is String ? BSTR.Alloc(bstrWorkspaceId).Value : bstrWorkspaceId
        bstrUserName := bstrUserName is String ? BSTR.Alloc(bstrUserName).Value : bstrUserName

        result := ComCall(12, this, BSTR, bstrWorkspaceId, BSTR, bstrUserName, "HRESULT")
        return result
    }

    /**
     * Disconnects all existing connections associated with the connection that has the specified name.
     * @param {BSTR} bstrWorkspaceFriendlyName A string that contains the friendly name of the connection to disconnect.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/workspaceruntime/nf-workspaceruntime-iworkspacescriptable-disconnectworkspacebyfriendlyname
     */
    DisconnectWorkspaceByFriendlyName(bstrWorkspaceFriendlyName) {
        bstrWorkspaceFriendlyName := bstrWorkspaceFriendlyName is String ? BSTR.Alloc(bstrWorkspaceFriendlyName).Value : bstrWorkspaceFriendlyName

        result := ComCall(13, this, BSTR, bstrWorkspaceFriendlyName, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWorkspaceScriptable.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.DisconnectWorkspace := CallbackCreate(GetMethod(implObj, "DisconnectWorkspace"), flags, 2)
        this.vtbl.StartWorkspace := CallbackCreate(GetMethod(implObj, "StartWorkspace"), flags, 7)
        this.vtbl.IsWorkspaceCredentialSpecified := CallbackCreate(GetMethod(implObj, "IsWorkspaceCredentialSpecified"), flags, 4)
        this.vtbl.IsWorkspaceSSOEnabled := CallbackCreate(GetMethod(implObj, "IsWorkspaceSSOEnabled"), flags, 2)
        this.vtbl.ClearWorkspaceCredential := CallbackCreate(GetMethod(implObj, "ClearWorkspaceCredential"), flags, 2)
        this.vtbl.OnAuthenticated := CallbackCreate(GetMethod(implObj, "OnAuthenticated"), flags, 3)
        this.vtbl.DisconnectWorkspaceByFriendlyName := CallbackCreate(GetMethod(implObj, "DisconnectWorkspaceByFriendlyName"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.DisconnectWorkspace)
        CallbackFree(this.vtbl.StartWorkspace)
        CallbackFree(this.vtbl.IsWorkspaceCredentialSpecified)
        CallbackFree(this.vtbl.IsWorkspaceSSOEnabled)
        CallbackFree(this.vtbl.ClearWorkspaceCredential)
        CallbackFree(this.vtbl.OnAuthenticated)
        CallbackFree(this.vtbl.DisconnectWorkspaceByFriendlyName)
    }
}

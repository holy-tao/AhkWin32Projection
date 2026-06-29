#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IWorkspaceScriptable.ahk" { IWorkspaceScriptable }

/**
 * Exposes methods that manage RemoteApp and Desktop Connection credentials and connections. (IWorkspaceScriptable2)
 * @see https://learn.microsoft.com/windows/win32/api/workspaceruntime/nn-workspaceruntime-iworkspacescriptable2
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct IWorkspaceScriptable2 extends IWorkspaceScriptable {
    /**
     * The interface identifier for IWorkspaceScriptable2
     * @type {Guid}
     */
    static IID := Guid("{efea49a2-dda5-429d-8f42-b33ba2c4c348}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWorkspaceScriptable2 interfaces
    */
    struct Vtbl extends IWorkspaceScriptable.Vtbl {
        StartWorkspaceEx  : IntPtr
        ResourceDismissed : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWorkspaceScriptable2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Associates user credentials and certificates with a connection ID; also contains additional security and UI elements.
     * @param {BSTR} bstrWorkspaceId A string that contains the connection ID.
     * @param {BSTR} bstrWorkspaceFriendlyName The friendly name of the workspace to display in the UI.
     * @param {BSTR} bstrRedirectorName String containing the name of the redirector.
     * @param {BSTR} bstrUserName A string that contains a user name.
     * @param {BSTR} bstrPassword A string that contains a password.
     * @param {BSTR} bstrAppContainer A string containing the app container for the workspace.
     * @param {BSTR} bstrWorkspaceParams A string that contains one or more Secure Hash Algorithm 1 (SHA-1) hashes of signing certificates to associate with the specified connection ID. The hash values should be in hexadecimal string format and delimited by semicolons.
     * @param {Integer} lTimeout The time period, in minutes, after which the credentials are deleted.
     * @param {Integer} lFlags 
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following list.
     * @see https://learn.microsoft.com/windows/win32/api/workspaceruntime/nf-workspaceruntime-iworkspacescriptable2-startworkspaceex
     */
    StartWorkspaceEx(bstrWorkspaceId, bstrWorkspaceFriendlyName, bstrRedirectorName, bstrUserName, bstrPassword, bstrAppContainer, bstrWorkspaceParams, lTimeout, lFlags) {
        bstrWorkspaceId := bstrWorkspaceId is String ? BSTR.Alloc(bstrWorkspaceId).Value : bstrWorkspaceId
        bstrWorkspaceFriendlyName := bstrWorkspaceFriendlyName is String ? BSTR.Alloc(bstrWorkspaceFriendlyName).Value : bstrWorkspaceFriendlyName
        bstrRedirectorName := bstrRedirectorName is String ? BSTR.Alloc(bstrRedirectorName).Value : bstrRedirectorName
        bstrUserName := bstrUserName is String ? BSTR.Alloc(bstrUserName).Value : bstrUserName
        bstrPassword := bstrPassword is String ? BSTR.Alloc(bstrPassword).Value : bstrPassword
        bstrAppContainer := bstrAppContainer is String ? BSTR.Alloc(bstrAppContainer).Value : bstrAppContainer
        bstrWorkspaceParams := bstrWorkspaceParams is String ? BSTR.Alloc(bstrWorkspaceParams).Value : bstrWorkspaceParams

        result := ComCall(14, this, BSTR, bstrWorkspaceId, BSTR, bstrWorkspaceFriendlyName, BSTR, bstrRedirectorName, BSTR, bstrUserName, BSTR, bstrPassword, BSTR, bstrAppContainer, BSTR, bstrWorkspaceParams, "int", lTimeout, "int", lFlags, "HRESULT")
        return result
    }

    /**
     * Alerts the user that a resource has been disabled or otherwise dismissed.
     * @param {BSTR} bstrWorkspaceId String containing the ID of the workspace that contains the unavailable resource.
     * @param {BSTR} bstrWorkspaceFriendlyName String containing the friendly name of the workspace that holds the unavailable resource.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/workspaceruntime/nf-workspaceruntime-iworkspacescriptable2-resourcedismissed
     */
    ResourceDismissed(bstrWorkspaceId, bstrWorkspaceFriendlyName) {
        bstrWorkspaceId := bstrWorkspaceId is String ? BSTR.Alloc(bstrWorkspaceId).Value : bstrWorkspaceId
        bstrWorkspaceFriendlyName := bstrWorkspaceFriendlyName is String ? BSTR.Alloc(bstrWorkspaceFriendlyName).Value : bstrWorkspaceFriendlyName

        result := ComCall(15, this, BSTR, bstrWorkspaceId, BSTR, bstrWorkspaceFriendlyName, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWorkspaceScriptable2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.StartWorkspaceEx := CallbackCreate(GetMethod(implObj, "StartWorkspaceEx"), flags, 10)
        this.vtbl.ResourceDismissed := CallbackCreate(GetMethod(implObj, "ResourceDismissed"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.StartWorkspaceEx)
        CallbackFree(this.vtbl.ResourceDismissed)
    }
}

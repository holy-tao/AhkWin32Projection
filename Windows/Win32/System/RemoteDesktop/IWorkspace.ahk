#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import "..\Com\SAFEARRAY.ahk" { SAFEARRAY }

/**
 * Exposes methods that provide information about a connection in RemoteApp and Desktop Connection.
 * @see https://learn.microsoft.com/windows/win32/api/workspaceruntime/nn-workspaceruntime-iworkspace
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct IWorkspace extends IUnknown {
    /**
     * The interface identifier for IWorkspace
     * @type {Guid}
     */
    static IID := Guid("{b922bbb8-4c55-4fea-8496-beb0b44285e5}")

    /**
     * The class identifier for Workspace
     * @type {Guid}
     */
    static CLSID := Guid("{4f1dfca6-3aad-48e1-8406-4bc21a501d7c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWorkspace interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetWorkspaceNames      : IntPtr
        StartRemoteApplication : IntPtr
        GetProcessId           : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWorkspace.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the names of the connections in the current process.
     * @returns {Pointer<SAFEARRAY>} A pointer to an array of <b>BSTR</b> variables to receive the names of the connections.
     * @see https://learn.microsoft.com/windows/win32/api/workspaceruntime/nf-workspaceruntime-iworkspace-getworkspacenames
     */
    GetWorkspaceNames() {
        result := ComCall(3, this, "ptr*", &psaWkspNames := 0, "HRESULT")
        return psaWkspNames
    }

    /**
     * Starts a RemoteApp program.
     * @remarks
     * Calling the <b>StartRemoteApplication</b> method can result in a new connection.
     * 
     * When a custom client calls the <b>StartRemoteApplication</b> method, the workspace runtime verifies that the RDP file is properly signed. If the RDP file signature is not valid, the  user is prompted for new credentials with which to validate the file.
     * @param {BSTR} bstrWorkspaceId A string that contains the ID of the connection  in which to the start the application.
     * @param {Pointer<SAFEARRAY>} psaParams A pointer to an array of <b>BSTR</b> values that contains  parameters to pass to the workspace runtime.
     * 
     * For RDP connections, this parameter contains two strings:
     * 
     * <ul>
     * <li>Serialized RDP file</li>
     * <li>Command line parameters for Remote Desktop Connection client</li>
     * </ul>
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/workspaceruntime/nf-workspaceruntime-iworkspace-startremoteapplication
     */
    StartRemoteApplication(bstrWorkspaceId, psaParams) {
        bstrWorkspaceId := bstrWorkspaceId is String ? BSTR.Alloc(bstrWorkspaceId).Value : bstrWorkspaceId

        result := ComCall(4, this, BSTR, bstrWorkspaceId, SAFEARRAY.Ptr, psaParams, "HRESULT")
        return result
    }

    /**
     * Retrieves the process ID of the current connection in RemoteApp and Desktop Connection.
     * @returns {Integer} A pointer to a <b>ULONG</b> variable to receive the process ID.
     * @see https://learn.microsoft.com/windows/win32/api/workspaceruntime/nf-workspaceruntime-iworkspace-getprocessid
     */
    GetProcessId() {
        result := ComCall(5, this, "uint*", &pulProcessId := 0, "HRESULT")
        return pulProcessId
    }

    Query(iid) {
        if (IWorkspace.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetWorkspaceNames := CallbackCreate(GetMethod(implObj, "GetWorkspaceNames"), flags, 2)
        this.vtbl.StartRemoteApplication := CallbackCreate(GetMethod(implObj, "StartRemoteApplication"), flags, 3)
        this.vtbl.GetProcessId := CallbackCreate(GetMethod(implObj, "GetProcessId"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetWorkspaceNames)
        CallbackFree(this.vtbl.StartRemoteApplication)
        CallbackFree(this.vtbl.GetProcessId)
    }
}

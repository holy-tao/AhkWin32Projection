#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Exposes methods that provide information about a connection in RemoteApp and Desktop Connection.
 * @see https://docs.microsoft.com/windows/win32/api//workspaceruntime/nn-workspaceruntime-iworkspace
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class IWorkspace extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWorkspace
     * @type {Guid}
     */
    static IID => Guid("{b922bbb8-4c55-4fea-8496-beb0b44285e5}")

    /**
     * The class identifier for Workspace
     * @type {Guid}
     */
    static CLSID => Guid("{4f1dfca6-3aad-48e1-8406-4bc21a501d7c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetWorkspaceNames", "StartRemoteApplication", "GetProcessId"]

    /**
     * 
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/workspaceruntime/nf-workspaceruntime-iworkspace-getworkspacenames
     */
    GetWorkspaceNames() {
        result := ComCall(3, this, "ptr*", &psaWkspNames := 0, "HRESULT")
        return psaWkspNames
    }

    /**
     * 
     * @param {BSTR} bstrWorkspaceId 
     * @param {Pointer<SAFEARRAY>} psaParams 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/workspaceruntime/nf-workspaceruntime-iworkspace-startremoteapplication
     */
    StartRemoteApplication(bstrWorkspaceId, psaParams) {
        bstrWorkspaceId := bstrWorkspaceId is String ? BSTR.Alloc(bstrWorkspaceId).Value : bstrWorkspaceId

        result := ComCall(4, this, "ptr", bstrWorkspaceId, "ptr", psaParams, "HRESULT")
        return result
    }

    /**
     * Retrieves the process identifier of the specified process.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-getprocessid
     */
    GetProcessId() {
        result := ComCall(5, this, "uint*", &pulProcessId := 0, "HRESULT")
        return pulProcessId
    }
}

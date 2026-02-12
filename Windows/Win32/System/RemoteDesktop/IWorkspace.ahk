#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Exposes methods that provide information about a connection in RemoteApp and Desktop Connection.
 * @see https://learn.microsoft.com/windows/win32/api//content/workspaceruntime/nn-workspaceruntime-iworkspace
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
     * Retrieves the names of the connections in the current process.
     * @returns {Pointer<SAFEARRAY>} A pointer to an array of <b>BSTR</b> variables to receive the names of the connections.
     * @see https://learn.microsoft.com/windows/win32/api//content/workspaceruntime/nf-workspaceruntime-iworkspace-getworkspacenames
     */
    GetWorkspaceNames() {
        result := ComCall(3, this, "ptr*", &psaWkspNames := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/workspaceruntime/nf-workspaceruntime-iworkspace-startremoteapplication
     */
    StartRemoteApplication(bstrWorkspaceId, psaParams) {
        if(bstrWorkspaceId is String) {
            pin := BSTR.Alloc(bstrWorkspaceId)
            bstrWorkspaceId := pin.Value
        }

        result := ComCall(4, this, "ptr", bstrWorkspaceId, "ptr", psaParams, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the process ID of the current connection in RemoteApp and Desktop Connection.
     * @returns {Integer} A pointer to a <b>ULONG</b> variable to receive the process ID.
     * @see https://learn.microsoft.com/windows/win32/api//content/workspaceruntime/nf-workspaceruntime-iworkspace-getprocessid
     */
    GetProcessId() {
        result := ComCall(5, this, "uint*", &pulProcessId := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pulProcessId
    }
}

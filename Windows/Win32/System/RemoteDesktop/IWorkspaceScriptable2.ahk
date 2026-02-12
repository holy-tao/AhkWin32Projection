#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IWorkspaceScriptable.ahk

/**
 * Exposes methods that manage RemoteApp and Desktop Connection credentials and connections. (IWorkspaceScriptable2)
 * @see https://learn.microsoft.com/windows/win32/api//content/workspaceruntime/nn-workspaceruntime-iworkspacescriptable2
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class IWorkspaceScriptable2 extends IWorkspaceScriptable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWorkspaceScriptable2
     * @type {Guid}
     */
    static IID => Guid("{efea49a2-dda5-429d-8f42-b33ba2c4c348}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 14

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["StartWorkspaceEx", "ResourceDismissed"]

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
     * @see https://learn.microsoft.com/windows/win32/api//content/workspaceruntime/nf-workspaceruntime-iworkspacescriptable2-startworkspaceex
     */
    StartWorkspaceEx(bstrWorkspaceId, bstrWorkspaceFriendlyName, bstrRedirectorName, bstrUserName, bstrPassword, bstrAppContainer, bstrWorkspaceParams, lTimeout, lFlags) {
        if(bstrWorkspaceId is String) {
            pin := BSTR.Alloc(bstrWorkspaceId)
            bstrWorkspaceId := pin.Value
        }
        if(bstrWorkspaceFriendlyName is String) {
            pin := BSTR.Alloc(bstrWorkspaceFriendlyName)
            bstrWorkspaceFriendlyName := pin.Value
        }
        if(bstrRedirectorName is String) {
            pin := BSTR.Alloc(bstrRedirectorName)
            bstrRedirectorName := pin.Value
        }
        if(bstrUserName is String) {
            pin := BSTR.Alloc(bstrUserName)
            bstrUserName := pin.Value
        }
        if(bstrPassword is String) {
            pin := BSTR.Alloc(bstrPassword)
            bstrPassword := pin.Value
        }
        if(bstrAppContainer is String) {
            pin := BSTR.Alloc(bstrAppContainer)
            bstrAppContainer := pin.Value
        }
        if(bstrWorkspaceParams is String) {
            pin := BSTR.Alloc(bstrWorkspaceParams)
            bstrWorkspaceParams := pin.Value
        }

        result := ComCall(14, this, "ptr", bstrWorkspaceId, "ptr", bstrWorkspaceFriendlyName, "ptr", bstrRedirectorName, "ptr", bstrUserName, "ptr", bstrPassword, "ptr", bstrAppContainer, "ptr", bstrWorkspaceParams, "int", lTimeout, "int", lFlags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Alerts the user that a resource has been disabled or otherwise dismissed.
     * @param {BSTR} bstrWorkspaceId String containing the ID of the workspace that contains the unavailable resource.
     * @param {BSTR} bstrWorkspaceFriendlyName String containing the friendly name of the workspace that holds the unavailable resource.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/workspaceruntime/nf-workspaceruntime-iworkspacescriptable2-resourcedismissed
     */
    ResourceDismissed(bstrWorkspaceId, bstrWorkspaceFriendlyName) {
        if(bstrWorkspaceId is String) {
            pin := BSTR.Alloc(bstrWorkspaceId)
            bstrWorkspaceId := pin.Value
        }
        if(bstrWorkspaceFriendlyName is String) {
            pin := BSTR.Alloc(bstrWorkspaceFriendlyName)
            bstrWorkspaceFriendlyName := pin.Value
        }

        result := ComCall(15, this, "ptr", bstrWorkspaceId, "ptr", bstrWorkspaceFriendlyName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

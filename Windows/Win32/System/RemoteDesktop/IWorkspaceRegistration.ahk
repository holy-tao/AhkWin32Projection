#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Exposes methods that add and remove references to custom clients in RemoteApp and Desktop Connection.
 * @see https://docs.microsoft.com/windows/win32/api//workspaceruntime/nn-workspaceruntime-iworkspaceregistration
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class IWorkspaceRegistration extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWorkspaceRegistration
     * @type {Guid}
     */
    static IID => Guid("{b922bbb8-4c55-4fea-8496-beb0b44285e6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddResource", "RemoveResource"]

    /**
     * Adds a resource to the connection in RemoteApp and Desktop Connection.
     * @param {IWorkspaceClientExt} pUnk A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/workspaceruntimeclientext/nn-workspaceruntimeclientext-iworkspaceclientext">IWorkspaceClientExt</a> object  that called this method.
     * @returns {Integer} A pointer to a <b>DWORD</b> variable to receive the connection cookie for a new resource.
     * @see https://docs.microsoft.com/windows/win32/api//workspaceruntime/nf-workspaceruntime-iworkspaceregistration-addresource
     */
    AddResource(pUnk) {
        result := ComCall(3, this, "ptr", pUnk, "uint*", &pdwCookie := 0, "HRESULT")
        return pdwCookie
    }

    /**
     * Notifies the RemoteApp and Desktop Connection runtime that the client is disconnecting the connection.
     * @param {Integer} dwCookieConnection A <b>DWORD</b> value that contains a connection cookie returned by the <a href="https://docs.microsoft.com/windows/desktop/api/workspaceruntime/nf-workspaceruntime-iworkspaceregistration-addresource">AddResource</a> method.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//workspaceruntime/nf-workspaceruntime-iworkspaceregistration-removeresource
     */
    RemoveResource(dwCookieConnection) {
        result := ComCall(4, this, "uint", dwCookieConnection, "HRESULT")
        return result
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Exposes methods that allow the runtime to disconnect a custom client in RemoteApp and Desktop Connection.
 * @see https://docs.microsoft.com/windows/win32/api//workspaceruntimeclientext/nn-workspaceruntimeclientext-iworkspaceclientext
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class IWorkspaceClientExt extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWorkspaceClientExt
     * @type {Guid}
     */
    static IID => Guid("{12b952f4-41ca-4f21-a829-a6d07d9a16e5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetResourceId", "GetResourceDisplayName", "IssueDisconnect"]

    /**
     * Returns the ID of the custom client in RemoteApp and Desktop Connection.
     * @returns {BSTR} A pointer to a <b>BSTR</b> variable to receive the ID of the custom client.
     * @see https://docs.microsoft.com/windows/win32/api//workspaceruntimeclientext/nf-workspaceruntimeclientext-iworkspaceclientext-getresourceid
     */
    GetResourceId() {
        bstrWorkspaceId := BSTR()
        result := ComCall(3, this, "ptr", bstrWorkspaceId, "HRESULT")
        return bstrWorkspaceId
    }

    /**
     * Returns the display name of the custom client in RemoteApp and Desktop Connection.
     * @returns {BSTR} A pointer to a <b>BSTR</b> variable to receive the display name.
     * @see https://docs.microsoft.com/windows/win32/api//workspaceruntimeclientext/nf-workspaceruntimeclientext-iworkspaceclientext-getresourcedisplayname
     */
    GetResourceDisplayName() {
        bstrWorkspaceDisplayName := BSTR()
        result := ComCall(4, this, "ptr", bstrWorkspaceDisplayName, "HRESULT")
        return bstrWorkspaceDisplayName
    }

    /**
     * Disconnects the custom client in RemoteApp and Desktop Connection.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//workspaceruntimeclientext/nf-workspaceruntimeclientext-iworkspaceclientext-issuedisconnect
     */
    IssueDisconnect() {
        result := ComCall(5, this, "HRESULT")
        return result
    }
}

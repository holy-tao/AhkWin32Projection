#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Exposes methods that manage RemoteApp and Desktop Connection credentials and connections.
 * @see https://docs.microsoft.com/windows/win32/api//workspaceruntime/nn-workspaceruntime-iworkspacescriptable
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class IWorkspaceScriptable extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWorkspaceScriptable
     * @type {Guid}
     */
    static IID => Guid("{efea49a2-dda5-429d-8f42-b23b92c4c347}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["DisconnectWorkspace", "StartWorkspace", "IsWorkspaceCredentialSpecified", "IsWorkspaceSSOEnabled", "ClearWorkspaceCredential", "OnAuthenticated", "DisconnectWorkspaceByFriendlyName"]

    /**
     * Disconnects all existing connections associated with the specified connection ID.
     * @param {BSTR} bstrWorkspaceId A string that contains the connection ID of the connection to disconnect.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//workspaceruntime/nf-workspaceruntime-iworkspacescriptable-disconnectworkspace
     */
    DisconnectWorkspace(bstrWorkspaceId) {
        bstrWorkspaceId := bstrWorkspaceId is String ? BSTR.Alloc(bstrWorkspaceId).Value : bstrWorkspaceId

        result := ComCall(7, this, "ptr", bstrWorkspaceId, "HRESULT")
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
     * @see https://docs.microsoft.com/windows/win32/api//workspaceruntime/nf-workspaceruntime-iworkspacescriptable-startworkspace
     */
    StartWorkspace(bstrWorkspaceId, bstrUserName, bstrPassword, bstrWorkspaceParams, lTimeout, lFlags) {
        bstrWorkspaceId := bstrWorkspaceId is String ? BSTR.Alloc(bstrWorkspaceId).Value : bstrWorkspaceId
        bstrUserName := bstrUserName is String ? BSTR.Alloc(bstrUserName).Value : bstrUserName
        bstrPassword := bstrPassword is String ? BSTR.Alloc(bstrPassword).Value : bstrPassword
        bstrWorkspaceParams := bstrWorkspaceParams is String ? BSTR.Alloc(bstrWorkspaceParams).Value : bstrWorkspaceParams

        result := ComCall(8, this, "ptr", bstrWorkspaceId, "ptr", bstrUserName, "ptr", bstrPassword, "ptr", bstrWorkspaceParams, "int", lTimeout, "int", lFlags, "HRESULT")
        return result
    }

    /**
     * Determines whether user credentials exist for the specified connection ID.
     * @param {BSTR} bstrWorkspaceId A string that contains the connection ID.
     * @param {VARIANT_BOOL} bCountUnauthenticatedCredentials <b>VARIANT_TRUE</b> to specify that the <i>pbCredExist</i> parameter should return <b>VARIANT_TRUE</b> if credentials (authenticated or unauthenticated) exist for the connection ID specified in the <i>bstrWorkspaceId</i> parameter. <b>VARIANT_FALSE</b> to specify that the <i>pbCredExist</i> parameter should return <b>VARIANT_TRUE</b> only if authenticated credentials exist for the connection ID specified in the <i>bstrWorkspaceId</i> parameter.
     * @returns {VARIANT_BOOL} A pointer to a <b>VARIANT_BOOL</b> variable to receive whether credentials exist for the connection ID specified in the <i>bstrWorkspaceId</i> parameter. This value is <b>VARIANT_TRUE</b> if credentials exist; otherwise, <b>VARIANT_FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//workspaceruntime/nf-workspaceruntime-iworkspacescriptable-isworkspacecredentialspecified
     */
    IsWorkspaceCredentialSpecified(bstrWorkspaceId, bCountUnauthenticatedCredentials) {
        bstrWorkspaceId := bstrWorkspaceId is String ? BSTR.Alloc(bstrWorkspaceId).Value : bstrWorkspaceId

        result := ComCall(9, this, "ptr", bstrWorkspaceId, "short", bCountUnauthenticatedCredentials, "short*", &pbCredExist := 0, "HRESULT")
        return pbCredExist
    }

    /**
     * Determines whether single sign on (SSO) is enabled for RemoteApp and Desktop Connection.
     * @returns {VARIANT_BOOL} A pointer to a <b>VARIANT_BOOL</b> variable to receive  whether SSO is enabled. This value is <b>VARIANT_TRUE</b> if SSO is enabled; otherwise, <b>VARIANT_FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//workspaceruntime/nf-workspaceruntime-iworkspacescriptable-isworkspacessoenabled
     */
    IsWorkspaceSSOEnabled() {
        result := ComCall(10, this, "short*", &pbSSOEnabled := 0, "HRESULT")
        return pbSSOEnabled
    }

    /**
     * Deletes the user credentials associated with the specified connection ID.
     * @param {BSTR} bstrWorkspaceId A string that contains a connection ID.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//workspaceruntime/nf-workspaceruntime-iworkspacescriptable-clearworkspacecredential
     */
    ClearWorkspaceCredential(bstrWorkspaceId) {
        bstrWorkspaceId := bstrWorkspaceId is String ? BSTR.Alloc(bstrWorkspaceId).Value : bstrWorkspaceId

        result := ComCall(11, this, "ptr", bstrWorkspaceId, "HRESULT")
        return result
    }

    /**
     * Marks the authentication of user credentials for the connection ID, and subsequently shows the connect notification in the taskbar notification area.
     * @param {BSTR} bstrWorkspaceId A string that contains the connection ID.
     * @param {BSTR} bstrUserName A string that contains a user name.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//workspaceruntime/nf-workspaceruntime-iworkspacescriptable-onauthenticated
     */
    OnAuthenticated(bstrWorkspaceId, bstrUserName) {
        bstrWorkspaceId := bstrWorkspaceId is String ? BSTR.Alloc(bstrWorkspaceId).Value : bstrWorkspaceId
        bstrUserName := bstrUserName is String ? BSTR.Alloc(bstrUserName).Value : bstrUserName

        result := ComCall(12, this, "ptr", bstrWorkspaceId, "ptr", bstrUserName, "HRESULT")
        return result
    }

    /**
     * Disconnects all existing connections associated with the connection that has the specified name.
     * @param {BSTR} bstrWorkspaceFriendlyName A string that contains the friendly name of the connection to disconnect.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//workspaceruntime/nf-workspaceruntime-iworkspacescriptable-disconnectworkspacebyfriendlyname
     */
    DisconnectWorkspaceByFriendlyName(bstrWorkspaceFriendlyName) {
        bstrWorkspaceFriendlyName := bstrWorkspaceFriendlyName is String ? BSTR.Alloc(bstrWorkspaceFriendlyName).Value : bstrWorkspaceFriendlyName

        result := ComCall(13, this, "ptr", bstrWorkspaceFriendlyName, "HRESULT")
        return result
    }
}

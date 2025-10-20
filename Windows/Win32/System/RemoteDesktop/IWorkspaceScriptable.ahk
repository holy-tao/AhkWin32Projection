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
     * 
     * @param {BSTR} bstrWorkspaceId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/workspaceruntime/nf-workspaceruntime-iworkspacescriptable-disconnectworkspace
     */
    DisconnectWorkspace(bstrWorkspaceId) {
        bstrWorkspaceId := bstrWorkspaceId is String ? BSTR.Alloc(bstrWorkspaceId).Value : bstrWorkspaceId

        result := ComCall(7, this, "ptr", bstrWorkspaceId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrWorkspaceId 
     * @param {BSTR} bstrUserName 
     * @param {BSTR} bstrPassword 
     * @param {BSTR} bstrWorkspaceParams 
     * @param {Integer} lTimeout 
     * @param {Integer} lFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/workspaceruntime/nf-workspaceruntime-iworkspacescriptable-startworkspace
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
     * 
     * @param {BSTR} bstrWorkspaceId 
     * @param {VARIANT_BOOL} bCountUnauthenticatedCredentials 
     * @param {Pointer<VARIANT_BOOL>} pbCredExist 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/workspaceruntime/nf-workspaceruntime-iworkspacescriptable-isworkspacecredentialspecified
     */
    IsWorkspaceCredentialSpecified(bstrWorkspaceId, bCountUnauthenticatedCredentials, pbCredExist) {
        bstrWorkspaceId := bstrWorkspaceId is String ? BSTR.Alloc(bstrWorkspaceId).Value : bstrWorkspaceId

        result := ComCall(9, this, "ptr", bstrWorkspaceId, "short", bCountUnauthenticatedCredentials, "ptr", pbCredExist, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbSSOEnabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/workspaceruntime/nf-workspaceruntime-iworkspacescriptable-isworkspacessoenabled
     */
    IsWorkspaceSSOEnabled(pbSSOEnabled) {
        result := ComCall(10, this, "ptr", pbSSOEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrWorkspaceId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/workspaceruntime/nf-workspaceruntime-iworkspacescriptable-clearworkspacecredential
     */
    ClearWorkspaceCredential(bstrWorkspaceId) {
        bstrWorkspaceId := bstrWorkspaceId is String ? BSTR.Alloc(bstrWorkspaceId).Value : bstrWorkspaceId

        result := ComCall(11, this, "ptr", bstrWorkspaceId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrWorkspaceId 
     * @param {BSTR} bstrUserName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/workspaceruntime/nf-workspaceruntime-iworkspacescriptable-onauthenticated
     */
    OnAuthenticated(bstrWorkspaceId, bstrUserName) {
        bstrWorkspaceId := bstrWorkspaceId is String ? BSTR.Alloc(bstrWorkspaceId).Value : bstrWorkspaceId
        bstrUserName := bstrUserName is String ? BSTR.Alloc(bstrUserName).Value : bstrUserName

        result := ComCall(12, this, "ptr", bstrWorkspaceId, "ptr", bstrUserName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrWorkspaceFriendlyName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/workspaceruntime/nf-workspaceruntime-iworkspacescriptable-disconnectworkspacebyfriendlyname
     */
    DisconnectWorkspaceByFriendlyName(bstrWorkspaceFriendlyName) {
        bstrWorkspaceFriendlyName := bstrWorkspaceFriendlyName is String ? BSTR.Alloc(bstrWorkspaceFriendlyName).Value : bstrWorkspaceFriendlyName

        result := ComCall(13, this, "ptr", bstrWorkspaceFriendlyName, "HRESULT")
        return result
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IWorkspaceScriptable.ahk

/**
 * Exposes methods that manage RemoteApp and Desktop Connection credentials and connections.
 * @see https://docs.microsoft.com/windows/win32/api//workspaceruntime/nn-workspaceruntime-iworkspacescriptable2
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
     * 
     * @param {BSTR} bstrWorkspaceId 
     * @param {BSTR} bstrWorkspaceFriendlyName 
     * @param {BSTR} bstrRedirectorName 
     * @param {BSTR} bstrUserName 
     * @param {BSTR} bstrPassword 
     * @param {BSTR} bstrAppContainer 
     * @param {BSTR} bstrWorkspaceParams 
     * @param {Integer} lTimeout 
     * @param {Integer} lFlags 
     * @returns {HRESULT} 
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

        result := ComCall(14, this, "ptr", bstrWorkspaceId, "ptr", bstrWorkspaceFriendlyName, "ptr", bstrRedirectorName, "ptr", bstrUserName, "ptr", bstrPassword, "ptr", bstrAppContainer, "ptr", bstrWorkspaceParams, "int", lTimeout, "int", lFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrWorkspaceId 
     * @param {BSTR} bstrWorkspaceFriendlyName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/workspaceruntime/nf-workspaceruntime-iworkspacescriptable2-resourcedismissed
     */
    ResourceDismissed(bstrWorkspaceId, bstrWorkspaceFriendlyName) {
        bstrWorkspaceId := bstrWorkspaceId is String ? BSTR.Alloc(bstrWorkspaceId).Value : bstrWorkspaceId
        bstrWorkspaceFriendlyName := bstrWorkspaceFriendlyName is String ? BSTR.Alloc(bstrWorkspaceFriendlyName).Value : bstrWorkspaceFriendlyName

        result := ComCall(15, this, "ptr", bstrWorkspaceId, "ptr", bstrWorkspaceFriendlyName, "HRESULT")
        return result
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IWorkspace.ahk

/**
 * Exposes additional methods that provide information about a connection in RemoteApp and Desktop Connection.
 * @see https://docs.microsoft.com/windows/win32/api//workspaceruntime/nn-workspaceruntime-iworkspace2
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class IWorkspace2 extends IWorkspace{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWorkspace2
     * @type {Guid}
     */
    static IID => Guid("{96d8d7cf-783e-4286-834c-ebc0e95f783c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["StartRemoteApplicationEx"]

    /**
     * 
     * @param {BSTR} bstrWorkspaceId 
     * @param {BSTR} bstrRequestingAppId 
     * @param {BSTR} bstrRequestingAppFamilyName 
     * @param {VARIANT_BOOL} bLaunchIntoImmersiveClient 
     * @param {BSTR} bstrImmersiveClientActivationContext 
     * @param {Pointer<SAFEARRAY>} psaParams 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/workspaceruntime/nf-workspaceruntime-iworkspace2-startremoteapplicationex
     */
    StartRemoteApplicationEx(bstrWorkspaceId, bstrRequestingAppId, bstrRequestingAppFamilyName, bLaunchIntoImmersiveClient, bstrImmersiveClientActivationContext, psaParams) {
        bstrWorkspaceId := bstrWorkspaceId is String ? BSTR.Alloc(bstrWorkspaceId).Value : bstrWorkspaceId
        bstrRequestingAppId := bstrRequestingAppId is String ? BSTR.Alloc(bstrRequestingAppId).Value : bstrRequestingAppId
        bstrRequestingAppFamilyName := bstrRequestingAppFamilyName is String ? BSTR.Alloc(bstrRequestingAppFamilyName).Value : bstrRequestingAppFamilyName
        bstrImmersiveClientActivationContext := bstrImmersiveClientActivationContext is String ? BSTR.Alloc(bstrImmersiveClientActivationContext).Value : bstrImmersiveClientActivationContext

        result := ComCall(6, this, "ptr", bstrWorkspaceId, "ptr", bstrRequestingAppId, "ptr", bstrRequestingAppFamilyName, "short", bLaunchIntoImmersiveClient, "ptr", bstrImmersiveClientActivationContext, "ptr", psaParams, "HRESULT")
        return result
    }
}

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
     * Not supported.
     * @param {BSTR} bstrWorkspaceId A string that contains the ID of the connection  in which to the start the application.
     * @param {BSTR} bstrRequestingAppId A string that contains the ID of an application to launch on the remote desktop.
     * @param {BSTR} bstrRequestingAppFamilyName A string that contains the family name of the application to launch.
     * @param {VARIANT_BOOL} bLaunchIntoImmersiveClient <b>VARIANT_TRUE</b> to make the remote application launch as though it were accessed via the web client, using the modern Remote Desktop protocol. <b>VARIANT_FALSE</b> to make the remote application launch using classic Terminal Server methodology.
     * @param {BSTR} bstrImmersiveClientActivationContext A string containing the context for the specific remote desktop client.
     * @param {Pointer<SAFEARRAY>} psaParams A pointer to an array of <b>BSTR</b> values that contains  parameters to pass to the workspace runtime.
     * 
     * For RDP connections, this parameter contains two strings:
     * 
     * <ul>
     * <li>Serialized RDP file</li>
     * <li>Command line parameters for Remote Desktop Connection client</li>
     * </ul>
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//workspaceruntime/nf-workspaceruntime-iworkspace2-startremoteapplicationex
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

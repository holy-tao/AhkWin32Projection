#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\UI\Shell\PropertiesSystem\IPropertyStore.ahk
#Include .\ISyncProviderInfo.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Represents configuration UI information used to build and register a synchronization provider.
 * @remarks
 * 
 * The writer of a synchronization provider should implement an <b>ISyncProviderConfigUI</b> (a builder) for a synchronization provider if it requires additional information and properties to be set before it can be created. For example, a synchronization provider may require a user to enter credentials before their data can be synchronized.
 * 
 * If the registered synchronization provider is a <a href="https://www.microsoft.com/downloads/details.aspx?familyid=A3EE7BC5-A823-4FB4-B152-9E8CE9D5546F&displaylang=en">Microsoft Sync Framework</a> provider, then the <b>Init</b>method will be called by the Sync Framework synchronization session. For more information about the different types of synchronization providers you can write for Windows, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/winsync/options-for-building-a-synchronization-provider">Options for Building a Synchronization Provider</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//syncregistration/nn-syncregistration-isyncproviderconfigui
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class ISyncProviderConfigUI extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISyncProviderConfigUI
     * @type {Guid}
     */
    static IID => Guid("{7b0705f6-cbcd-4071-ab05-3bdc364d4a0c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Init", "GetRegisteredProperties", "CreateAndRegisterNewSyncProvider", "ModifySyncProvider"]

    /**
     * Initializes the configuration UI for a synchronization provider.
     * @param {Pointer<Guid>} pguidInstanceId The instance ID of the configuration UI.
     * @param {Pointer<Guid>} pguidContentType A GUID that represents the content type that is associated with the synchronization provider that this configuration UI will create.
     * @param {IPropertyStore} pConfigurationProperties The properties that should be specified when the configuration UI is registering the synchronization provider. These properties are also used to  properly initialize
     *         the configuration UI object.
     * @returns {HRESULT} The possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//syncregistration/nf-syncregistration-isyncproviderconfigui-init
     */
    Init(pguidInstanceId, pguidContentType, pConfigurationProperties) {
        result := ComCall(3, this, "ptr", pguidInstanceId, "ptr", pguidContentType, "ptr", pConfigurationProperties, "HRESULT")
        return result
    }

    /**
     * Obtains configuration UI properties for reading and writing.
     * @returns {IPropertyStore} Returns the <b>IPropertyStore</b> object that contains the configuration UI properties for reading and writing. Both the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/syncregistration/nn-syncregistration-isyncproviderinfo">ISyncProviderInfo</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/syncregistration/nn-syncregistration-isyncproviderconfiguiinfo">ISyncProviderConfigUIInfo</a> interfaces inherit from <b>IPropertyStore</b>.
     * @see https://docs.microsoft.com/windows/win32/api//syncregistration/nf-syncregistration-isyncproviderconfigui-getregisteredproperties
     */
    GetRegisteredProperties() {
        result := ComCall(4, this, "ptr*", &ppConfigUIProperties := 0, "HRESULT")
        return IPropertyStore(ppConfigUIProperties)
    }

    /**
     * Creates and registers a new synchronization provider.
     * @param {HWND} hwndParent HWND serving as the parent for the configuration UI that needs to be presented before the synchronization provider can be created. 
     *     	The HWND should be <b>NULL</b> only if the <b>dwCapabilities</b> member of the <a href="https://docs.microsoft.com/windows/win32/api/syncregistration/ns-syncregistration-syncproviderconfiguiconfiguration">SyncProviderConfigUIConfiguration</a> structure is set to not support a UI.
     * @param {IUnknown} pUnkContext Pointer to an interface containing additional information needed to generate the synchronization provider. The pointer will be <b>NULL</b> if no additional information is needed.
     * @returns {ISyncProviderInfo} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/syncregistration/nn-syncregistration-isyncproviderinfo">ISyncProviderInfo</a> object that contains information about the newly created and registered synchronization provider.
     * @see https://docs.microsoft.com/windows/win32/api//syncregistration/nf-syncregistration-isyncproviderconfigui-createandregisternewsyncprovider
     */
    CreateAndRegisterNewSyncProvider(hwndParent, pUnkContext) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := ComCall(5, this, "ptr", hwndParent, "ptr", pUnkContext, "ptr*", &ppProviderInfo := 0, "HRESULT")
        return ISyncProviderInfo(ppProviderInfo)
    }

    /**
     * Updates the ISyncProviderInfo of the synchronization provider that is configured by this ISyncProviderConfigUI.
     * @param {HWND} hwndParent HWND serving as the parent for the configuration UI that needs to be presented before the synchronization provider can be created. 
     *     	The HWND should be <b>NULL</b> only if the <b>dwCapabilities</b> member of the <a href="https://docs.microsoft.com/windows/win32/api/syncregistration/ns-syncregistration-syncproviderconfiguiconfiguration">SyncProviderConfigUIConfiguration</a> structure is set to not support a UI.
     * @param {IUnknown} pUnkContext Pointer to an interface containing additional information needed to generate the synchronization provider. The pointer will be <b>NULL</b> if no additional information is needed.
     * @param {ISyncProviderInfo} pProviderInfo An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/syncregistration/nn-syncregistration-isyncproviderinfo">ISyncProviderInfo</a> that provides information about the synchronization provider that is being modified.
     * @returns {HRESULT} The possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid pointer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//syncregistration/nf-syncregistration-isyncproviderconfigui-modifysyncprovider
     */
    ModifySyncProvider(hwndParent, pUnkContext, pProviderInfo) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := ComCall(6, this, "ptr", hwndParent, "ptr", pUnkContext, "ptr", pProviderInfo, "HRESULT")
        return result
    }
}

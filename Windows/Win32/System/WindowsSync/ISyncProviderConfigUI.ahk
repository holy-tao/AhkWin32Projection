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
     * 
     * @param {Pointer<Guid>} pguidInstanceId 
     * @param {Pointer<Guid>} pguidContentType 
     * @param {IPropertyStore} pConfigurationProperties 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/syncregistration/nf-syncregistration-isyncproviderconfigui-init
     */
    Init(pguidInstanceId, pguidContentType, pConfigurationProperties) {
        result := ComCall(3, this, "ptr", pguidInstanceId, "ptr", pguidContentType, "ptr", pConfigurationProperties, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IPropertyStore} 
     * @see https://learn.microsoft.com/windows/win32/api/syncregistration/nf-syncregistration-isyncproviderconfigui-getregisteredproperties
     */
    GetRegisteredProperties() {
        result := ComCall(4, this, "ptr*", &ppConfigUIProperties := 0, "HRESULT")
        return IPropertyStore(ppConfigUIProperties)
    }

    /**
     * 
     * @param {HWND} hwndParent 
     * @param {IUnknown} pUnkContext 
     * @returns {ISyncProviderInfo} 
     * @see https://learn.microsoft.com/windows/win32/api/syncregistration/nf-syncregistration-isyncproviderconfigui-createandregisternewsyncprovider
     */
    CreateAndRegisterNewSyncProvider(hwndParent, pUnkContext) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := ComCall(5, this, "ptr", hwndParent, "ptr", pUnkContext, "ptr*", &ppProviderInfo := 0, "HRESULT")
        return ISyncProviderInfo(ppProviderInfo)
    }

    /**
     * 
     * @param {HWND} hwndParent 
     * @param {IUnknown} pUnkContext 
     * @param {ISyncProviderInfo} pProviderInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/syncregistration/nf-syncregistration-isyncproviderconfigui-modifysyncprovider
     */
    ModifySyncProvider(hwndParent, pUnkContext, pProviderInfo) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := ComCall(6, this, "ptr", hwndParent, "ptr", pUnkContext, "ptr", pProviderInfo, "HRESULT")
        return result
    }
}

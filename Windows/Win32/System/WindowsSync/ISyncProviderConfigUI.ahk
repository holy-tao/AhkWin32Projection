#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<Guid>} pguidInstanceId 
     * @param {Pointer<Guid>} pguidContentType 
     * @param {Pointer<IPropertyStore>} pConfigurationProperties 
     * @returns {HRESULT} 
     */
    Init(pguidInstanceId, pguidContentType, pConfigurationProperties) {
        result := ComCall(3, this, "ptr", pguidInstanceId, "ptr", pguidContentType, "ptr", pConfigurationProperties, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IPropertyStore>} ppConfigUIProperties 
     * @returns {HRESULT} 
     */
    GetRegisteredProperties(ppConfigUIProperties) {
        result := ComCall(4, this, "ptr", ppConfigUIProperties, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HWND} hwndParent 
     * @param {Pointer<IUnknown>} pUnkContext 
     * @param {Pointer<ISyncProviderInfo>} ppProviderInfo 
     * @returns {HRESULT} 
     */
    CreateAndRegisterNewSyncProvider(hwndParent, pUnkContext, ppProviderInfo) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := ComCall(5, this, "ptr", hwndParent, "ptr", pUnkContext, "ptr", ppProviderInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HWND} hwndParent 
     * @param {Pointer<IUnknown>} pUnkContext 
     * @param {Pointer<ISyncProviderInfo>} pProviderInfo 
     * @returns {HRESULT} 
     */
    ModifySyncProvider(hwndParent, pUnkContext, pProviderInfo) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := ComCall(6, this, "ptr", hwndParent, "ptr", pUnkContext, "ptr", pProviderInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

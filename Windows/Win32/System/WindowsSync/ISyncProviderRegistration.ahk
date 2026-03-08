#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISyncProviderConfigUIInfo.ahk
#Include .\IEnumSyncProviderConfigUIInfos.ahk
#Include .\ISyncProviderInfo.ahk
#Include .\IEnumSyncProviderInfos.ahk
#Include .\IRegisteredSyncProvider.ahk
#Include .\ISyncProviderConfigUI.ahk
#Include .\ISyncRegistrationChange.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Represents synchronization provider registration.
 * @see https://learn.microsoft.com/windows/win32/api/syncregistration/nn-syncregistration-isyncproviderregistration
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class ISyncProviderRegistration extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISyncProviderRegistration
     * @type {Guid}
     */
    static IID => Guid("{cb45953b-7624-47bc-a472-eb8cac6b222e}")

    /**
     * The class identifier for SyncProviderRegistration
     * @type {Guid}
     */
    static CLSID => Guid("{f82b4ef1-93a9-4dde-8015-f7950a1a6e31}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateSyncProviderConfigUIRegistrationInstance", "UnregisterSyncProviderConfigUI", "EnumerateSyncProviderConfigUIs", "CreateSyncProviderRegistrationInstance", "UnregisterSyncProvider", "GetSyncProviderConfigUIInfoforProvider", "EnumerateSyncProviders", "GetSyncProviderInfo", "GetSyncProviderFromInstanceId", "GetSyncProviderConfigUIInfo", "GetSyncProviderConfigUIFromInstanceId", "GetSyncProviderState", "SetSyncProviderState", "RegisterForEvent", "RevokeEvent", "GetChange"]

    /**
     * Creates an in-memory instance of a synchronization provider configuration UI.
     * @remarks
     * The configuration UI is not registered on the system until the <b>ISyncProviderConfigUIInfo::Commit</b> method is called. This method is inherited by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/syncregistration/nn-syncregistration-isyncproviderconfiguiinfo">ISyncProviderConfigUIInfo</a> from <b>IPropertyStore</b>.
     * @param {Pointer<SyncProviderConfigUIConfiguration>} pConfigUIConfig A <a href="https://docs.microsoft.com/windows/win32/api/syncregistration/ns-syncregistration-syncproviderconfiguiconfiguration">SyncProviderConfigUIConfiguration</a> structure that contains the configuration UI registration information.
     * @returns {ISyncProviderConfigUIInfo} Returns a pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/syncregistration/nn-syncregistration-isyncproviderconfiguiinfo">ISyncProviderConfigUIInfo</a> interface that is used to store the configuration UI’s UX elements and any necessary persisted configuration information.
     * @see https://learn.microsoft.com/windows/win32/api/syncregistration/nf-syncregistration-isyncproviderregistration-createsyncproviderconfiguiregistrationinstance
     */
    CreateSyncProviderConfigUIRegistrationInstance(pConfigUIConfig) {
        result := ComCall(3, this, "ptr", pConfigUIConfig, "ptr*", &ppConfigUIInfo := 0, "HRESULT")
        return ISyncProviderConfigUIInfo(ppConfigUIInfo)
    }

    /**
     * Unregisters and removes the specified synchronization provider configuration UI from the registration store.
     * @param {Pointer<Guid>} pguidInstanceId The unique instance ID of the synchronization provider configuration UI.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SYNC_E_REGISTRATION_NOTREGISTERED  </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The CLSID and content type combination does not exist in the registration store for a configuration UI.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/syncregistration/nf-syncregistration-isyncproviderregistration-unregistersyncproviderconfigui
     */
    UnregisterSyncProviderConfigUI(pguidInstanceId) {
        result := ComCall(4, this, "ptr", pguidInstanceId, "HRESULT")
        return result
    }

    /**
     * Returns an IEnumSyncProviderConfigUIInfos enumeration interface that enumerates all registered ISyncProviderConfigUIInfo objects for the specified criteria.
     * @param {Pointer<Guid>} pguidContentType The LPCGUID of the specified content type. If this parameter is <b>NULL</b>, all content types will be enumerated.
     * @param {Integer} dwSupportedArchitecture One, or a combination  of, the following flags that represent the architectures of the providers to be enumerated. If <b>SYNC_32_BIT_SUPPORTED</b> is specified, all providers that support 32 bits or 32 and 64 bits will be enumerated.  If <b>SYNC_32_BIT_SUPPORTED</b> | <b>SYNC_64_BIT_SUPPORTED</b> is specified, only those providers that support both 32 bits and 64 bits will be enumerated.
     * 
     * <ul>
     * <li><b>SYNC_32_BIT_SUPPORTED</b> ((DWORD)0x00000001)</li>
     * <li><b>SYNC_64_BIT_SUPPORTED</b>  ((DWORD)0x00000002)</li>
     * </ul>
     * If this parameter is set to zero, synchronization providers for all architectures will be enumerated.
     * @returns {IEnumSyncProviderConfigUIInfos} A reference to an <b>IEnumSyncProviderConfigUIInfos</b>
     * @see https://learn.microsoft.com/windows/win32/api/syncregistration/nf-syncregistration-isyncproviderregistration-enumeratesyncproviderconfiguis
     */
    EnumerateSyncProviderConfigUIs(pguidContentType, dwSupportedArchitecture) {
        result := ComCall(5, this, "ptr", pguidContentType, "uint", dwSupportedArchitecture, "ptr*", &ppEnumSyncProviderConfigUIInfos := 0, "HRESULT")
        return IEnumSyncProviderConfigUIInfos(ppEnumSyncProviderConfigUIInfos)
    }

    /**
     * Creates an in-memory instance of a synchronization provider.
     * @remarks
     * The synchronization provider is not registered on the system until the <b>ISyncProviderInfo::Commit</b> method is called. This method is inherited by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/syncregistration/nn-syncregistration-isyncproviderinfo">ISyncProviderInfo</a> from <b>IPropertyStore</b>. For an example of this, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/winsync/overview-of-registering-a-synchronization-provider">Overview of Registering a Synchronization Provider</a>.
     * @param {Pointer<SyncProviderConfiguration>} pProviderConfiguration A <a href="https://docs.microsoft.com/windows/win32/api/syncregistration/ns-syncregistration-syncproviderconfiguration">SyncProviderConfiguration</a> structure that contains the synchronization provider registration information.
     * @returns {ISyncProviderInfo} Returns a pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/syncregistration/nn-syncregistration-isyncproviderinfo">ISyncProviderInfo</a> interface that is used to obtain information about the synchronization provider and access the configuration property store in order to store the synchronization provider configuration.
     * @see https://learn.microsoft.com/windows/win32/api/syncregistration/nf-syncregistration-isyncproviderregistration-createsyncproviderregistrationinstance
     */
    CreateSyncProviderRegistrationInstance(pProviderConfiguration) {
        result := ComCall(6, this, "ptr", pProviderConfiguration, "ptr*", &ppProviderInfo := 0, "HRESULT")
        return ISyncProviderInfo(ppProviderInfo)
    }

    /**
     * Unregisters and removes the specified synchronization provider from the registration store.
     * @param {Pointer<Guid>} pguidInstanceId The unique instance ID of the synchronization provider.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SYNC_E_REGISTRATION_NOTREGISTERED  </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A synchronization provider with the specified instance ID is not currently registered.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/syncregistration/nf-syncregistration-isyncproviderregistration-unregistersyncprovider
     */
    UnregisterSyncProvider(pguidInstanceId) {
        result := ComCall(7, this, "ptr", pguidInstanceId, "HRESULT")
        return result
    }

    /**
     * Returns an ISyncProviderConfigUIInfo object for the specified synchronization provider instance ID.
     * @remarks
     * This method is used to get and set the configuration UI properties for the specified  synchronization provider and to obtain the <b>ISyncProviderConfigUI</b> instance.
     * 
     * This method is used to obtain an <b>ISyncProviderConfigUIInfo</b> object when the instance ID is not known, but the instance ID of the  synchronization provider is known. The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/syncregistration/nf-syncregistration-isyncproviderregistration-getsyncproviderconfiguifrominstanceid">GetSyncProviderConfigUIFromInstanceId</a> method should be used if you want to access an <b>ISyncProviderConfigUIInfo</b> object directly using the instance ID of an <b>ISyncProviderConfigUI</b>.
     * @param {Pointer<Guid>} pguidProviderInstanceId The unique instance ID of the synchronization provider.
     * @returns {ISyncProviderConfigUIInfo} The configuration UI information object.
     * @see https://learn.microsoft.com/windows/win32/api/syncregistration/nf-syncregistration-isyncproviderregistration-getsyncproviderconfiguiinfoforprovider
     */
    GetSyncProviderConfigUIInfoforProvider(pguidProviderInstanceId) {
        result := ComCall(8, this, "ptr", pguidProviderInstanceId, "ptr*", &ppProviderConfigUIInfo := 0, "HRESULT")
        return ISyncProviderConfigUIInfo(ppProviderConfigUIInfo)
    }

    /**
     * Returns an IEnumSyncProviderInfos enumeration interface that enumerates all registered ISyncProviderInfo objects for the specified criteria.
     * @param {Pointer<Guid>} pguidContentType The LPCGUID of the specified content type. If this parameter is <b>NULL</b>, all content types will be enumerated.
     * @param {Integer} dwStateFlagsToFilterMask A synchronization provider state flag that can be used to mask (preserve or remove) the existing state. If this parameter is set to zero, all synchronization provider states will be enumerated. See the <i>dwStateFlagsToFilter</i> parameter description for a list of flags.
     * @param {Integer} dwStateFlagsToFilter One of the following flags that represent the synchronization provider state.
     * 
     * <ul>
     * <li><b>SYNC_PROVIDER_STATE_ENABLED</b>  ((DWORD)0x00000001)The provider is enabled and available for synchronization.
     * 
     * </li>
     * <li><b>SYNC_PROVIDER_STATE_DIRTY</b>  ((DWORD)0x00000002)The active provider has been updated and has new data to synchronize.
     * 
     * </li>
     * </ul>
     * If this parameter is set to zero, all synchronization provider states will be enumerated.
     * @param {Pointer<Guid>} refProviderClsId The REFCLSID of a particular provider. If this parameter is set to <b>CLSID_NULL</b>, all providers will be enumerated.
     * @param {Integer} dwSupportedArchitecture One, or a combination  of, the following flags that represent the architectures of the providers to be enumerated. If <b>SYNC_32_BIT_SUPPORTED</b> is specified, all providers that support 32 bits or 32 and 64 bits will be enumerated.  If <b>SYNC_32_BIT_SUPPORTED</b> | <b>SYNC_64_BIT_SUPPORTED</b> is specified, only those providers that support both 32 bits and 64 bits will be enumerated.
     * 
     * <ul>
     * <li><b>SYNC_32_BIT_SUPPORTED</b> ((DWORD)0x00000001)</li>
     * <li><b>SYNC_64_BIT_SUPPORTED</b>  ((DWORD)0x00000002)</li>
     * </ul>
     * If this parameter is set to zero, synchronization providers for all architectures will be enumerated.
     * @returns {IEnumSyncProviderInfos} The <b>IEnumSyncProviderInfos</b> enumeration interface that will enumerate all <b>ISyncProviderInfo</b> objects that match the specified criteria.
     * @see https://learn.microsoft.com/windows/win32/api/syncregistration/nf-syncregistration-isyncproviderregistration-enumeratesyncproviders
     */
    EnumerateSyncProviders(pguidContentType, dwStateFlagsToFilterMask, dwStateFlagsToFilter, refProviderClsId, dwSupportedArchitecture) {
        result := ComCall(9, this, "ptr", pguidContentType, "uint", dwStateFlagsToFilterMask, "uint", dwStateFlagsToFilter, "ptr", refProviderClsId, "uint", dwSupportedArchitecture, "ptr*", &ppEnumSyncProviderInfos := 0, "HRESULT")
        return IEnumSyncProviderInfos(ppEnumSyncProviderInfos)
    }

    /**
     * Returns an ISyncProviderInfo object for the specific synchronization provider instance ID.
     * @remarks
     * By calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/syncregistration/nf-syncregistration-isyncproviderinfo-getsyncprovider">GetSyncProvider</a> method of the <b>ISyncProviderInfo</b> object that is returned by this method,  you can get and set the properties of the synchronization provider, and  obtain the synchronization provider's <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/syncregistration/nn-syncregistration-iregisteredsyncprovider">IRegisteredSyncProvider</a> instance.
     * @param {Pointer<Guid>} pguidInstanceId The unique instance ID of the synchronization provider.
     * @returns {ISyncProviderInfo} The synchronization provider information object.
     * @see https://learn.microsoft.com/windows/win32/api/syncregistration/nf-syncregistration-isyncproviderregistration-getsyncproviderinfo
     */
    GetSyncProviderInfo(pguidInstanceId) {
        result := ComCall(10, this, "ptr", pguidInstanceId, "ptr*", &ppProviderInfo := 0, "HRESULT")
        return ISyncProviderInfo(ppProviderInfo)
    }

    /**
     * Returns an initialized and instantiated IRegisteredSyncProvider object for the specific unique instance ID.
     * @remarks
     * <div class="alert"><b>Note</b>  The caller of this method should not explicitly call <b>IRegisteredSyncProvider::Init</b> on the <b>IRegisteredSyncProvider</b> object that is returned, as this method will do this on the caller's behalf. The caller should call <b>QueryInterface</b> on the <b>IRegisteredSyncProvider</b> object that is returned to obtain an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nn-winsync-isyncprovider">ISyncProvider</a> interface to pass to the synchronization session.</div>
     * <div> </div>
     * @param {Pointer<Guid>} pguidInstanceId The unique instance ID of the <b>IRegisteredSyncProvider</b> object.
     * @param {Integer} dwClsContext The context in which the code that manages the newly created object will run. The only context supported is <b>CLSCTX_INPROC_SERVER</b>.
     * @returns {IRegisteredSyncProvider} The initialized and instantiated synchronization provider object.
     * @see https://learn.microsoft.com/windows/win32/api/syncregistration/nf-syncregistration-isyncproviderregistration-getsyncproviderfrominstanceid
     */
    GetSyncProviderFromInstanceId(pguidInstanceId, dwClsContext) {
        result := ComCall(11, this, "ptr", pguidInstanceId, "uint", dwClsContext, "ptr*", &ppSyncProvider := 0, "HRESULT")
        return IRegisteredSyncProvider(ppSyncProvider)
    }

    /**
     * Returns an ISyncProviderConfigUIInfo object for the given unique instance ID.
     * @remarks
     * This method is used to get and set the configuration UI properties for the specified  configuration UI object.
     * @param {Pointer<Guid>} pguidInstanceId The unique instance ID of the <b>ISyncProviderConfigUIInfo</b> object.
     * @returns {ISyncProviderConfigUIInfo} The configuration UI information object.
     * @see https://learn.microsoft.com/windows/win32/api/syncregistration/nf-syncregistration-isyncproviderregistration-getsyncproviderconfiguiinfo
     */
    GetSyncProviderConfigUIInfo(pguidInstanceId) {
        result := ComCall(12, this, "ptr", pguidInstanceId, "ptr*", &ppConfigUIInfo := 0, "HRESULT")
        return ISyncProviderConfigUIInfo(ppConfigUIInfo)
    }

    /**
     * Returns an initialized and instantiated ISyncProviderConfigUI object for the given unique instance ID.
     * @remarks
     * This method is used to obtain an <b>ISyncProviderConfigUIInfo</b> directly when the instance ID of the <b>ISyncProviderConfigUI</b> is known. The  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/syncregistration/nf-syncregistration-isyncproviderregistration-getsyncproviderconfiguiinfoforprovider">GetSyncProviderConfigUIInfoforProvider</a> method can be used to access an <b>ISyncProviderConfigUIInfo</b> object from the instance ID of a synchronization provider.
     * @param {Pointer<Guid>} pguidInstanceId The unique instance ID of the <b>ISyncProviderConfigUI</b> object.
     * @param {Integer} dwClsContext The context in which the code that manages the newly created object will run. The only context supported is <b>CLSCTX_INPROC_SERVER</b>.
     * @returns {ISyncProviderConfigUI} The initialized and instantiated configuration UI object.
     * @see https://learn.microsoft.com/windows/win32/api/syncregistration/nf-syncregistration-isyncproviderregistration-getsyncproviderconfiguifrominstanceid
     */
    GetSyncProviderConfigUIFromInstanceId(pguidInstanceId, dwClsContext) {
        result := ComCall(13, this, "ptr", pguidInstanceId, "uint", dwClsContext, "ptr*", &ppConfigUI := 0, "HRESULT")
        return ISyncProviderConfigUI(ppConfigUI)
    }

    /**
     * Returns the state of the specified synchronization provider.
     * @param {Pointer<Guid>} pguidInstanceId The unique instance ID of the synchronization provider.
     * @returns {Integer} One of the following flags that represent the synchronization provider state.
     * 
     * <ul>
     * <li><b>SYNC_PROVIDER_STATE_ENABLED</b>  ((DWORD)0x00000001)The provider is enabled and available for synchronization.
     * 
     * </li>
     * <li><b>SYNC_PROVIDER_STATE_DIRTY</b>  ((DWORD)0x00000002)The active provider has been updated and has new data to synchronize.
     * 
     * </li>
     * </ul>
     * @see https://learn.microsoft.com/windows/win32/api/syncregistration/nf-syncregistration-isyncproviderregistration-getsyncproviderstate
     */
    GetSyncProviderState(pguidInstanceId) {
        result := ComCall(14, this, "ptr", pguidInstanceId, "uint*", &pdwStateFlags := 0, "HRESULT")
        return pdwStateFlags
    }

    /**
     * Sets the state of the specified synchronization provider.
     * @remarks
     * To get the synchronization provider state, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/syncregistration/nf-syncregistration-isyncproviderregistration-getsyncproviderstate">GetSyncProviderState</a> method.
     * @param {Pointer<Guid>} pguidInstanceId The unique instance ID of the synchronization provider.
     * @param {Integer} dwStateFlagsMask A synchronization provider state flag that can be used to mask (preserve or remove) the existing state. If this parameter is set to zero, all synchronization provider states will be enumerated. See the <i>dwStateFlags</i> parameter description for a list of flags.
     * @param {Integer} dwStateFlags One of the following flags that represent the synchronization provider state.
     * 
     * <ul>
     * <li><b>SYNC_PROVIDER_STATE_ENABLED</b>  ((DWORD)0x00000001)The provider is enabled and available for synchronization.
     * 
     * </li>
     * <li><b>SYNC_PROVIDER_STATE_DIRTY</b>  ((DWORD)0x00000002)The active provider has been updated and has new data to synchronize.
     * 
     * </li>
     * </ul>
     * If this parameter is set to zero, all synchronization provider states will be enumerated.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SYNC_E_REGISTRATION_NOTREGISTERED  </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A synchronization provider with the specified instance ID was not registered.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/syncregistration/nf-syncregistration-isyncproviderregistration-setsyncproviderstate
     */
    SetSyncProviderState(pguidInstanceId, dwStateFlagsMask, dwStateFlags) {
        result := ComCall(15, this, "ptr", pguidInstanceId, "uint", dwStateFlagsMask, "uint", dwStateFlags, "HRESULT")
        return result
    }

    /**
     * Registers the user to receive notification of the arrival of new registration events that occur when changes are made to the registration store.
     * @remarks
     * The <b>HANDLE</b> returned by this method is used by the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/syncregistration/nf-syncregistration-isyncproviderregistration-getchange">GetChange</a> method. The event will only be set once from the <b>RegisterForEvent</b> call.  Any subsequent notifications will only occur when the user calls the <b>GetChange</b> method.
     * 
     * To unregister from this event notification system, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/syncregistration/nf-syncregistration-isyncproviderregistration-revokeevent">RevokeEvent</a> method.
     * @param {Pointer<HANDLE>} phEvent A <b>HANDLE</b> to a synchronization event that is used to notify
     * 		the caller about the arrival of new registration
     * 		events.
     * 		
     * 
     * <div class="alert"><b>Note</b>  The caller must not <b>Close</b> the returned <b>HANDLE</b>. The registration store will manage the memory for the <b>HANDLE</b> and will close it when the event is revoked by passing the <b>HANDLE</b> to  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/syncregistration/nf-syncregistration-isyncproviderregistration-revokeevent">RevokeEvent</a>, or before the store object is freed from memory.</div>
     * <div> </div>
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
     * @see https://learn.microsoft.com/windows/win32/api/syncregistration/nf-syncregistration-isyncproviderregistration-registerforevent
     */
    RegisterForEvent(phEvent) {
        result := ComCall(16, this, "ptr", phEvent, "HRESULT")
        return result
    }

    /**
     * Unregisters the user from the notification of the arrival of new registration events.
     * @remarks
     * This method closes the specified <b>HANDLE</b> and cleans up any related memory.
     * @param {HANDLE} hEvent The <b>HANDLE</b> returned by the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/syncregistration/nf-syncregistration-isyncproviderregistration-registerforevent">RegisterForEvent</a> method.
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
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified event has not been registered.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/syncregistration/nf-syncregistration-isyncproviderregistration-revokeevent
     */
    RevokeEvent(hEvent) {
        hEvent := hEvent is Win32Handle ? NumGet(hEvent, "ptr") : hEvent

        result := ComCall(17, this, "ptr", hEvent, "HRESULT")
        return result
    }

    /**
     * Gets an ISyncRegistrationChange object that represents a new registration event.
     * @remarks
     * This method resets the event that is passed in so that it will be set on a subsequent change in the registration store.  In order to retrieve all events from the store, this method should be called until <b>S_FALSE</b> is returned and <i>ppChange</i> is <b>NULL</b>.
     * 
     * This method returns the changes that have occurred since <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/syncregistration/nf-syncregistration-isyncproviderregistration-registerforevent">RegisterForEvent</a> or <b>GetChange</b> (whichever happened last) was last called for the given <b>HANDLE</b>.  This means that if multiple changes are made to an item before <b>GetChange</b> can be called, these changes will be represented as a single change object returned from <b>GetChange</b>.  In the case of an item being registered and unregistered between calls, no change will be returned.
     * @param {HANDLE} hEvent A <b>HANDLE</b> returned by the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/syncregistration/nf-syncregistration-isyncproviderregistration-registerforevent">RegisterForEvent</a> method.
     * @returns {ISyncRegistrationChange} The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/syncregistration/nn-syncregistration-isyncregistrationchange">ISyncRegistrationChange</a> object
     *     that contains the event, and the ID of the synchronization provider or synchronization provider configuration UI that has changed.
     * @see https://learn.microsoft.com/windows/win32/api/syncregistration/nf-syncregistration-isyncproviderregistration-getchange
     */
    GetChange(hEvent) {
        hEvent := hEvent is Win32Handle ? NumGet(hEvent, "ptr") : hEvent

        result := ComCall(18, this, "ptr", hEvent, "ptr*", &ppChange := 0, "HRESULT")
        return ISyncRegistrationChange(ppChange)
    }
}

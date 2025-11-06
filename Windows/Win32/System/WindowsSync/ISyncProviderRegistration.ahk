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
 * @see https://docs.microsoft.com/windows/win32/api//syncregistration/nn-syncregistration-isyncproviderregistration
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
     * 
     * @param {Pointer<SyncProviderConfigUIConfiguration>} pConfigUIConfig 
     * @returns {ISyncProviderConfigUIInfo} 
     * @see https://learn.microsoft.com/windows/win32/api/syncregistration/nf-syncregistration-isyncproviderregistration-createsyncproviderconfiguiregistrationinstance
     */
    CreateSyncProviderConfigUIRegistrationInstance(pConfigUIConfig) {
        result := ComCall(3, this, "ptr", pConfigUIConfig, "ptr*", &ppConfigUIInfo := 0, "HRESULT")
        return ISyncProviderConfigUIInfo(ppConfigUIInfo)
    }

    /**
     * 
     * @param {Pointer<Guid>} pguidInstanceId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/syncregistration/nf-syncregistration-isyncproviderregistration-unregistersyncproviderconfigui
     */
    UnregisterSyncProviderConfigUI(pguidInstanceId) {
        result := ComCall(4, this, "ptr", pguidInstanceId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pguidContentType 
     * @param {Integer} dwSupportedArchitecture 
     * @returns {IEnumSyncProviderConfigUIInfos} 
     * @see https://learn.microsoft.com/windows/win32/api/syncregistration/nf-syncregistration-isyncproviderregistration-enumeratesyncproviderconfiguis
     */
    EnumerateSyncProviderConfigUIs(pguidContentType, dwSupportedArchitecture) {
        result := ComCall(5, this, "ptr", pguidContentType, "uint", dwSupportedArchitecture, "ptr*", &ppEnumSyncProviderConfigUIInfos := 0, "HRESULT")
        return IEnumSyncProviderConfigUIInfos(ppEnumSyncProviderConfigUIInfos)
    }

    /**
     * 
     * @param {Pointer<SyncProviderConfiguration>} pProviderConfiguration 
     * @returns {ISyncProviderInfo} 
     * @see https://learn.microsoft.com/windows/win32/api/syncregistration/nf-syncregistration-isyncproviderregistration-createsyncproviderregistrationinstance
     */
    CreateSyncProviderRegistrationInstance(pProviderConfiguration) {
        result := ComCall(6, this, "ptr", pProviderConfiguration, "ptr*", &ppProviderInfo := 0, "HRESULT")
        return ISyncProviderInfo(ppProviderInfo)
    }

    /**
     * 
     * @param {Pointer<Guid>} pguidInstanceId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/syncregistration/nf-syncregistration-isyncproviderregistration-unregistersyncprovider
     */
    UnregisterSyncProvider(pguidInstanceId) {
        result := ComCall(7, this, "ptr", pguidInstanceId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pguidProviderInstanceId 
     * @returns {ISyncProviderConfigUIInfo} 
     * @see https://learn.microsoft.com/windows/win32/api/syncregistration/nf-syncregistration-isyncproviderregistration-getsyncproviderconfiguiinfoforprovider
     */
    GetSyncProviderConfigUIInfoforProvider(pguidProviderInstanceId) {
        result := ComCall(8, this, "ptr", pguidProviderInstanceId, "ptr*", &ppProviderConfigUIInfo := 0, "HRESULT")
        return ISyncProviderConfigUIInfo(ppProviderConfigUIInfo)
    }

    /**
     * 
     * @param {Pointer<Guid>} pguidContentType 
     * @param {Integer} dwStateFlagsToFilterMask 
     * @param {Integer} dwStateFlagsToFilter 
     * @param {Pointer<Guid>} refProviderClsId 
     * @param {Integer} dwSupportedArchitecture 
     * @returns {IEnumSyncProviderInfos} 
     * @see https://learn.microsoft.com/windows/win32/api/syncregistration/nf-syncregistration-isyncproviderregistration-enumeratesyncproviders
     */
    EnumerateSyncProviders(pguidContentType, dwStateFlagsToFilterMask, dwStateFlagsToFilter, refProviderClsId, dwSupportedArchitecture) {
        result := ComCall(9, this, "ptr", pguidContentType, "uint", dwStateFlagsToFilterMask, "uint", dwStateFlagsToFilter, "ptr", refProviderClsId, "uint", dwSupportedArchitecture, "ptr*", &ppEnumSyncProviderInfos := 0, "HRESULT")
        return IEnumSyncProviderInfos(ppEnumSyncProviderInfos)
    }

    /**
     * 
     * @param {Pointer<Guid>} pguidInstanceId 
     * @returns {ISyncProviderInfo} 
     * @see https://learn.microsoft.com/windows/win32/api/syncregistration/nf-syncregistration-isyncproviderregistration-getsyncproviderinfo
     */
    GetSyncProviderInfo(pguidInstanceId) {
        result := ComCall(10, this, "ptr", pguidInstanceId, "ptr*", &ppProviderInfo := 0, "HRESULT")
        return ISyncProviderInfo(ppProviderInfo)
    }

    /**
     * 
     * @param {Pointer<Guid>} pguidInstanceId 
     * @param {Integer} dwClsContext 
     * @returns {IRegisteredSyncProvider} 
     * @see https://learn.microsoft.com/windows/win32/api/syncregistration/nf-syncregistration-isyncproviderregistration-getsyncproviderfrominstanceid
     */
    GetSyncProviderFromInstanceId(pguidInstanceId, dwClsContext) {
        result := ComCall(11, this, "ptr", pguidInstanceId, "uint", dwClsContext, "ptr*", &ppSyncProvider := 0, "HRESULT")
        return IRegisteredSyncProvider(ppSyncProvider)
    }

    /**
     * 
     * @param {Pointer<Guid>} pguidInstanceId 
     * @returns {ISyncProviderConfigUIInfo} 
     * @see https://learn.microsoft.com/windows/win32/api/syncregistration/nf-syncregistration-isyncproviderregistration-getsyncproviderconfiguiinfo
     */
    GetSyncProviderConfigUIInfo(pguidInstanceId) {
        result := ComCall(12, this, "ptr", pguidInstanceId, "ptr*", &ppConfigUIInfo := 0, "HRESULT")
        return ISyncProviderConfigUIInfo(ppConfigUIInfo)
    }

    /**
     * 
     * @param {Pointer<Guid>} pguidInstanceId 
     * @param {Integer} dwClsContext 
     * @returns {ISyncProviderConfigUI} 
     * @see https://learn.microsoft.com/windows/win32/api/syncregistration/nf-syncregistration-isyncproviderregistration-getsyncproviderconfiguifrominstanceid
     */
    GetSyncProviderConfigUIFromInstanceId(pguidInstanceId, dwClsContext) {
        result := ComCall(13, this, "ptr", pguidInstanceId, "uint", dwClsContext, "ptr*", &ppConfigUI := 0, "HRESULT")
        return ISyncProviderConfigUI(ppConfigUI)
    }

    /**
     * 
     * @param {Pointer<Guid>} pguidInstanceId 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/syncregistration/nf-syncregistration-isyncproviderregistration-getsyncproviderstate
     */
    GetSyncProviderState(pguidInstanceId) {
        result := ComCall(14, this, "ptr", pguidInstanceId, "uint*", &pdwStateFlags := 0, "HRESULT")
        return pdwStateFlags
    }

    /**
     * 
     * @param {Pointer<Guid>} pguidInstanceId 
     * @param {Integer} dwStateFlagsMask 
     * @param {Integer} dwStateFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/syncregistration/nf-syncregistration-isyncproviderregistration-setsyncproviderstate
     */
    SetSyncProviderState(pguidInstanceId, dwStateFlagsMask, dwStateFlags) {
        result := ComCall(15, this, "ptr", pguidInstanceId, "uint", dwStateFlagsMask, "uint", dwStateFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} phEvent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/syncregistration/nf-syncregistration-isyncproviderregistration-registerforevent
     */
    RegisterForEvent(phEvent) {
        result := ComCall(16, this, "ptr", phEvent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HANDLE} hEvent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/syncregistration/nf-syncregistration-isyncproviderregistration-revokeevent
     */
    RevokeEvent(hEvent) {
        hEvent := hEvent is Win32Handle ? NumGet(hEvent, "ptr") : hEvent

        result := ComCall(17, this, "ptr", hEvent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HANDLE} hEvent 
     * @returns {ISyncRegistrationChange} 
     * @see https://learn.microsoft.com/windows/win32/api/syncregistration/nf-syncregistration-isyncproviderregistration-getchange
     */
    GetChange(hEvent) {
        hEvent := hEvent is Win32Handle ? NumGet(hEvent, "ptr") : hEvent

        result := ComCall(18, this, "ptr", hEvent, "ptr*", &ppChange := 0, "HRESULT")
        return ISyncRegistrationChange(ppChange)
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Represents synchronization provider registration.
 * @see https://docs.microsoft.com/windows/win32/api//syncregistration/nn-syncregistration-isyncproviderregistration
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class ISyncProviderRegistration extends IUnknown{
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
     * 
     * @param {Pointer<SyncProviderConfigUIConfiguration>} pConfigUIConfig 
     * @param {Pointer<ISyncProviderConfigUIInfo>} ppConfigUIInfo 
     * @returns {HRESULT} 
     */
    CreateSyncProviderConfigUIRegistrationInstance(pConfigUIConfig, ppConfigUIInfo) {
        result := ComCall(3, this, "ptr", pConfigUIConfig, "ptr", ppConfigUIInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pguidInstanceId 
     * @returns {HRESULT} 
     */
    UnregisterSyncProviderConfigUI(pguidInstanceId) {
        result := ComCall(4, this, "ptr", pguidInstanceId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pguidContentType 
     * @param {Integer} dwSupportedArchitecture 
     * @param {Pointer<IEnumSyncProviderConfigUIInfos>} ppEnumSyncProviderConfigUIInfos 
     * @returns {HRESULT} 
     */
    EnumerateSyncProviderConfigUIs(pguidContentType, dwSupportedArchitecture, ppEnumSyncProviderConfigUIInfos) {
        result := ComCall(5, this, "ptr", pguidContentType, "uint", dwSupportedArchitecture, "ptr", ppEnumSyncProviderConfigUIInfos, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SyncProviderConfiguration>} pProviderConfiguration 
     * @param {Pointer<ISyncProviderInfo>} ppProviderInfo 
     * @returns {HRESULT} 
     */
    CreateSyncProviderRegistrationInstance(pProviderConfiguration, ppProviderInfo) {
        result := ComCall(6, this, "ptr", pProviderConfiguration, "ptr", ppProviderInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pguidInstanceId 
     * @returns {HRESULT} 
     */
    UnregisterSyncProvider(pguidInstanceId) {
        result := ComCall(7, this, "ptr", pguidInstanceId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pguidProviderInstanceId 
     * @param {Pointer<ISyncProviderConfigUIInfo>} ppProviderConfigUIInfo 
     * @returns {HRESULT} 
     */
    GetSyncProviderConfigUIInfoforProvider(pguidProviderInstanceId, ppProviderConfigUIInfo) {
        result := ComCall(8, this, "ptr", pguidProviderInstanceId, "ptr", ppProviderConfigUIInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pguidContentType 
     * @param {Integer} dwStateFlagsToFilterMask 
     * @param {Integer} dwStateFlagsToFilter 
     * @param {Pointer<Guid>} refProviderClsId 
     * @param {Integer} dwSupportedArchitecture 
     * @param {Pointer<IEnumSyncProviderInfos>} ppEnumSyncProviderInfos 
     * @returns {HRESULT} 
     */
    EnumerateSyncProviders(pguidContentType, dwStateFlagsToFilterMask, dwStateFlagsToFilter, refProviderClsId, dwSupportedArchitecture, ppEnumSyncProviderInfos) {
        result := ComCall(9, this, "ptr", pguidContentType, "uint", dwStateFlagsToFilterMask, "uint", dwStateFlagsToFilter, "ptr", refProviderClsId, "uint", dwSupportedArchitecture, "ptr", ppEnumSyncProviderInfos, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pguidInstanceId 
     * @param {Pointer<ISyncProviderInfo>} ppProviderInfo 
     * @returns {HRESULT} 
     */
    GetSyncProviderInfo(pguidInstanceId, ppProviderInfo) {
        result := ComCall(10, this, "ptr", pguidInstanceId, "ptr", ppProviderInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pguidInstanceId 
     * @param {Integer} dwClsContext 
     * @param {Pointer<IRegisteredSyncProvider>} ppSyncProvider 
     * @returns {HRESULT} 
     */
    GetSyncProviderFromInstanceId(pguidInstanceId, dwClsContext, ppSyncProvider) {
        result := ComCall(11, this, "ptr", pguidInstanceId, "uint", dwClsContext, "ptr", ppSyncProvider, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pguidInstanceId 
     * @param {Pointer<ISyncProviderConfigUIInfo>} ppConfigUIInfo 
     * @returns {HRESULT} 
     */
    GetSyncProviderConfigUIInfo(pguidInstanceId, ppConfigUIInfo) {
        result := ComCall(12, this, "ptr", pguidInstanceId, "ptr", ppConfigUIInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pguidInstanceId 
     * @param {Integer} dwClsContext 
     * @param {Pointer<ISyncProviderConfigUI>} ppConfigUI 
     * @returns {HRESULT} 
     */
    GetSyncProviderConfigUIFromInstanceId(pguidInstanceId, dwClsContext, ppConfigUI) {
        result := ComCall(13, this, "ptr", pguidInstanceId, "uint", dwClsContext, "ptr", ppConfigUI, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pguidInstanceId 
     * @param {Pointer<UInt32>} pdwStateFlags 
     * @returns {HRESULT} 
     */
    GetSyncProviderState(pguidInstanceId, pdwStateFlags) {
        result := ComCall(14, this, "ptr", pguidInstanceId, "uint*", pdwStateFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pguidInstanceId 
     * @param {Integer} dwStateFlagsMask 
     * @param {Integer} dwStateFlags 
     * @returns {HRESULT} 
     */
    SetSyncProviderState(pguidInstanceId, dwStateFlagsMask, dwStateFlags) {
        result := ComCall(15, this, "ptr", pguidInstanceId, "uint", dwStateFlagsMask, "uint", dwStateFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} phEvent 
     * @returns {HRESULT} 
     */
    RegisterForEvent(phEvent) {
        result := ComCall(16, this, "ptr", phEvent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HANDLE} hEvent 
     * @returns {HRESULT} 
     */
    RevokeEvent(hEvent) {
        hEvent := hEvent is Win32Handle ? NumGet(hEvent, "ptr") : hEvent

        result := ComCall(17, this, "ptr", hEvent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HANDLE} hEvent 
     * @param {Pointer<ISyncRegistrationChange>} ppChange 
     * @returns {HRESULT} 
     */
    GetChange(hEvent, ppChange) {
        hEvent := hEvent is Win32Handle ? NumGet(hEvent, "ptr") : hEvent

        result := ComCall(18, this, "ptr", hEvent, "ptr", ppChange, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

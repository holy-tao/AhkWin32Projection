#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGameModeConfiguration.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * A collection of properties related to how a [GameListEntry](gamelistentry.md) operates in Game Mode
 * @remarks
 * This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
 * @see https://learn.microsoft.com/uwp/api/windows.gaming.preview.gamesenumeration.gamemodeconfiguration
 * @namespace Windows.Gaming.Preview.GamesEnumeration
 * @version WindowsRuntime 1.4
 */
class GameModeConfiguration extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGameModeConfiguration

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGameModeConfiguration.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The associated [GameListEntry](gamelistentry.md) is enabled for Game Mode
     * @remarks
     * This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.preview.gamesenumeration.gamemodeconfiguration.isenabled
     * @type {Boolean} 
     */
    IsEnabled {
        get => this.get_IsEnabled()
        set => this.put_IsEnabled(value)
    }

    /**
     * Returns a list of gaming related processes that will not be affected by Game Mode. Processes names can be added and removed, however [SaveAsync()](gamemodeconfiguration_saveasync_2143735121.md) will need to be called to persist the changes.
     * @remarks
     * This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.preview.gamesenumeration.gamemodeconfiguration.relatedprocessnames
     * @type {IVector<HSTRING>} 
     */
    RelatedProcessNames {
        get => this.get_RelatedProcessNames()
    }

    /**
     * The percentage of GPU time that will be dedicated to the game when Game Mode is enabled.
     * @remarks
     * This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.preview.gamesenumeration.gamemodeconfiguration.percentgputimeallocatedtogame
     * @type {IReference<Integer>} 
     */
    PercentGpuTimeAllocatedToGame {
        get => this.get_PercentGpuTimeAllocatedToGame()
        set => this.put_PercentGpuTimeAllocatedToGame(value)
    }

    /**
     * The percentage of GPU memory that will be dedicated to the game when Game Mode is enabled.
     * @remarks
     * This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.preview.gamesenumeration.gamemodeconfiguration.percentgpumemoryallocatedtogame
     * @type {IReference<Integer>} 
     */
    PercentGpuMemoryAllocatedToGame {
        get => this.get_PercentGpuMemoryAllocatedToGame()
        set => this.put_PercentGpuMemoryAllocatedToGame(value)
    }

    /**
     * The percentage of GPU memory that will be dedicated to the system compositor when Game Mode is enabled.
     * @remarks
     * This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.preview.gamesenumeration.gamemodeconfiguration.percentgpumemoryallocatedtosystemcompositor
     * @type {IReference<Integer>} 
     */
    PercentGpuMemoryAllocatedToSystemCompositor {
        get => this.get_PercentGpuMemoryAllocatedToSystemCompositor()
        set => this.put_PercentGpuMemoryAllocatedToSystemCompositor(value)
    }

    /**
     * The max number of CPUs the game will use, this cannot exceed the total logical cores across the systems device processor
     * @remarks
     * This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.preview.gamesenumeration.gamemodeconfiguration.maxcpucount
     * @type {IReference<Integer>} 
     */
    MaxCpuCount {
        get => this.get_MaxCpuCount()
        set => this.put_MaxCpuCount(value)
    }

    /**
     * CPU exclusivity mask of logical cores dedicated to the game represented by a bitmask. Core 0 is specified by the lowest bit in the low int and each core is the next highest bit. No bits can be set beyond the number of cores returned by [GetSystemCpuSetInformation](https://learn.microsoft.com/en-us/windows/win32/procthread/getsystemcpusetinformation) or set function will throw.
     * @remarks
     * This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.preview.gamesenumeration.gamemodeconfiguration.cpuexclusivitymasklow
     * @type {IReference<Integer>} 
     */
    CpuExclusivityMaskLow {
        get => this.get_CpuExclusivityMaskLow()
        set => this.put_CpuExclusivityMaskLow(value)
    }

    /**
     * CPU exclusivity mask of logical cores dedicated to the game represented by a bitmask. Core 0 is specified by the lowest bit in the low int and each core is the next highest bit. No bits can be set beyond the number of cores returned by [GetSystemCpuSetInformation](https://learn.microsoft.com/en-us/windows/win32/procthread/getsystemcpusetinformation) or set function will throw.
     * @remarks
     * This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.preview.gamesenumeration.gamemodeconfiguration.cpuexclusivitymaskhigh
     * @type {IReference<Integer>} 
     */
    CpuExclusivityMaskHigh {
        get => this.get_CpuExclusivityMaskHigh()
        set => this.put_CpuExclusivityMaskHigh(value)
    }

    /**
     * CPUs are exclusive to the game’s process not shared with other processes.
     * @remarks
     * This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.preview.gamesenumeration.gamemodeconfiguration.affinitizetoexclusivecpus
     * @type {Boolean} 
     */
    AffinitizeToExclusiveCpus {
        get => this.get_AffinitizeToExclusiveCpus()
        set => this.put_AffinitizeToExclusiveCpus(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsEnabled() {
        if (!this.HasProp("__IGameModeConfiguration")) {
            if ((queryResult := this.QueryInterface(IGameModeConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameModeConfiguration := IGameModeConfiguration(outPtr)
        }

        return this.__IGameModeConfiguration.get_IsEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsEnabled(value) {
        if (!this.HasProp("__IGameModeConfiguration")) {
            if ((queryResult := this.QueryInterface(IGameModeConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameModeConfiguration := IGameModeConfiguration(outPtr)
        }

        return this.__IGameModeConfiguration.put_IsEnabled(value)
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_RelatedProcessNames() {
        if (!this.HasProp("__IGameModeConfiguration")) {
            if ((queryResult := this.QueryInterface(IGameModeConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameModeConfiguration := IGameModeConfiguration(outPtr)
        }

        return this.__IGameModeConfiguration.get_RelatedProcessNames()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_PercentGpuTimeAllocatedToGame() {
        if (!this.HasProp("__IGameModeConfiguration")) {
            if ((queryResult := this.QueryInterface(IGameModeConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameModeConfiguration := IGameModeConfiguration(outPtr)
        }

        return this.__IGameModeConfiguration.get_PercentGpuTimeAllocatedToGame()
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_PercentGpuTimeAllocatedToGame(value) {
        if (!this.HasProp("__IGameModeConfiguration")) {
            if ((queryResult := this.QueryInterface(IGameModeConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameModeConfiguration := IGameModeConfiguration(outPtr)
        }

        return this.__IGameModeConfiguration.put_PercentGpuTimeAllocatedToGame(value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_PercentGpuMemoryAllocatedToGame() {
        if (!this.HasProp("__IGameModeConfiguration")) {
            if ((queryResult := this.QueryInterface(IGameModeConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameModeConfiguration := IGameModeConfiguration(outPtr)
        }

        return this.__IGameModeConfiguration.get_PercentGpuMemoryAllocatedToGame()
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_PercentGpuMemoryAllocatedToGame(value) {
        if (!this.HasProp("__IGameModeConfiguration")) {
            if ((queryResult := this.QueryInterface(IGameModeConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameModeConfiguration := IGameModeConfiguration(outPtr)
        }

        return this.__IGameModeConfiguration.put_PercentGpuMemoryAllocatedToGame(value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_PercentGpuMemoryAllocatedToSystemCompositor() {
        if (!this.HasProp("__IGameModeConfiguration")) {
            if ((queryResult := this.QueryInterface(IGameModeConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameModeConfiguration := IGameModeConfiguration(outPtr)
        }

        return this.__IGameModeConfiguration.get_PercentGpuMemoryAllocatedToSystemCompositor()
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_PercentGpuMemoryAllocatedToSystemCompositor(value) {
        if (!this.HasProp("__IGameModeConfiguration")) {
            if ((queryResult := this.QueryInterface(IGameModeConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameModeConfiguration := IGameModeConfiguration(outPtr)
        }

        return this.__IGameModeConfiguration.put_PercentGpuMemoryAllocatedToSystemCompositor(value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_MaxCpuCount() {
        if (!this.HasProp("__IGameModeConfiguration")) {
            if ((queryResult := this.QueryInterface(IGameModeConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameModeConfiguration := IGameModeConfiguration(outPtr)
        }

        return this.__IGameModeConfiguration.get_MaxCpuCount()
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_MaxCpuCount(value) {
        if (!this.HasProp("__IGameModeConfiguration")) {
            if ((queryResult := this.QueryInterface(IGameModeConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameModeConfiguration := IGameModeConfiguration(outPtr)
        }

        return this.__IGameModeConfiguration.put_MaxCpuCount(value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_CpuExclusivityMaskLow() {
        if (!this.HasProp("__IGameModeConfiguration")) {
            if ((queryResult := this.QueryInterface(IGameModeConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameModeConfiguration := IGameModeConfiguration(outPtr)
        }

        return this.__IGameModeConfiguration.get_CpuExclusivityMaskLow()
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_CpuExclusivityMaskLow(value) {
        if (!this.HasProp("__IGameModeConfiguration")) {
            if ((queryResult := this.QueryInterface(IGameModeConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameModeConfiguration := IGameModeConfiguration(outPtr)
        }

        return this.__IGameModeConfiguration.put_CpuExclusivityMaskLow(value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_CpuExclusivityMaskHigh() {
        if (!this.HasProp("__IGameModeConfiguration")) {
            if ((queryResult := this.QueryInterface(IGameModeConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameModeConfiguration := IGameModeConfiguration(outPtr)
        }

        return this.__IGameModeConfiguration.get_CpuExclusivityMaskHigh()
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_CpuExclusivityMaskHigh(value) {
        if (!this.HasProp("__IGameModeConfiguration")) {
            if ((queryResult := this.QueryInterface(IGameModeConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameModeConfiguration := IGameModeConfiguration(outPtr)
        }

        return this.__IGameModeConfiguration.put_CpuExclusivityMaskHigh(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AffinitizeToExclusiveCpus() {
        if (!this.HasProp("__IGameModeConfiguration")) {
            if ((queryResult := this.QueryInterface(IGameModeConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameModeConfiguration := IGameModeConfiguration(outPtr)
        }

        return this.__IGameModeConfiguration.get_AffinitizeToExclusiveCpus()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AffinitizeToExclusiveCpus(value) {
        if (!this.HasProp("__IGameModeConfiguration")) {
            if ((queryResult := this.QueryInterface(IGameModeConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameModeConfiguration := IGameModeConfiguration(outPtr)
        }

        return this.__IGameModeConfiguration.put_AffinitizeToExclusiveCpus(value)
    }

    /**
     * Saves changes to the [GameModeConfiguration](gamemodeconfiguration.md) properties
     * @remarks
     * This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.preview.gamesenumeration.gamemodeconfiguration.saveasync
     */
    SaveAsync() {
        if (!this.HasProp("__IGameModeConfiguration")) {
            if ((queryResult := this.QueryInterface(IGameModeConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameModeConfiguration := IGameModeConfiguration(outPtr)
        }

        return this.__IGameModeConfiguration.SaveAsync()
    }

;@endregion Instance Methods
}

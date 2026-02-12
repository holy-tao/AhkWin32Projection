#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBackgroundEnergyManagerStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides information about your app's background energy usage.
 * @remarks
 * The energy usage of a background task is classified into one of these predefined levels, from lowest to highest energy consumption: [LowUsageLevel](backgroundenergymanager_lowusagelevel.md), [NearMaxAcceptableUsageLevel](backgroundenergymanager_nearmaxacceptableusagelevel.md), [MaxAcceptableUsageLevel](backgroundenergymanager_maxacceptableusagelevel.md), [ExcessiveUsageLevel](backgroundenergymanager_excessiveusagelevel.md), [NearTerminationUsageLevel](backgroundenergymanager_nearterminationusagelevel.md), or [TerminationUsageLevel](backgroundenergymanager_terminationusagelevel.md).
 * @see https://learn.microsoft.com/uwp/api/windows.system.power.backgroundenergymanager
 * @namespace Windows.System.Power
 * @version WindowsRuntime 1.4
 */
class BackgroundEnergyManager extends IInspectable {
;@region Static Properties
    /**
     * Gets the low usage level, expressed as a percentage of normal energy consumption.
     * @remarks
     * A background task operating at this level is "safe" from termination and does not require throttling.
     * @see https://learn.microsoft.com/uwp/api/windows.system.power.backgroundenergymanager.lowusagelevel
     * @type {Integer} 
     */
    static LowUsageLevel {
        get => BackgroundEnergyManager.get_LowUsageLevel()
    }

    /**
     * Gets the near-maximum acceptable usage level, expressed as a percentage of normal energy usage.
     * @remarks
     * A background task operating at this level is getting close to the maximum acceptable level.
     * @see https://learn.microsoft.com/uwp/api/windows.system.power.backgroundenergymanager.nearmaxacceptableusagelevel
     * @type {Integer} 
     */
    static NearMaxAcceptableUsageLevel {
        get => BackgroundEnergyManager.get_NearMaxAcceptableUsageLevel()
    }

    /**
     * Gets the maximum acceptable usage level, expressed as a percentage of normal energy consumption.
     * @remarks
     * A background task operating at this level has reached the maximum acceptable level and is at risk of being reported to the Battery Saver app as a high energy consumer.
     * @see https://learn.microsoft.com/uwp/api/windows.system.power.backgroundenergymanager.maxacceptableusagelevel
     * @type {Integer} 
     */
    static MaxAcceptableUsageLevel {
        get => BackgroundEnergyManager.get_MaxAcceptableUsageLevel()
    }

    /**
     * Gets the excessive usage level, expressed as a percentage of normal energy usage.
     * @remarks
     * A background task operating at this level has exceeded the maximum acceptable level.
     * @see https://learn.microsoft.com/uwp/api/windows.system.power.backgroundenergymanager.excessiveusagelevel
     * @type {Integer} 
     */
    static ExcessiveUsageLevel {
        get => BackgroundEnergyManager.get_ExcessiveUsageLevel()
    }

    /**
     * Gets the near-termination usage level, expressed as a percentage of normal energy usage.
     * @remarks
     * A background task operating at this level is at risk of being terminated by the operating system (if it's not directly contributing to the foreground experience).
     * @see https://learn.microsoft.com/uwp/api/windows.system.power.backgroundenergymanager.nearterminationusagelevel
     * @type {Integer} 
     */
    static NearTerminationUsageLevel {
        get => BackgroundEnergyManager.get_NearTerminationUsageLevel()
    }

    /**
     * Gets the termination usage level, expressed as a percentage of normal energy usage.
     * @remarks
     * A background task operating at this level will be terminated by the operating system if it's not directly contributing to the foreground experience.
     * @see https://learn.microsoft.com/uwp/api/windows.system.power.backgroundenergymanager.terminationusagelevel
     * @type {Integer} 
     */
    static TerminationUsageLevel {
        get => BackgroundEnergyManager.get_TerminationUsageLevel()
    }

    /**
     * Gets the energy usage of the app's background task for the current 30 minute period, expressed as a percentage of normal.
     * @remarks
     * The RecentEnergyUsage property is a more accurate measure of energy usage than [RecentEnergyUsageLevel](backgroundenergymanager_recentenergyusagelevel.md). The RecentEnergyUsage value will typically fall between predefined energy levels. The [RecentEnergyUsageLevel](backgroundenergymanager_recentenergyusagelevel.md) will always equal the nearest predefined energy level.
     * @see https://learn.microsoft.com/uwp/api/windows.system.power.backgroundenergymanager.recentenergyusage
     * @type {Integer} 
     */
    static RecentEnergyUsage {
        get => BackgroundEnergyManager.get_RecentEnergyUsage()
    }

    /**
     * Gets the nearest predefined energy level of the app's background task for the current 30 minute period, equal to [LowUsageLevel](backgroundenergymanager_lowusagelevel.md), [NearMaxAcceptableUsageLevel](backgroundenergymanager_nearmaxacceptableusagelevel.md), [MaxAcceptableUsageLevel](backgroundenergymanager_maxacceptableusagelevel.md), [ExcessiveUsageLevel](backgroundenergymanager_excessiveusagelevel.md), [NearTerminationUsageLevel](backgroundenergymanager_nearterminationusagelevel.md), or [TerminationUsageLevel](backgroundenergymanager_terminationusagelevel.md).
     * @see https://learn.microsoft.com/uwp/api/windows.system.power.backgroundenergymanager.recentenergyusagelevel
     * @type {Integer} 
     */
    static RecentEnergyUsageLevel {
        get => BackgroundEnergyManager.get_RecentEnergyUsageLevel()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {Integer} 
     */
    static get_LowUsageLevel() {
        if (!BackgroundEnergyManager.HasProp("__IBackgroundEnergyManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Power.BackgroundEnergyManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBackgroundEnergyManagerStatics.IID)
            BackgroundEnergyManager.__IBackgroundEnergyManagerStatics := IBackgroundEnergyManagerStatics(factoryPtr)
        }

        return BackgroundEnergyManager.__IBackgroundEnergyManagerStatics.get_LowUsageLevel()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_NearMaxAcceptableUsageLevel() {
        if (!BackgroundEnergyManager.HasProp("__IBackgroundEnergyManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Power.BackgroundEnergyManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBackgroundEnergyManagerStatics.IID)
            BackgroundEnergyManager.__IBackgroundEnergyManagerStatics := IBackgroundEnergyManagerStatics(factoryPtr)
        }

        return BackgroundEnergyManager.__IBackgroundEnergyManagerStatics.get_NearMaxAcceptableUsageLevel()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_MaxAcceptableUsageLevel() {
        if (!BackgroundEnergyManager.HasProp("__IBackgroundEnergyManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Power.BackgroundEnergyManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBackgroundEnergyManagerStatics.IID)
            BackgroundEnergyManager.__IBackgroundEnergyManagerStatics := IBackgroundEnergyManagerStatics(factoryPtr)
        }

        return BackgroundEnergyManager.__IBackgroundEnergyManagerStatics.get_MaxAcceptableUsageLevel()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_ExcessiveUsageLevel() {
        if (!BackgroundEnergyManager.HasProp("__IBackgroundEnergyManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Power.BackgroundEnergyManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBackgroundEnergyManagerStatics.IID)
            BackgroundEnergyManager.__IBackgroundEnergyManagerStatics := IBackgroundEnergyManagerStatics(factoryPtr)
        }

        return BackgroundEnergyManager.__IBackgroundEnergyManagerStatics.get_ExcessiveUsageLevel()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_NearTerminationUsageLevel() {
        if (!BackgroundEnergyManager.HasProp("__IBackgroundEnergyManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Power.BackgroundEnergyManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBackgroundEnergyManagerStatics.IID)
            BackgroundEnergyManager.__IBackgroundEnergyManagerStatics := IBackgroundEnergyManagerStatics(factoryPtr)
        }

        return BackgroundEnergyManager.__IBackgroundEnergyManagerStatics.get_NearTerminationUsageLevel()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_TerminationUsageLevel() {
        if (!BackgroundEnergyManager.HasProp("__IBackgroundEnergyManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Power.BackgroundEnergyManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBackgroundEnergyManagerStatics.IID)
            BackgroundEnergyManager.__IBackgroundEnergyManagerStatics := IBackgroundEnergyManagerStatics(factoryPtr)
        }

        return BackgroundEnergyManager.__IBackgroundEnergyManagerStatics.get_TerminationUsageLevel()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_RecentEnergyUsage() {
        if (!BackgroundEnergyManager.HasProp("__IBackgroundEnergyManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Power.BackgroundEnergyManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBackgroundEnergyManagerStatics.IID)
            BackgroundEnergyManager.__IBackgroundEnergyManagerStatics := IBackgroundEnergyManagerStatics(factoryPtr)
        }

        return BackgroundEnergyManager.__IBackgroundEnergyManagerStatics.get_RecentEnergyUsage()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_RecentEnergyUsageLevel() {
        if (!BackgroundEnergyManager.HasProp("__IBackgroundEnergyManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Power.BackgroundEnergyManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBackgroundEnergyManagerStatics.IID)
            BackgroundEnergyManager.__IBackgroundEnergyManagerStatics := IBackgroundEnergyManagerStatics(factoryPtr)
        }

        return BackgroundEnergyManager.__IBackgroundEnergyManagerStatics.get_RecentEnergyUsageLevel()
    }

    /**
     * 
     * @param {EventHandler<IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    static add_RecentEnergyUsageIncreased(handler) {
        if (!BackgroundEnergyManager.HasProp("__IBackgroundEnergyManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Power.BackgroundEnergyManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBackgroundEnergyManagerStatics.IID)
            BackgroundEnergyManager.__IBackgroundEnergyManagerStatics := IBackgroundEnergyManagerStatics(factoryPtr)
        }

        return BackgroundEnergyManager.__IBackgroundEnergyManagerStatics.add_RecentEnergyUsageIncreased(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    static remove_RecentEnergyUsageIncreased(token) {
        if (!BackgroundEnergyManager.HasProp("__IBackgroundEnergyManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Power.BackgroundEnergyManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBackgroundEnergyManagerStatics.IID)
            BackgroundEnergyManager.__IBackgroundEnergyManagerStatics := IBackgroundEnergyManagerStatics(factoryPtr)
        }

        return BackgroundEnergyManager.__IBackgroundEnergyManagerStatics.remove_RecentEnergyUsageIncreased(token)
    }

    /**
     * 
     * @param {EventHandler<IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    static add_RecentEnergyUsageReturnedToLow(handler) {
        if (!BackgroundEnergyManager.HasProp("__IBackgroundEnergyManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Power.BackgroundEnergyManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBackgroundEnergyManagerStatics.IID)
            BackgroundEnergyManager.__IBackgroundEnergyManagerStatics := IBackgroundEnergyManagerStatics(factoryPtr)
        }

        return BackgroundEnergyManager.__IBackgroundEnergyManagerStatics.add_RecentEnergyUsageReturnedToLow(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    static remove_RecentEnergyUsageReturnedToLow(token) {
        if (!BackgroundEnergyManager.HasProp("__IBackgroundEnergyManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Power.BackgroundEnergyManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBackgroundEnergyManagerStatics.IID)
            BackgroundEnergyManager.__IBackgroundEnergyManagerStatics := IBackgroundEnergyManagerStatics(factoryPtr)
        }

        return BackgroundEnergyManager.__IBackgroundEnergyManagerStatics.remove_RecentEnergyUsageReturnedToLow(token)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}

#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IForegroundEnergyManagerStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides information about your app's foreground energy usage.
 * @remarks
 * The energy usage of a foreground app is classified into one these predefined levels, from lowest to highest energy consumption: [LowUsageLevel](foregroundenergymanager_lowusagelevel.md), [NearMaxAcceptableUsageLevel](foregroundenergymanager_nearmaxacceptableusagelevel.md), [MaxAcceptableUsageLevel](foregroundenergymanager_maxacceptableusagelevel.md), or [ExcessiveUsageLevel](foregroundenergymanager_excessiveusagelevel.md).
 * @see https://learn.microsoft.com/uwp/api/windows.system.power.foregroundenergymanager
 * @namespace Windows.System.Power
 * @version WindowsRuntime 1.4
 */
class ForegroundEnergyManager extends IInspectable {
;@region Static Properties
    /**
     * Gets the low usage level, expressed as a percentage of normal energy consumption.
     * @remarks
     * An app operating at the low usage level is consuming significantly less energy than normal and does not require throttling.
     * @see https://learn.microsoft.com/uwp/api/windows.system.power.foregroundenergymanager.lowusagelevel
     * @type {Integer} 
     */
    static LowUsageLevel {
        get => ForegroundEnergyManager.get_LowUsageLevel()
    }

    /**
     * Gets the near-maximum acceptable usage level, expressed as a percentage of normal energy usage.
     * @remarks
     * An app operating at this level is getting close to the maximum acceptable level.
     * @see https://learn.microsoft.com/uwp/api/windows.system.power.foregroundenergymanager.nearmaxacceptableusagelevel
     * @type {Integer} 
     */
    static NearMaxAcceptableUsageLevel {
        get => ForegroundEnergyManager.get_NearMaxAcceptableUsageLevel()
    }

    /**
     * Gets the maximum acceptable usage level, expressed as a percentage of normal energy consumption.
     * @remarks
     * An app operating at or beyond the maximum acceptable level is at risk of being reported to the Battery Saver app as a high energy consumer.
     * @see https://learn.microsoft.com/uwp/api/windows.system.power.foregroundenergymanager.maxacceptableusagelevel
     * @type {Integer} 
     */
    static MaxAcceptableUsageLevel {
        get => ForegroundEnergyManager.get_MaxAcceptableUsageLevel()
    }

    /**
     * Gets the excessive usage level, expressed as a percentage of normal energy usage.
     * @remarks
     * An app operating at the excessive usage level is at risk of being reported to the Battery Saver app as a high energy consumer.
     * @see https://learn.microsoft.com/uwp/api/windows.system.power.foregroundenergymanager.excessiveusagelevel
     * @type {Integer} 
     */
    static ExcessiveUsageLevel {
        get => ForegroundEnergyManager.get_ExcessiveUsageLevel()
    }

    /**
     * Gets the nearest predefined energy level of the foreground app for the current 30 minute period, equal to [LowUsageLevel](foregroundenergymanager_lowusagelevel.md), [NearMaxAcceptableUsageLevel](foregroundenergymanager_nearmaxacceptableusagelevel.md), [MaxAcceptableUsageLevel](foregroundenergymanager_maxacceptableusagelevel.md), or [ExcessiveUsageLevel](foregroundenergymanager_excessiveusagelevel.md).
     * @remarks
     * The RecentEnergyUsage property is a more accurate measure of energy usage than [RecentEnergyUsageLevel](foregroundenergymanager_recentenergyusagelevel.md). The RecentEnergyUsage value will typically fall between predefined energy levels. The [RecentEnergyUsageLevel](foregroundenergymanager_recentenergyusagelevel.md) will always equal the nearest predefined energy level.
     * @see https://learn.microsoft.com/uwp/api/windows.system.power.foregroundenergymanager.recentenergyusage
     * @type {Integer} 
     */
    static RecentEnergyUsage {
        get => ForegroundEnergyManager.get_RecentEnergyUsage()
    }

    /**
     * Gets the nearest predefined energy level of the foreground app for the current 30 minute period, equal to [LowUsageLevel](foregroundenergymanager_lowusagelevel.md), [NearMaxAcceptableUsageLevel](foregroundenergymanager_nearmaxacceptableusagelevel.md), [MaxAcceptableUsageLevel](foregroundenergymanager_maxacceptableusagelevel.md), or [ExcessiveUsageLevel](foregroundenergymanager_excessiveusagelevel.md).
     * @see https://learn.microsoft.com/uwp/api/windows.system.power.foregroundenergymanager.recentenergyusagelevel
     * @type {Integer} 
     */
    static RecentEnergyUsageLevel {
        get => ForegroundEnergyManager.get_RecentEnergyUsageLevel()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {Integer} 
     */
    static get_LowUsageLevel() {
        if (!ForegroundEnergyManager.HasProp("__IForegroundEnergyManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Power.ForegroundEnergyManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IForegroundEnergyManagerStatics.IID)
            ForegroundEnergyManager.__IForegroundEnergyManagerStatics := IForegroundEnergyManagerStatics(factoryPtr)
        }

        return ForegroundEnergyManager.__IForegroundEnergyManagerStatics.get_LowUsageLevel()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_NearMaxAcceptableUsageLevel() {
        if (!ForegroundEnergyManager.HasProp("__IForegroundEnergyManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Power.ForegroundEnergyManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IForegroundEnergyManagerStatics.IID)
            ForegroundEnergyManager.__IForegroundEnergyManagerStatics := IForegroundEnergyManagerStatics(factoryPtr)
        }

        return ForegroundEnergyManager.__IForegroundEnergyManagerStatics.get_NearMaxAcceptableUsageLevel()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_MaxAcceptableUsageLevel() {
        if (!ForegroundEnergyManager.HasProp("__IForegroundEnergyManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Power.ForegroundEnergyManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IForegroundEnergyManagerStatics.IID)
            ForegroundEnergyManager.__IForegroundEnergyManagerStatics := IForegroundEnergyManagerStatics(factoryPtr)
        }

        return ForegroundEnergyManager.__IForegroundEnergyManagerStatics.get_MaxAcceptableUsageLevel()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_ExcessiveUsageLevel() {
        if (!ForegroundEnergyManager.HasProp("__IForegroundEnergyManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Power.ForegroundEnergyManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IForegroundEnergyManagerStatics.IID)
            ForegroundEnergyManager.__IForegroundEnergyManagerStatics := IForegroundEnergyManagerStatics(factoryPtr)
        }

        return ForegroundEnergyManager.__IForegroundEnergyManagerStatics.get_ExcessiveUsageLevel()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_RecentEnergyUsage() {
        if (!ForegroundEnergyManager.HasProp("__IForegroundEnergyManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Power.ForegroundEnergyManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IForegroundEnergyManagerStatics.IID)
            ForegroundEnergyManager.__IForegroundEnergyManagerStatics := IForegroundEnergyManagerStatics(factoryPtr)
        }

        return ForegroundEnergyManager.__IForegroundEnergyManagerStatics.get_RecentEnergyUsage()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_RecentEnergyUsageLevel() {
        if (!ForegroundEnergyManager.HasProp("__IForegroundEnergyManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Power.ForegroundEnergyManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IForegroundEnergyManagerStatics.IID)
            ForegroundEnergyManager.__IForegroundEnergyManagerStatics := IForegroundEnergyManagerStatics(factoryPtr)
        }

        return ForegroundEnergyManager.__IForegroundEnergyManagerStatics.get_RecentEnergyUsageLevel()
    }

    /**
     * 
     * @param {EventHandler<IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    static add_RecentEnergyUsageIncreased(handler) {
        if (!ForegroundEnergyManager.HasProp("__IForegroundEnergyManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Power.ForegroundEnergyManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IForegroundEnergyManagerStatics.IID)
            ForegroundEnergyManager.__IForegroundEnergyManagerStatics := IForegroundEnergyManagerStatics(factoryPtr)
        }

        return ForegroundEnergyManager.__IForegroundEnergyManagerStatics.add_RecentEnergyUsageIncreased(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    static remove_RecentEnergyUsageIncreased(token) {
        if (!ForegroundEnergyManager.HasProp("__IForegroundEnergyManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Power.ForegroundEnergyManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IForegroundEnergyManagerStatics.IID)
            ForegroundEnergyManager.__IForegroundEnergyManagerStatics := IForegroundEnergyManagerStatics(factoryPtr)
        }

        return ForegroundEnergyManager.__IForegroundEnergyManagerStatics.remove_RecentEnergyUsageIncreased(token)
    }

    /**
     * 
     * @param {EventHandler<IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    static add_RecentEnergyUsageReturnedToLow(handler) {
        if (!ForegroundEnergyManager.HasProp("__IForegroundEnergyManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Power.ForegroundEnergyManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IForegroundEnergyManagerStatics.IID)
            ForegroundEnergyManager.__IForegroundEnergyManagerStatics := IForegroundEnergyManagerStatics(factoryPtr)
        }

        return ForegroundEnergyManager.__IForegroundEnergyManagerStatics.add_RecentEnergyUsageReturnedToLow(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    static remove_RecentEnergyUsageReturnedToLow(token) {
        if (!ForegroundEnergyManager.HasProp("__IForegroundEnergyManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Power.ForegroundEnergyManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IForegroundEnergyManagerStatics.IID)
            ForegroundEnergyManager.__IForegroundEnergyManagerStatics := IForegroundEnergyManagerStatics(factoryPtr)
        }

        return ForegroundEnergyManager.__IForegroundEnergyManagerStatics.remove_RecentEnergyUsageReturnedToLow(token)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}

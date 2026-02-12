#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBackgroundWorkCostStatics2.ahk
#Include .\IBackgroundWorkCostStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Retrieves a hint about resource availability for background tasks. Background tasks can use this hint to decide how much work to do when they are activated.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.backgroundworkcost
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class BackgroundWorkCost extends IInspectable {
;@region Static Properties
    /**
     * Gets the energy consumption level of the background task.
     * @remarks
     * This property allows a developer to check if their application's background tasks have been throttled in modern standby.
     * 
     * If the **AppEnergyUseLevel** is **EnergyUseLevel.OverBudget**, it indicates that an application's energy use is over the budget and its background tasks are subject to being throttled in modern standby. Once the system is not in modern standby, those tasks that were throttled may be activated.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.backgroundworkcost.appenergyuselevel
     * @type {Integer} 
     */
    static AppEnergyUseLevel {
        get => BackgroundWorkCost.get_AppEnergyUseLevel()
    }

    /**
     * Gets the predicted energy consumption of the background task.
     * @remarks
     * This property allows a developer to check if their application's background tasks may be throttled in modern standby.
     * 
     * The **AppEnergyUsePrediction** indicates the energy use by its background tasks in modern standby, and provides a diagnostic tool for developers before any system decisions are made. If the **AppEnergyUsePrediction** is **EnergyUseTrend.OverBudget**, it indicates the application is running background tasks at a rate that will cause its energy use to be over budget. Developers can monitor this trend and reduce work done in modern standby before being throttled.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.backgroundworkcost.appenergyuseprediction
     * @type {Integer} 
     */
    static AppEnergyUsePrediction {
        get => BackgroundWorkCost.get_AppEnergyUsePrediction()
    }

    /**
     * Gets the last time the app was throttled in modern standby mode.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.backgroundworkcost.applastthrottledinstandbytimestamp
     * @type {DateTime} 
     */
    static AppLastThrottledInStandbyTimestamp {
        get => BackgroundWorkCost.get_AppLastThrottledInStandbyTimestamp()
    }

    /**
     * Retrieves a hint about resource availability for background tasks.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.backgroundworkcost.currentbackgroundworkcost
     * @type {Integer} 
     */
    static CurrentBackgroundWorkCost {
        get => BackgroundWorkCost.get_CurrentBackgroundWorkCost()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {Integer} 
     */
    static get_AppEnergyUseLevel() {
        if (!BackgroundWorkCost.HasProp("__IBackgroundWorkCostStatics2")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Background.BackgroundWorkCost")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBackgroundWorkCostStatics2.IID)
            BackgroundWorkCost.__IBackgroundWorkCostStatics2 := IBackgroundWorkCostStatics2(factoryPtr)
        }

        return BackgroundWorkCost.__IBackgroundWorkCostStatics2.get_AppEnergyUseLevel()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_AppEnergyUsePrediction() {
        if (!BackgroundWorkCost.HasProp("__IBackgroundWorkCostStatics2")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Background.BackgroundWorkCost")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBackgroundWorkCostStatics2.IID)
            BackgroundWorkCost.__IBackgroundWorkCostStatics2 := IBackgroundWorkCostStatics2(factoryPtr)
        }

        return BackgroundWorkCost.__IBackgroundWorkCostStatics2.get_AppEnergyUsePrediction()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    static get_AppLastThrottledInStandbyTimestamp() {
        if (!BackgroundWorkCost.HasProp("__IBackgroundWorkCostStatics2")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Background.BackgroundWorkCost")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBackgroundWorkCostStatics2.IID)
            BackgroundWorkCost.__IBackgroundWorkCostStatics2 := IBackgroundWorkCostStatics2(factoryPtr)
        }

        return BackgroundWorkCost.__IBackgroundWorkCostStatics2.get_AppLastThrottledInStandbyTimestamp()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_CurrentBackgroundWorkCost() {
        if (!BackgroundWorkCost.HasProp("__IBackgroundWorkCostStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Background.BackgroundWorkCost")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBackgroundWorkCostStatics.IID)
            BackgroundWorkCost.__IBackgroundWorkCostStatics := IBackgroundWorkCostStatics(factoryPtr)
        }

        return BackgroundWorkCost.__IBackgroundWorkCostStatics.get_CurrentBackgroundWorkCost()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}

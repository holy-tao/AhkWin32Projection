#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPowerGridForecast.ahk
#Include .\IPowerGridForecastStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains information about the power grid that the device is connected to. The data is meant to be used in a forecast for time-shifting the time at which workloads happen, or reducing energy consumption during intense times.
 * @remarks
 * Windows exposes forecasts of power grid carbon emissions based on the power grid that the device is connected to. This data is already used by Windows Update, for example, to time-shift when updates happen in order to lessen carbon emissions. This API exposes these same forecasts to you so that you can reduce the carbon emissions of some of your workloads. For example, you could time-shift when updates of your apps/games happen; or throttle the bit-rate of audio playback, or some other rendering fidelity level; or enable an *efficiency mode*, if you have one.
 * 
 * The power grid forecast API provides two signals to you (to prompt time-shifting). One signal contains a normalized [Severity](./powergriddata_severity.md) value (between 0.0 and 1.0) of grid conditions to optimize for (carbon intensity). The other signal, [IsLowUserExperienceImpact](./powergriddata_islowuserexperienceimpact.md), is a Boolean value that represents when Windows thinks the user will be away from the device. You might choose to use only one signal instead of both; the signals have value individually as well as together.
 * 
 * *Time-shifting* means using the same energy to accomplish work, but doing so at a different time based on a signal.
 * 
 * *Severity* is a normalized value between 0.0 and 1.0, where 0 is considered best, and 1 is worst. That corresponds to power grid carbon severity based on where the device is located.
 * 
 * *Low user-experience impact*. A Boolean value that represents when Windows thinks the user will be away, or not using many resources. This can be thought of as inverse Active Hours. When the value is `true`, it's considered a good time to time-shift workloads to. When it's `false`, it's considered a bad time to time-shift workloads to, in terms of user experience.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.power.powergridforecast
 * @namespace Windows.Devices.Power
 * @version WindowsRuntime 1.4
 */
class PowerGridForecast extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPowerGridForecast

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPowerGridForecast.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Static method to retrieve the forecast. Upon failure, this will return an empty forecast.
     * @returns {PowerGridForecast} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.power.powergridforecast.getforecast
     */
    static GetForecast() {
        if (!PowerGridForecast.HasProp("__IPowerGridForecastStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Power.PowerGridForecast")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPowerGridForecastStatics.IID)
            PowerGridForecast.__IPowerGridForecastStatics := IPowerGridForecastStatics(factoryPtr)
        }

        return PowerGridForecast.__IPowerGridForecastStatics.GetForecast()
    }

    /**
     * 
     * @param {EventHandler<IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    static add_ForecastUpdated(handler) {
        if (!PowerGridForecast.HasProp("__IPowerGridForecastStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Power.PowerGridForecast")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPowerGridForecastStatics.IID)
            PowerGridForecast.__IPowerGridForecastStatics := IPowerGridForecastStatics(factoryPtr)
        }

        return PowerGridForecast.__IPowerGridForecastStatics.add_ForecastUpdated(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    static remove_ForecastUpdated(token) {
        if (!PowerGridForecast.HasProp("__IPowerGridForecastStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Power.PowerGridForecast")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPowerGridForecastStatics.IID)
            PowerGridForecast.__IPowerGridForecastStatics := IPowerGridForecastStatics(factoryPtr)
        }

        return PowerGridForecast.__IPowerGridForecastStatics.remove_ForecastUpdated(token)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the start time of the first element in [Forecast](./powergridforecast_forecast.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.power.powergridforecast.starttime
     * @type {DateTime} 
     */
    StartTime {
        get => this.get_StartTime()
    }

    /**
     * The duration of each element in the [Forecast](./powergridforecast_forecast.md) vector.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.power.powergridforecast.blockduration
     * @type {TimeSpan} 
     */
    BlockDuration {
        get => this.get_BlockDuration()
    }

    /**
     * Gets a vector that contains the forecast data. The forecast is contiguous, and begins at [StartTime](./powergridforecast_starttime.md). The start time of each element can be calculated with `StartTime + (index * BlockDuration)`.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.power.powergridforecast.forecast
     * @type {IVectorView<PowerGridData>} 
     */
    Forecast {
        get => this.get_Forecast()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_StartTime() {
        if (!this.HasProp("__IPowerGridForecast")) {
            if ((queryResult := this.QueryInterface(IPowerGridForecast.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPowerGridForecast := IPowerGridForecast(outPtr)
        }

        return this.__IPowerGridForecast.get_StartTime()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_BlockDuration() {
        if (!this.HasProp("__IPowerGridForecast")) {
            if ((queryResult := this.QueryInterface(IPowerGridForecast.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPowerGridForecast := IPowerGridForecast(outPtr)
        }

        return this.__IPowerGridForecast.get_BlockDuration()
    }

    /**
     * 
     * @returns {IVectorView<PowerGridData>} 
     */
    get_Forecast() {
        if (!this.HasProp("__IPowerGridForecast")) {
            if ((queryResult := this.QueryInterface(IPowerGridForecast.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPowerGridForecast := IPowerGridForecast(outPtr)
        }

        return this.__IPowerGridForecast.get_Forecast()
    }

;@endregion Instance Methods
}

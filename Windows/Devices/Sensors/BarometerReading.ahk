#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBarometerReading.ahk
#Include .\IBarometerReading2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a barometer reading.
 * @remarks
 * This object is accessed when you invoke the [GetCurrentReading](barometer_getcurrentreading_1416488181.md) method; and, it is accessed when you retrieve the [Reading](barometerreadingchangedeventargs_reading.md) property of the [BarometerReadingChangedEventArgs](barometerreadingchangedeventargs.md) object in the event callback method.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.barometerreading
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class BarometerReading extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBarometerReading

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBarometerReading.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the time for the most recent barometer reading.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.barometerreading.timestamp
     * @type {DateTime} 
     */
    Timestamp {
        get => this.get_Timestamp()
    }

    /**
     * Gets the barometric pressure determined by the barometer sensor.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.barometerreading.stationpressureinhectopascals
     * @type {Float} 
     */
    StationPressureInHectopascals {
        get => this.get_StationPressureInHectopascals()
    }

    /**
     * Gets the performance count associated with the reading. This allows the reading to be synchronized with other devices and processes on the system.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.barometerreading.performancecount
     * @type {IReference<TimeSpan>} 
     */
    PerformanceCount {
        get => this.get_PerformanceCount()
    }

    /**
     * Gets the data properties reported by the sensor.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.barometerreading.properties
     * @type {IMapView<HSTRING, IInspectable>} 
     */
    Properties {
        get => this.get_Properties()
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
    get_Timestamp() {
        if (!this.HasProp("__IBarometerReading")) {
            if ((queryResult := this.QueryInterface(IBarometerReading.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarometerReading := IBarometerReading(outPtr)
        }

        return this.__IBarometerReading.get_Timestamp()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_StationPressureInHectopascals() {
        if (!this.HasProp("__IBarometerReading")) {
            if ((queryResult := this.QueryInterface(IBarometerReading.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarometerReading := IBarometerReading(outPtr)
        }

        return this.__IBarometerReading.get_StationPressureInHectopascals()
    }

    /**
     * 
     * @returns {IReference<TimeSpan>} 
     */
    get_PerformanceCount() {
        if (!this.HasProp("__IBarometerReading2")) {
            if ((queryResult := this.QueryInterface(IBarometerReading2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarometerReading2 := IBarometerReading2(outPtr)
        }

        return this.__IBarometerReading2.get_PerformanceCount()
    }

    /**
     * 
     * @returns {IMapView<HSTRING, IInspectable>} 
     */
    get_Properties() {
        if (!this.HasProp("__IBarometerReading2")) {
            if ((queryResult := this.QueryInterface(IBarometerReading2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarometerReading2 := IBarometerReading2(outPtr)
        }

        return this.__IBarometerReading2.get_Properties()
    }

;@endregion Instance Methods
}

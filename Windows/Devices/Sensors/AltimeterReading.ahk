#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAltimeterReading.ahk
#Include .\IAltimeterReading2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents an altimeter reading.
 * @remarks
 * This object is accessed when you invoke the [GetCurrentReading](altimeter_getcurrentreading_1416488181.md) method; and, it is accessed when you retrieve the [Reading](altimeterreadingchangedeventargs_reading.md) property of the [AltimeterReadingChangedEventArgs](altimeterreadingchangedeventargs.md) object in the event callback method.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.altimeterreading
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class AltimeterReading extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAltimeterReading

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAltimeterReading.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the time for the most recent altimeter reading.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.altimeterreading.timestamp
     * @type {DateTime} 
     */
    Timestamp {
        get => this.get_Timestamp()
    }

    /**
     * Gets the current altitude determined by the altimeter sensor.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.altimeterreading.altitudechangeinmeters
     * @type {Float} 
     */
    AltitudeChangeInMeters {
        get => this.get_AltitudeChangeInMeters()
    }

    /**
     * Gets the performance count associated with the reading. This allows the reading to be synchronized with other devices and processes on the system.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.altimeterreading.performancecount
     * @type {IReference<TimeSpan>} 
     */
    PerformanceCount {
        get => this.get_PerformanceCount()
    }

    /**
     * Gets the data properties reported by the sensor.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.altimeterreading.properties
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
        if (!this.HasProp("__IAltimeterReading")) {
            if ((queryResult := this.QueryInterface(IAltimeterReading.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAltimeterReading := IAltimeterReading(outPtr)
        }

        return this.__IAltimeterReading.get_Timestamp()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_AltitudeChangeInMeters() {
        if (!this.HasProp("__IAltimeterReading")) {
            if ((queryResult := this.QueryInterface(IAltimeterReading.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAltimeterReading := IAltimeterReading(outPtr)
        }

        return this.__IAltimeterReading.get_AltitudeChangeInMeters()
    }

    /**
     * 
     * @returns {IReference<TimeSpan>} 
     */
    get_PerformanceCount() {
        if (!this.HasProp("__IAltimeterReading2")) {
            if ((queryResult := this.QueryInterface(IAltimeterReading2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAltimeterReading2 := IAltimeterReading2(outPtr)
        }

        return this.__IAltimeterReading2.get_PerformanceCount()
    }

    /**
     * 
     * @returns {IMapView<HSTRING, IInspectable>} 
     */
    get_Properties() {
        if (!this.HasProp("__IAltimeterReading2")) {
            if ((queryResult := this.QueryInterface(IAltimeterReading2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAltimeterReading2 := IAltimeterReading2(outPtr)
        }

        return this.__IAltimeterReading2.get_Properties()
    }

;@endregion Instance Methods
}

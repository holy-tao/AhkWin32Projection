#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAccelerometerReading.ahk
#Include .\IAccelerometerReading2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents an accelerometer reading.
 * @remarks
 * This object is accessed when you invoke the [GetCurrentReading](accelerometer_getcurrentreading_1416488181.md) method; and, it is accessed when you retrieve the [Reading](accelerometerreadingchangedeventargs_reading.md) property of the [AccelerometerReadingChangedEventArgs](accelerometerreadingchangedeventargs.md) object in the event callback method.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.accelerometerreading
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class AccelerometerReading extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAccelerometerReading

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAccelerometerReading.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the time at which the sensor reported the reading.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.accelerometerreading.timestamp
     * @type {DateTime} 
     */
    Timestamp {
        get => this.get_Timestamp()
    }

    /**
     * Gets the g-force acceleration along the x-axis.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.accelerometerreading.accelerationx
     * @type {Float} 
     */
    AccelerationX {
        get => this.get_AccelerationX()
    }

    /**
     * Gets the g-force acceleration along the y-axis.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.accelerometerreading.accelerationy
     * @type {Float} 
     */
    AccelerationY {
        get => this.get_AccelerationY()
    }

    /**
     * Gets the g-force acceleration along the z-axis.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.accelerometerreading.accelerationz
     * @type {Float} 
     */
    AccelerationZ {
        get => this.get_AccelerationZ()
    }

    /**
     * Gets the performance count associated with the reading. This allows the reading to be synchronized with other devices and processes on the system.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.accelerometerreading.performancecount
     * @type {IReference<TimeSpan>} 
     */
    PerformanceCount {
        get => this.get_PerformanceCount()
    }

    /**
     * Gets the data properties reported by the sensor.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.accelerometerreading.properties
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
        if (!this.HasProp("__IAccelerometerReading")) {
            if ((queryResult := this.QueryInterface(IAccelerometerReading.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAccelerometerReading := IAccelerometerReading(outPtr)
        }

        return this.__IAccelerometerReading.get_Timestamp()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_AccelerationX() {
        if (!this.HasProp("__IAccelerometerReading")) {
            if ((queryResult := this.QueryInterface(IAccelerometerReading.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAccelerometerReading := IAccelerometerReading(outPtr)
        }

        return this.__IAccelerometerReading.get_AccelerationX()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_AccelerationY() {
        if (!this.HasProp("__IAccelerometerReading")) {
            if ((queryResult := this.QueryInterface(IAccelerometerReading.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAccelerometerReading := IAccelerometerReading(outPtr)
        }

        return this.__IAccelerometerReading.get_AccelerationY()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_AccelerationZ() {
        if (!this.HasProp("__IAccelerometerReading")) {
            if ((queryResult := this.QueryInterface(IAccelerometerReading.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAccelerometerReading := IAccelerometerReading(outPtr)
        }

        return this.__IAccelerometerReading.get_AccelerationZ()
    }

    /**
     * 
     * @returns {IReference<TimeSpan>} 
     */
    get_PerformanceCount() {
        if (!this.HasProp("__IAccelerometerReading2")) {
            if ((queryResult := this.QueryInterface(IAccelerometerReading2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAccelerometerReading2 := IAccelerometerReading2(outPtr)
        }

        return this.__IAccelerometerReading2.get_PerformanceCount()
    }

    /**
     * 
     * @returns {IMapView<HSTRING, IInspectable>} 
     */
    get_Properties() {
        if (!this.HasProp("__IAccelerometerReading2")) {
            if ((queryResult := this.QueryInterface(IAccelerometerReading2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAccelerometerReading2 := IAccelerometerReading2(outPtr)
        }

        return this.__IAccelerometerReading2.get_Properties()
    }

;@endregion Instance Methods
}

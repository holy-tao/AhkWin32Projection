#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGyrometerReading.ahk
#Include .\IGyrometerReading2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a gyrometer reading.
 * @remarks
 * This object is accessed when you invoke the [GetCurrentReading](gyrometer_getcurrentreading_1416488181.md) method; and, it is accessed when you retrieve the [Reading](gyrometerreadingchangedeventargs_reading.md) property of the [GyrometerReadingChangedEventArgs](gyrometerreadingchangedeventargs.md) object in the event callback method.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.gyrometerreading
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class GyrometerReading extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGyrometerReading

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGyrometerReading.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the time at which the sensor reported the reading.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.gyrometerreading.timestamp
     * @type {DateTime} 
     */
    Timestamp {
        get => this.get_Timestamp()
    }

    /**
     * Gets the angular velocity, in degrees per second, about the x-axis.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.gyrometerreading.angularvelocityx
     * @type {Float} 
     */
    AngularVelocityX {
        get => this.get_AngularVelocityX()
    }

    /**
     * Gets the angular velocity, in degrees per second, about the y-axis.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.gyrometerreading.angularvelocityy
     * @type {Float} 
     */
    AngularVelocityY {
        get => this.get_AngularVelocityY()
    }

    /**
     * Gets the angular velocity, in degrees per second, about the z-axis.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.gyrometerreading.angularvelocityz
     * @type {Float} 
     */
    AngularVelocityZ {
        get => this.get_AngularVelocityZ()
    }

    /**
     * Gets the performance count associated with the reading. This allows the reading to be synchronized with other devices and processes on the system.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.gyrometerreading.performancecount
     * @type {IReference<TimeSpan>} 
     */
    PerformanceCount {
        get => this.get_PerformanceCount()
    }

    /**
     * Gets the data properties reported by the sensor.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.gyrometerreading.properties
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
        if (!this.HasProp("__IGyrometerReading")) {
            if ((queryResult := this.QueryInterface(IGyrometerReading.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGyrometerReading := IGyrometerReading(outPtr)
        }

        return this.__IGyrometerReading.get_Timestamp()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_AngularVelocityX() {
        if (!this.HasProp("__IGyrometerReading")) {
            if ((queryResult := this.QueryInterface(IGyrometerReading.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGyrometerReading := IGyrometerReading(outPtr)
        }

        return this.__IGyrometerReading.get_AngularVelocityX()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_AngularVelocityY() {
        if (!this.HasProp("__IGyrometerReading")) {
            if ((queryResult := this.QueryInterface(IGyrometerReading.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGyrometerReading := IGyrometerReading(outPtr)
        }

        return this.__IGyrometerReading.get_AngularVelocityY()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_AngularVelocityZ() {
        if (!this.HasProp("__IGyrometerReading")) {
            if ((queryResult := this.QueryInterface(IGyrometerReading.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGyrometerReading := IGyrometerReading(outPtr)
        }

        return this.__IGyrometerReading.get_AngularVelocityZ()
    }

    /**
     * 
     * @returns {IReference<TimeSpan>} 
     */
    get_PerformanceCount() {
        if (!this.HasProp("__IGyrometerReading2")) {
            if ((queryResult := this.QueryInterface(IGyrometerReading2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGyrometerReading2 := IGyrometerReading2(outPtr)
        }

        return this.__IGyrometerReading2.get_PerformanceCount()
    }

    /**
     * 
     * @returns {IMapView<HSTRING, IInspectable>} 
     */
    get_Properties() {
        if (!this.HasProp("__IGyrometerReading2")) {
            if ((queryResult := this.QueryInterface(IGyrometerReading2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGyrometerReading2 := IGyrometerReading2(outPtr)
        }

        return this.__IGyrometerReading2.get_Properties()
    }

;@endregion Instance Methods
}

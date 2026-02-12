#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ILightSensorReading.ahk
#Include .\ILightSensorReading2.ahk
#Include .\ILightSensorReading3.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents an ambient light–sensor reading.
 * @remarks
 * This object is accessed when you invoke the [GetCurrentReading](lightsensor_getcurrentreading_1416488181.md) method; and, it is accessed when you retrieve the [Reading](lightsensorreadingchangedeventargs_reading.md) property of the [LightSensorReadingChangedEventArgs](lightsensorreadingchangedeventargs.md) object in the event callback method..
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.lightsensorreading
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class LightSensorReading extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ILightSensorReading

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ILightSensorReading.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the time at which the sensor reported the reading.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.lightsensorreading.timestamp
     * @type {DateTime} 
     */
    Timestamp {
        get => this.get_Timestamp()
    }

    /**
     * Gets the illuminance level in lux.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.lightsensorreading.illuminanceinlux
     * @type {Float} 
     */
    IlluminanceInLux {
        get => this.get_IlluminanceInLux()
    }

    /**
     * Gets the performance count associated with the reading. This allows the reading to be synchronized with other devices and processes on the system.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.lightsensorreading.performancecount
     * @type {IReference<TimeSpan>} 
     */
    PerformanceCount {
        get => this.get_PerformanceCount()
    }

    /**
     * Gets the data properties reported by the sensor.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.lightsensorreading.properties
     * @type {IMapView<HSTRING, IInspectable>} 
     */
    Properties {
        get => this.get_Properties()
    }

    /**
     * Gets the chromaticity values for both x and y in the CIE xyY color space.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.lightsensorreading.chromaticity
     * @type {LightSensorChromaticity} 
     */
    Chromaticity {
        get => this.get_Chromaticity()
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
        if (!this.HasProp("__ILightSensorReading")) {
            if ((queryResult := this.QueryInterface(ILightSensorReading.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILightSensorReading := ILightSensorReading(outPtr)
        }

        return this.__ILightSensorReading.get_Timestamp()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_IlluminanceInLux() {
        if (!this.HasProp("__ILightSensorReading")) {
            if ((queryResult := this.QueryInterface(ILightSensorReading.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILightSensorReading := ILightSensorReading(outPtr)
        }

        return this.__ILightSensorReading.get_IlluminanceInLux()
    }

    /**
     * 
     * @returns {IReference<TimeSpan>} 
     */
    get_PerformanceCount() {
        if (!this.HasProp("__ILightSensorReading2")) {
            if ((queryResult := this.QueryInterface(ILightSensorReading2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILightSensorReading2 := ILightSensorReading2(outPtr)
        }

        return this.__ILightSensorReading2.get_PerformanceCount()
    }

    /**
     * 
     * @returns {IMapView<HSTRING, IInspectable>} 
     */
    get_Properties() {
        if (!this.HasProp("__ILightSensorReading2")) {
            if ((queryResult := this.QueryInterface(ILightSensorReading2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILightSensorReading2 := ILightSensorReading2(outPtr)
        }

        return this.__ILightSensorReading2.get_Properties()
    }

    /**
     * 
     * @returns {LightSensorChromaticity} 
     */
    get_Chromaticity() {
        if (!this.HasProp("__ILightSensorReading3")) {
            if ((queryResult := this.QueryInterface(ILightSensorReading3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILightSensorReading3 := ILightSensorReading3(outPtr)
        }

        return this.__ILightSensorReading3.get_Chromaticity()
    }

;@endregion Instance Methods
}

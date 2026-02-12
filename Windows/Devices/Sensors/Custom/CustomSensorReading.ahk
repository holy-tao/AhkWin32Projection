#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICustomSensorReading.ahk
#Include .\ICustomSensorReading2.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a property set of key/value pairs that contain the custom data sent from the sensor's driver to the app.
  * 
  * Each key is a string that represents a [PROPERTYKEY](/windows/win32/api/wtypes/ns-wtypes-propertykey). Each value can be an integer, boolean, float, or double.
 * @remarks
 * This object is accessed by calling the [GetCurrentReading](customsensor_getcurrentreading_1416488181.md) method or by retrieving the [Reading](customsensorreadingchangedeventargs_reading.md) property of the [CustomSensorReadingChangedEventArgs](customsensorreadingchangedeventargs.md) object in the event callback method.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.custom.customsensorreading
 * @namespace Windows.Devices.Sensors.Custom
 * @version WindowsRuntime 1.4
 */
class CustomSensorReading extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICustomSensorReading

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICustomSensorReading.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the time at which the sensor reported the reading.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.custom.customsensorreading.timestamp
     * @type {DateTime} 
     */
    Timestamp {
        get => this.get_Timestamp()
    }

    /**
     * Gets the property set for the sensor.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.custom.customsensorreading.properties
     * @type {IMapView<HSTRING, IInspectable>} 
     */
    Properties {
        get => this.get_Properties()
    }

    /**
     * Gets the performance count associated with the reading. This allows the reading to be synchronized with other devices and processes on the system.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.custom.customsensorreading.performancecount
     * @type {IReference<TimeSpan>} 
     */
    PerformanceCount {
        get => this.get_PerformanceCount()
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
        if (!this.HasProp("__ICustomSensorReading")) {
            if ((queryResult := this.QueryInterface(ICustomSensorReading.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICustomSensorReading := ICustomSensorReading(outPtr)
        }

        return this.__ICustomSensorReading.get_Timestamp()
    }

    /**
     * 
     * @returns {IMapView<HSTRING, IInspectable>} 
     */
    get_Properties() {
        if (!this.HasProp("__ICustomSensorReading")) {
            if ((queryResult := this.QueryInterface(ICustomSensorReading.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICustomSensorReading := ICustomSensorReading(outPtr)
        }

        return this.__ICustomSensorReading.get_Properties()
    }

    /**
     * 
     * @returns {IReference<TimeSpan>} 
     */
    get_PerformanceCount() {
        if (!this.HasProp("__ICustomSensorReading2")) {
            if ((queryResult := this.QueryInterface(ICustomSensorReading2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICustomSensorReading2 := ICustomSensorReading2(outPtr)
        }

        return this.__ICustomSensorReading2.get_PerformanceCount()
    }

;@endregion Instance Methods
}

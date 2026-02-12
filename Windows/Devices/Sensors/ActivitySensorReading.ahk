#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IActivitySensorReading.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the reading of an activity sensor that provides readings for the sensor.
 * @remarks
 * This object is accessed when you call the [ActivitySensor.GetCurrentReadingAsync](activitysensor_getcurrentreadingasync_1875759564.md) method.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.activitysensorreading
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class ActivitySensorReading extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IActivitySensorReading

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IActivitySensorReading.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the time at which the sensor reported the reading.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.activitysensorreading.timestamp
     * @type {DateTime} 
     */
    Timestamp {
        get => this.get_Timestamp()
    }

    /**
     * Gets the activity type for the sensor.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.activitysensorreading.activity
     * @type {Integer} 
     */
    Activity {
        get => this.get_Activity()
    }

    /**
     * Gets the reading confidence for the sensor.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.activitysensorreading.confidence
     * @type {Integer} 
     */
    Confidence {
        get => this.get_Confidence()
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
        if (!this.HasProp("__IActivitySensorReading")) {
            if ((queryResult := this.QueryInterface(IActivitySensorReading.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivitySensorReading := IActivitySensorReading(outPtr)
        }

        return this.__IActivitySensorReading.get_Timestamp()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Activity() {
        if (!this.HasProp("__IActivitySensorReading")) {
            if ((queryResult := this.QueryInterface(IActivitySensorReading.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivitySensorReading := IActivitySensorReading(outPtr)
        }

        return this.__IActivitySensorReading.get_Activity()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Confidence() {
        if (!this.HasProp("__IActivitySensorReading")) {
            if ((queryResult := this.QueryInterface(IActivitySensorReading.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivitySensorReading := IActivitySensorReading(outPtr)
        }

        return this.__IActivitySensorReading.get_Confidence()
    }

;@endregion Instance Methods
}

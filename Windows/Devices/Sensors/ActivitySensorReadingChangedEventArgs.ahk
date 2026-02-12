#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IActivitySensorReadingChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents data for the reading–changed event of the sensor.
 * @remarks
 * This object is accessed when your app supports the [ActivitySensor.ReadingChanged](activitysensor_readingchanged.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.activitysensorreadingchangedeventargs
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class ActivitySensorReadingChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IActivitySensorReadingChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IActivitySensorReadingChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the most recent sensor reading.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.activitysensorreadingchangedeventargs.reading
     * @type {ActivitySensorReading} 
     */
    Reading {
        get => this.get_Reading()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {ActivitySensorReading} 
     */
    get_Reading() {
        if (!this.HasProp("__IActivitySensorReadingChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IActivitySensorReadingChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivitySensorReadingChangedEventArgs := IActivitySensorReadingChangedEventArgs(outPtr)
        }

        return this.__IActivitySensorReadingChangedEventArgs.get_Reading()
    }

;@endregion Instance Methods
}

#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPedometerReading.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a pedometer reading.
 * @remarks
 * This object is accessed when you request the sensor history. It is also accessed when you retrieve the [Reading](pedometerreadingchangedeventargs_reading.md) property of the [PedometerReadingChangedEventArgs](pedometerreadingchangedeventargs.md) object in the event callback method.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.pedometerreading
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class PedometerReading extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPedometerReading

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPedometerReading.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Indicates the type of steps taken for this pedometer reading.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.pedometerreading.stepkind
     * @type {Integer} 
     */
    StepKind {
        get => this.get_StepKind()
    }

    /**
     * Gets the total number of steps taken for this pedometer reading.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.pedometerreading.cumulativesteps
     * @type {Integer} 
     */
    CumulativeSteps {
        get => this.get_CumulativeSteps()
    }

    /**
     * Gets the time for the most recent pedometer reading.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.pedometerreading.timestamp
     * @type {DateTime} 
     */
    Timestamp {
        get => this.get_Timestamp()
    }

    /**
     * Gets the amount of time that has elapsed for this pedometer reading.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.pedometerreading.cumulativestepsduration
     * @type {TimeSpan} 
     */
    CumulativeStepsDuration {
        get => this.get_CumulativeStepsDuration()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_StepKind() {
        if (!this.HasProp("__IPedometerReading")) {
            if ((queryResult := this.QueryInterface(IPedometerReading.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPedometerReading := IPedometerReading(outPtr)
        }

        return this.__IPedometerReading.get_StepKind()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CumulativeSteps() {
        if (!this.HasProp("__IPedometerReading")) {
            if ((queryResult := this.QueryInterface(IPedometerReading.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPedometerReading := IPedometerReading(outPtr)
        }

        return this.__IPedometerReading.get_CumulativeSteps()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_Timestamp() {
        if (!this.HasProp("__IPedometerReading")) {
            if ((queryResult := this.QueryInterface(IPedometerReading.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPedometerReading := IPedometerReading(outPtr)
        }

        return this.__IPedometerReading.get_Timestamp()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_CumulativeStepsDuration() {
        if (!this.HasProp("__IPedometerReading")) {
            if ((queryResult := this.QueryInterface(IPedometerReading.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPedometerReading := IPedometerReading(outPtr)
        }

        return this.__IPedometerReading.get_CumulativeStepsDuration()
    }

;@endregion Instance Methods
}

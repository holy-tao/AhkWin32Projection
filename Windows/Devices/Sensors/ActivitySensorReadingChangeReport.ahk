#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IActivitySensorReadingChangeReport.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents data for the sensor trigger.
 * @remarks
 * This object is accessed when you call the [ActivitySensorTriggerDetails.ReadReports](activitysensortriggerdetails_readreports_231406138.md) method.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.activitysensorreadingchangereport
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class ActivitySensorReadingChangeReport extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IActivitySensorReadingChangeReport

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IActivitySensorReadingChangeReport.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the reading of the sensor when it's triggered.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.activitysensorreadingchangereport.reading
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
        if (!this.HasProp("__IActivitySensorReadingChangeReport")) {
            if ((queryResult := this.QueryInterface(IActivitySensorReadingChangeReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivitySensorReadingChangeReport := IActivitySensorReadingChangeReport(outPtr)
        }

        return this.__IActivitySensorReadingChangeReport.get_Reading()
    }

;@endregion Instance Methods
}

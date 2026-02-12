#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IActivitySensorTriggerDetails.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents details about the sensor triggering.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.activitysensortriggerdetails
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class ActivitySensorTriggerDetails extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IActivitySensorTriggerDetails

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IActivitySensorTriggerDetails.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Reads reports about the sensor triggering.
     * @returns {IVectorView<ActivitySensorReadingChangeReport>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.activitysensortriggerdetails.readreports
     */
    ReadReports() {
        if (!this.HasProp("__IActivitySensorTriggerDetails")) {
            if ((queryResult := this.QueryInterface(IActivitySensorTriggerDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivitySensorTriggerDetails := IActivitySensorTriggerDetails(outPtr)
        }

        return this.__IActivitySensorTriggerDetails.ReadReports()
    }

;@endregion Instance Methods
}

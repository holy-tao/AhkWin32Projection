#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISensorDataThresholdTriggerDetails.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for what sensor triggered the data threshold monitoring task.
 * @remarks
 * In order to support the background trigger of sensors based on data threshold triggers, you will need to implement a method like [GetReadingsFromTriggerDetails](pedometer_getreadingsfromtriggerdetails_412199864.md). You will need to do this for every sensor you want to respond to the data threshold trigger.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.sensordatathresholdtriggerdetails
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class SensorDataThresholdTriggerDetails extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISensorDataThresholdTriggerDetails

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISensorDataThresholdTriggerDetails.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the device identifier for the device that activated the threshold trigger.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.sensordatathresholdtriggerdetails.deviceid
     * @type {HSTRING} 
     */
    DeviceId {
        get => this.get_DeviceId()
    }

    /**
     * Gets the type of sensor associated with the threshold trigger.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.sensordatathresholdtriggerdetails.sensortype
     * @type {Integer} 
     */
    SensorType {
        get => this.get_SensorType()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DeviceId() {
        if (!this.HasProp("__ISensorDataThresholdTriggerDetails")) {
            if ((queryResult := this.QueryInterface(ISensorDataThresholdTriggerDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISensorDataThresholdTriggerDetails := ISensorDataThresholdTriggerDetails(outPtr)
        }

        return this.__ISensorDataThresholdTriggerDetails.get_DeviceId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SensorType() {
        if (!this.HasProp("__ISensorDataThresholdTriggerDetails")) {
            if ((queryResult := this.QueryInterface(ISensorDataThresholdTriggerDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISensorDataThresholdTriggerDetails := ISensorDataThresholdTriggerDetails(outPtr)
        }

        return this.__ISensorDataThresholdTriggerDetails.get_SensorType()
    }

;@endregion Instance Methods
}

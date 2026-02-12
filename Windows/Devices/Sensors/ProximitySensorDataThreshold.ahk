#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISensorDataThreshold.ahk
#Include .\IProximitySensorDataThresholdFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * A threshold for the [ProximitySensor](proximitysensor.md). When the threshold conditions are met, the sensor trigger will activate.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.proximitysensordatathreshold
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class ProximitySensorDataThreshold extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISensorDataThreshold

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISensorDataThreshold.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a [ProximitySensorDataThreshold](proximitysensordatathreshold.md) object.
     * @remarks
     * The threshold for a [ProximitySensorDataThreshold](proximitysensordatathreshold.md) is if the [ProximitySensorReading](proximitysensorreading.md) value changes.
     * @param {ProximitySensor} sensor_ The proximity sensor.
     * @returns {ProximitySensorDataThreshold} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.proximitysensordatathreshold.#ctor
     */
    static Create(sensor_) {
        if (!ProximitySensorDataThreshold.HasProp("__IProximitySensorDataThresholdFactory")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Sensors.ProximitySensorDataThreshold")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IProximitySensorDataThresholdFactory.IID)
            ProximitySensorDataThreshold.__IProximitySensorDataThresholdFactory := IProximitySensorDataThresholdFactory(factoryPtr)
        }

        return ProximitySensorDataThreshold.__IProximitySensorDataThresholdFactory.Create(sensor_)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}

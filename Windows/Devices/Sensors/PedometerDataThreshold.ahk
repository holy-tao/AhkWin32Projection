#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISensorDataThreshold.ahk
#Include .\IPedometerDataThresholdFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * A threshold for the [Pedometer](pedometer.md) sensor. When the threshold conditions are met, the sensor trigger will activate.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.pedometerdatathreshold
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class PedometerDataThreshold extends IInspectable {
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
     * Creates a [PedometerDataThreshold](pedometerdatathreshold.md) object.
     * @remarks
     * The value of *stepGoal* needs to be greater than 0.
     * @param {Pedometer} sensor_ The pedometer sensor.
     * @param {Integer} stepGoal The number of steps before the threshold is exceeded and the background task is activated.
     * @returns {PedometerDataThreshold} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.pedometerdatathreshold.#ctor
     */
    static Create(sensor_, stepGoal) {
        if (!PedometerDataThreshold.HasProp("__IPedometerDataThresholdFactory")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Sensors.PedometerDataThreshold")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPedometerDataThresholdFactory.IID)
            PedometerDataThreshold.__IPedometerDataThresholdFactory := IPedometerDataThresholdFactory(factoryPtr)
        }

        return PedometerDataThreshold.__IPedometerDataThresholdFactory.Create(sensor_, stepGoal)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}

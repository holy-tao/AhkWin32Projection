#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IProximitySensorReading.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a reading from the proximity sensor.
 * @remarks
 * This object is accessed when you invoke the [GetCurrentReading](proximitysensor_getcurrentreading_1416488181.md) method; and it is accessed when you retrieve the [Reading](proximitysensorreadingchangedeventargs_reading.md) property of the [ProximityReadingChangedEventArgs](proximitysensorreadingchangedeventargs.md) object in the event callback method.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.proximitysensorreading
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class ProximitySensorReading extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IProximitySensorReading

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IProximitySensorReading.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the time for the most recent proximity sensor reading.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.proximitysensorreading.timestamp
     * @type {DateTime} 
     */
    Timestamp {
        get => this.get_Timestamp()
    }

    /**
     * Gets whether or not an object is detected by the proximity sensor.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.proximitysensorreading.isdetected
     * @type {Boolean} 
     */
    IsDetected {
        get => this.get_IsDetected()
    }

    /**
     * Gets the distance from the proximity sensor to the detected object.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.proximitysensorreading.distanceinmillimeters
     * @type {IReference<Integer>} 
     */
    DistanceInMillimeters {
        get => this.get_DistanceInMillimeters()
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
        if (!this.HasProp("__IProximitySensorReading")) {
            if ((queryResult := this.QueryInterface(IProximitySensorReading.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProximitySensorReading := IProximitySensorReading(outPtr)
        }

        return this.__IProximitySensorReading.get_Timestamp()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDetected() {
        if (!this.HasProp("__IProximitySensorReading")) {
            if ((queryResult := this.QueryInterface(IProximitySensorReading.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProximitySensorReading := IProximitySensorReading(outPtr)
        }

        return this.__IProximitySensorReading.get_IsDetected()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_DistanceInMillimeters() {
        if (!this.HasProp("__IProximitySensorReading")) {
            if ((queryResult := this.QueryInterface(IProximitySensorReading.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProximitySensorReading := IProximitySensorReading(outPtr)
        }

        return this.__IProximitySensorReading.get_DistanceInMillimeters()
    }

;@endregion Instance Methods
}

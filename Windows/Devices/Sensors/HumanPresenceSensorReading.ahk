#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHumanPresenceSensorReading.ahk
#Include .\IHumanPresenceSensorReading2.ahk
#Include .\IHumanPresenceSensorReading3.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a single reading from a [HumanPresenceSensor](humanpresencesensor.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.humanpresencesensorreading
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class HumanPresenceSensorReading extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHumanPresenceSensorReading

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHumanPresenceSensorReading.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the time at which the sensor reported the reading.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.humanpresencesensorreading.timestamp
     * @type {DateTime} 
     */
    Timestamp {
        get => this.get_Timestamp()
    }

    /**
     * Gets whether a user is detected.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.humanpresencesensorreading.presence
     * @type {Integer} 
     */
    Presence {
        get => this.get_Presence()
    }

    /**
     * Gets whether a user is engaged with the device.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.humanpresencesensorreading.engagement
     * @type {Integer} 
     */
    Engagement {
        get => this.get_Engagement()
    }

    /**
     * Gets the distance between the [HumanPresenceSensor](humanpresencesensor.md) and the detected user.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.humanpresencesensorreading.distanceinmillimeters
     * @type {IReference<Integer>} 
     */
    DistanceInMillimeters {
        get => this.get_DistanceInMillimeters()
    }

    /**
     * Gets a collection of properties assigned to the reading.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.humanpresencesensorreading.properties
     * @type {IMapView<HSTRING, IInspectable>} 
     */
    Properties {
        get => this.get_Properties()
    }

    /**
     * Gets whether a person other than the primary user is detected and engaged with the device.
     * @remarks
     * Can be useful for addressing privacy concerns. For example, a user might want there screen to dim automatically when another person is detected.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.humanpresencesensorreading.onlookerpresence
     * @type {Integer} 
     */
    OnlookerPresence {
        get => this.get_OnlookerPresence()
    }

    /**
     * Gets a collection of all detected persons (primary user and otherwise).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.humanpresencesensorreading.detectedpersons
     * @type {IVectorView<DetectedPerson>} 
     */
    DetectedPersons {
        get => this.get_DetectedPersons()
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
        if (!this.HasProp("__IHumanPresenceSensorReading")) {
            if ((queryResult := this.QueryInterface(IHumanPresenceSensorReading.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHumanPresenceSensorReading := IHumanPresenceSensorReading(outPtr)
        }

        return this.__IHumanPresenceSensorReading.get_Timestamp()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Presence() {
        if (!this.HasProp("__IHumanPresenceSensorReading")) {
            if ((queryResult := this.QueryInterface(IHumanPresenceSensorReading.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHumanPresenceSensorReading := IHumanPresenceSensorReading(outPtr)
        }

        return this.__IHumanPresenceSensorReading.get_Presence()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Engagement() {
        if (!this.HasProp("__IHumanPresenceSensorReading")) {
            if ((queryResult := this.QueryInterface(IHumanPresenceSensorReading.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHumanPresenceSensorReading := IHumanPresenceSensorReading(outPtr)
        }

        return this.__IHumanPresenceSensorReading.get_Engagement()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_DistanceInMillimeters() {
        if (!this.HasProp("__IHumanPresenceSensorReading")) {
            if ((queryResult := this.QueryInterface(IHumanPresenceSensorReading.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHumanPresenceSensorReading := IHumanPresenceSensorReading(outPtr)
        }

        return this.__IHumanPresenceSensorReading.get_DistanceInMillimeters()
    }

    /**
     * 
     * @returns {IMapView<HSTRING, IInspectable>} 
     */
    get_Properties() {
        if (!this.HasProp("__IHumanPresenceSensorReading2")) {
            if ((queryResult := this.QueryInterface(IHumanPresenceSensorReading2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHumanPresenceSensorReading2 := IHumanPresenceSensorReading2(outPtr)
        }

        return this.__IHumanPresenceSensorReading2.get_Properties()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_OnlookerPresence() {
        if (!this.HasProp("__IHumanPresenceSensorReading3")) {
            if ((queryResult := this.QueryInterface(IHumanPresenceSensorReading3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHumanPresenceSensorReading3 := IHumanPresenceSensorReading3(outPtr)
        }

        return this.__IHumanPresenceSensorReading3.get_OnlookerPresence()
    }

    /**
     * 
     * @returns {IVectorView<DetectedPerson>} 
     */
    get_DetectedPersons() {
        if (!this.HasProp("__IHumanPresenceSensorReading3")) {
            if ((queryResult := this.QueryInterface(IHumanPresenceSensorReading3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHumanPresenceSensorReading3 := IHumanPresenceSensorReading3(outPtr)
        }

        return this.__IHumanPresenceSensorReading3.get_DetectedPersons()
    }

;@endregion Instance Methods
}

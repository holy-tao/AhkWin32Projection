#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHumanPresenceSensorReadingUpdate.ahk
#Include .\IHumanPresenceSensorReadingUpdate2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a single, updated reading from a [HumanPresenceSensor](humanpresencesensor.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.humanpresencesensorreadingupdate
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class HumanPresenceSensorReadingUpdate extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHumanPresenceSensorReadingUpdate

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHumanPresenceSensorReadingUpdate.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the time at which the sensor reported the reading.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.humanpresencesensorreadingupdate.timestamp
     * @type {IReference<DateTime>} 
     */
    Timestamp {
        get => this.get_Timestamp()
        set => this.put_Timestamp(value)
    }

    /**
     * Gets or sets whether a primary user is detected.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.humanpresencesensorreadingupdate.presence
     * @type {IReference<Integer>} 
     */
    Presence {
        get => this.get_Presence()
        set => this.put_Presence(value)
    }

    /**
     * Gets or sets whether a user is engaged with the device.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.humanpresencesensorreadingupdate.engagement
     * @type {IReference<Integer>} 
     */
    Engagement {
        get => this.get_Engagement()
        set => this.put_Engagement(value)
    }

    /**
     * Gets or sets the updated distance between the [HumanPresenceSensor](humanpresencesensor.md) and the detected user.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.humanpresencesensorreadingupdate.distanceinmillimeters
     * @type {IReference<Integer>} 
     */
    DistanceInMillimeters {
        get => this.get_DistanceInMillimeters()
        set => this.put_DistanceInMillimeters(value)
    }

    /**
     * Gets or sets whether an onlooker is detected.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.humanpresencesensorreadingupdate.onlookerpresence
     * @type {IReference<Integer>} 
     */
    OnlookerPresence {
        get => this.get_OnlookerPresence()
        set => this.put_OnlookerPresence(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of a [HumanPresenceSensorReadingUpdate](humanpresencesensorreadingupdate.md) object.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Devices.Sensors.HumanPresenceSensorReadingUpdate")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_Timestamp() {
        if (!this.HasProp("__IHumanPresenceSensorReadingUpdate")) {
            if ((queryResult := this.QueryInterface(IHumanPresenceSensorReadingUpdate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHumanPresenceSensorReadingUpdate := IHumanPresenceSensorReadingUpdate(outPtr)
        }

        return this.__IHumanPresenceSensorReadingUpdate.get_Timestamp()
    }

    /**
     * 
     * @param {IReference<DateTime>} value 
     * @returns {HRESULT} 
     */
    put_Timestamp(value) {
        if (!this.HasProp("__IHumanPresenceSensorReadingUpdate")) {
            if ((queryResult := this.QueryInterface(IHumanPresenceSensorReadingUpdate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHumanPresenceSensorReadingUpdate := IHumanPresenceSensorReadingUpdate(outPtr)
        }

        return this.__IHumanPresenceSensorReadingUpdate.put_Timestamp(value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_Presence() {
        if (!this.HasProp("__IHumanPresenceSensorReadingUpdate")) {
            if ((queryResult := this.QueryInterface(IHumanPresenceSensorReadingUpdate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHumanPresenceSensorReadingUpdate := IHumanPresenceSensorReadingUpdate(outPtr)
        }

        return this.__IHumanPresenceSensorReadingUpdate.get_Presence()
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_Presence(value) {
        if (!this.HasProp("__IHumanPresenceSensorReadingUpdate")) {
            if ((queryResult := this.QueryInterface(IHumanPresenceSensorReadingUpdate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHumanPresenceSensorReadingUpdate := IHumanPresenceSensorReadingUpdate(outPtr)
        }

        return this.__IHumanPresenceSensorReadingUpdate.put_Presence(value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_Engagement() {
        if (!this.HasProp("__IHumanPresenceSensorReadingUpdate")) {
            if ((queryResult := this.QueryInterface(IHumanPresenceSensorReadingUpdate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHumanPresenceSensorReadingUpdate := IHumanPresenceSensorReadingUpdate(outPtr)
        }

        return this.__IHumanPresenceSensorReadingUpdate.get_Engagement()
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_Engagement(value) {
        if (!this.HasProp("__IHumanPresenceSensorReadingUpdate")) {
            if ((queryResult := this.QueryInterface(IHumanPresenceSensorReadingUpdate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHumanPresenceSensorReadingUpdate := IHumanPresenceSensorReadingUpdate(outPtr)
        }

        return this.__IHumanPresenceSensorReadingUpdate.put_Engagement(value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_DistanceInMillimeters() {
        if (!this.HasProp("__IHumanPresenceSensorReadingUpdate")) {
            if ((queryResult := this.QueryInterface(IHumanPresenceSensorReadingUpdate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHumanPresenceSensorReadingUpdate := IHumanPresenceSensorReadingUpdate(outPtr)
        }

        return this.__IHumanPresenceSensorReadingUpdate.get_DistanceInMillimeters()
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_DistanceInMillimeters(value) {
        if (!this.HasProp("__IHumanPresenceSensorReadingUpdate")) {
            if ((queryResult := this.QueryInterface(IHumanPresenceSensorReadingUpdate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHumanPresenceSensorReadingUpdate := IHumanPresenceSensorReadingUpdate(outPtr)
        }

        return this.__IHumanPresenceSensorReadingUpdate.put_DistanceInMillimeters(value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_OnlookerPresence() {
        if (!this.HasProp("__IHumanPresenceSensorReadingUpdate2")) {
            if ((queryResult := this.QueryInterface(IHumanPresenceSensorReadingUpdate2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHumanPresenceSensorReadingUpdate2 := IHumanPresenceSensorReadingUpdate2(outPtr)
        }

        return this.__IHumanPresenceSensorReadingUpdate2.get_OnlookerPresence()
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_OnlookerPresence(value) {
        if (!this.HasProp("__IHumanPresenceSensorReadingUpdate2")) {
            if ((queryResult := this.QueryInterface(IHumanPresenceSensorReadingUpdate2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHumanPresenceSensorReadingUpdate2 := IHumanPresenceSensorReadingUpdate2(outPtr)
        }

        return this.__IHumanPresenceSensorReadingUpdate2.put_OnlookerPresence(value)
    }

;@endregion Instance Methods
}

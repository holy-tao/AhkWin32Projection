#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGeofence.ahk
#Include .\IGeofenceFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Contains the functionality to define a geofence (a geographical area of interest) to monitor.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geofencing.geofence
 * @namespace Windows.Devices.Geolocation.Geofencing
 * @version WindowsRuntime 1.4
 */
class Geofence extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGeofence

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGeofence.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes a new [Geofence](geofence.md) object given the *id* and the shape of the geofence.
     * @remarks
     * When this constructor is used, the [MonitoredStates](geofence_monitoredstates.md) property defaults to monitor both the `MonitoredGeofenceStates.Entered` and `MonitoredGeofenceStates.Exited` flags, [SingleUse](geofence_singleuse.md) defaults to false, [DwellTime](geofence_dwelltime.md) defaults to 10 seconds, [StartTime](geofence_starttime.md) defaults to 0 (meaning start immediately), and [Duration](geofence_duration.md) defaults to 0, meaning forever.
     * 
     * The *id* value must be non-null and less than 64 characters.
     * 
     * The *geoshape* parameter must be a non-null [Geocircle](../windows.devices.geolocation/geocircle.md) with a [SpatialReferenceId](../windows.devices.geolocation/igeoshape_spatialreferenceid.md) that matches the platform or an exception will be thrown.
     * @param {HSTRING} id The Id of the geofence.
     * @param {IGeoshape} geoshape The area that defines the geofence to monitor.
     * @returns {Geofence} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geofencing.geofence.#ctor
     */
    static Create(id, geoshape) {
        if (!Geofence.HasProp("__IGeofenceFactory")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Geolocation.Geofencing.Geofence")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGeofenceFactory.IID)
            Geofence.__IGeofenceFactory := IGeofenceFactory(factoryPtr)
        }

        return Geofence.__IGeofenceFactory.Create(id, geoshape)
    }

    /**
     * Initializes a new [Geofence](geofence.md) object given the *id*, the shape of the geofence, the states to monitor the geofence for, and the *singleUse* flag.
     * @param {HSTRING} id The Id of the geofence.
     * @param {IGeoshape} geoshape The area that defines the geofence to monitor.
     * @param {Integer} monitoredStates The states to monitor the geofence for.
     * @param {Boolean} singleUse True indicates the geofence should be monitored only for one use. False indicates the geofence should be monitored for multiple uses.
     * @returns {Geofence} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geofencing.geofence.#ctor
     */
    static CreateWithMonitorStates(id, geoshape, monitoredStates, singleUse) {
        if (!Geofence.HasProp("__IGeofenceFactory")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Geolocation.Geofencing.Geofence")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGeofenceFactory.IID)
            Geofence.__IGeofenceFactory := IGeofenceFactory(factoryPtr)
        }

        return Geofence.__IGeofenceFactory.CreateWithMonitorStates(id, geoshape, monitoredStates, singleUse)
    }

    /**
     * Initializes a new [Geofence](geofence.md) object given the *id*, the shape of the geofence, the states to monitor the geofence for, the *singleUse* flag, and the *dwellTime* for the geofence.
     * @param {HSTRING} id The Id of the geofence.
     * @param {IGeoshape} geoshape The area that defines the geofence to monitor.
     * @param {Integer} monitoredStates The states to monitor the geofence for.
     * @param {Boolean} singleUse True indicates the geofence should be monitored only for one use. False indicates the geofence should be monitored for multiple uses.
     * @param {TimeSpan} dwellTime The time that a position has to be in or out of the geofence in order for the notification to be triggered. This object must represent a positive value.
     * @returns {Geofence} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geofencing.geofence.#ctor
     */
    static CreateWithMonitorStatesAndDwellTime(id, geoshape, monitoredStates, singleUse, dwellTime) {
        if (!Geofence.HasProp("__IGeofenceFactory")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Geolocation.Geofencing.Geofence")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGeofenceFactory.IID)
            Geofence.__IGeofenceFactory := IGeofenceFactory(factoryPtr)
        }

        return Geofence.__IGeofenceFactory.CreateWithMonitorStatesAndDwellTime(id, geoshape, monitoredStates, singleUse, dwellTime)
    }

    /**
     * Initializes a new [Geofence](geofence.md) object given the *id*, the shape of the geofence, the states to monitor the geofence for, the *singleUse* flag, the *dwellTime* for the geofence, the time to start monitoring the geofence, and the *duration* of the geofence.
     * @remarks
     * You must specify the `MonitoredGeofenceStates.Entered` or `MonitoredGeofenceStates.Exited` flags, or both, for a geofence to be monitored. It is not possible to create a geofence that only monitors the `MonitoredGeofenceStates.Removed` flag.
     * 
     * The *id* value must be non-null and less than 64 characters.
     * 
     * The *geoshape* parameter must be a non-null [Geocircle](../windows.devices.geolocation/geocircle.md) with a [SpatialReferenceId](../windows.devices.geolocation/igeoshape_spatialreferenceid.md) that matches the platform or an exception will be thrown.
     * 
     * If the expiration date for the geofence - which is the start time plus the duration time span - occurs sooner than the creation time plus the dwell time value, an exception will be thrown.
     * @param {HSTRING} id The Id of the geofence.
     * @param {IGeoshape} geoshape The area that defines the geofence to monitor.
     * @param {Integer} monitoredStates The states to monitor the geofence for.
     * @param {Boolean} singleUse True indicates the geofence should be monitored only for one use. False indicates the geofence should be monitored for multiple uses.
     * @param {TimeSpan} dwellTime The time that a position has to be in or out of the geofence in order for the notification to be triggered. This object must represent a positive value.
     * @param {DateTime} startTime The time to start monitoring the geofence.
     * @param {TimeSpan} duration_ The duration of time to monitor the geofence for. The duration begins at the *startTime*. This object must represent a positive value.
     * @returns {Geofence} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geofencing.geofence.#ctor
     */
    static CreateWithMonitorStatesDwellTimeStartTimeAndDuration(id, geoshape, monitoredStates, singleUse, dwellTime, startTime, duration_) {
        if (!Geofence.HasProp("__IGeofenceFactory")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Geolocation.Geofencing.Geofence")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGeofenceFactory.IID)
            Geofence.__IGeofenceFactory := IGeofenceFactory(factoryPtr)
        }

        return Geofence.__IGeofenceFactory.CreateWithMonitorStatesDwellTimeStartTimeAndDuration(id, geoshape, monitoredStates, singleUse, dwellTime, startTime, duration_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * The time to start monitoring the [Geofence](geofence.md).
     * @remarks
     * A geofence is made active when the StartTime is in the past. If the device is within the geofence's area when it becomes active and the geofence is being monitored for the `MonitoredGeofenceStates.Entered` flag, then the geofence triggers as soon as the [DwellTime](geofence_dwelltime.md) requirement has been met. However, if the device is outside the geofence when it becomes active, the geofence does not instantly switch to the `MonitoredGeofenceStates.Exited` flag. The device must enter a geofence, remain inside for the specified [DwellTime](geofence_dwelltime.md), and then exit in order to switch to the `MonitoredGeofenceStates.Exited` flag.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geofencing.geofence.starttime
     * @type {DateTime} 
     */
    StartTime {
        get => this.get_StartTime()
    }

    /**
     * Gets the time window, beginning after the [StartTime](geofence_starttime.md), during which the [Geofence](geofence.md) is monitored.
     * @remarks
     * This property is read-only. Use one of the overloaded [Geofence](geofence.md) constructors to set the duration value.
     * 
     * When the duration time window expires, the system automatically removes the geofence from the system and stops monitoring it. If you want your app to be notified when a geofence expires, include the `GeofenceState.Removed` state when initializing the geofence.
     * 
     * The default value for this property is a [TimeSpan](../windows.foundation/timespan.md) with a time interval of 0. A time interval of 0 indicates that the geofence will not expire and will be monitored indefinitely or until the app manually removes the geofence.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geofencing.geofence.duration
     * @type {TimeSpan} 
     */
    Duration {
        get => this.get_Duration()
    }

    /**
     * The minimum time that a position has to be inside or outside of the [Geofence](geofence.md) in order for the notification to be triggered.
     * @remarks
     * When creating geofences that use a dwell time, the time span must be greater than 0.
     * 
     * The `DwellTime` value is used for monitoring both the `MonitoredGeofenceStates.Entered` and `MonitoredGeofenceStates.Exited` flags of a single geofence. If you want to provide different dwell time values for entering and exiting, create two [Geofence](geofence.md) objects—one to track the `MonitoredGeofenceStates.Entered` state and another to track the `MonitoredGeofenceStates.Exited` state. Then you can specify a different dwell time for each object.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geofencing.geofence.dwelltime
     * @type {TimeSpan} 
     */
    DwellTime {
        get => this.get_DwellTime()
    }

    /**
     * The id of the [Geofence](geofence.md).
     * @remarks
     * The *Id* is limited in length to 63 characters.
     * 
     * The *Id* value must be unique among all geofences associated with the same application and user.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geofencing.geofence.id
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * Indicates the states that the [Geofence](geofence.md) is being monitored for.
     * @remarks
     * You must specify the `MonitoredGeofenceStates.Entered` or `MonitoredGeofenceStates.Exited` flags, or both, for a geofence to be monitored. It is not possible to create a geofence that only monitors the `MonitoredGeofenceStates.Removed` flag.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geofencing.geofence.monitoredstates
     * @type {Integer} 
     */
    MonitoredStates {
        get => this.get_MonitoredStates()
    }

    /**
     * The shape of the geofence region.
     * @remarks
     * This property is read-only. You must set the shape of a geofence when you initialize it using one of the constructors.
     * 
     * The type of this property, [IGeoshape](../windows.devices.geolocation/igeoshape.md), is an interface to enable the possibility of supporting multiple shapes for geofences. The only shape that is currently supported is [Geocircle](../windows.devices.geolocation/geocircle.md), so this is the class you should use when initializing your geofences.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geofencing.geofence.geoshape
     * @type {IGeoshape} 
     */
    Geoshape {
        get => this.get_Geoshape()
    }

    /**
     * Indicates whether the [Geofence](geofence.md) should be triggered once or multiple times.
     * @remarks
     * A geofence is considered used when all [MonitoredStates](geofence_monitoredstates.md) have been triggered. If a geofence is only being monitored for the `MonitoredGeofenceStates.Entered` event and `SingleUse` is set to `true`, then entering the geofence marks it as used and it is removed. If a geofence is monitored for both the `MonitoredGeofenceStates.Entered` and `MonitoredGeofenceStates.Exited` events and `SingleUse` is set to `true`, then the geofence is removed after the user has both entered and exited the geofence.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geofencing.geofence.singleuse
     * @type {Boolean} 
     */
    SingleUse {
        get => this.get_SingleUse()
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
    get_StartTime() {
        if (!this.HasProp("__IGeofence")) {
            if ((queryResult := this.QueryInterface(IGeofence.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeofence := IGeofence(outPtr)
        }

        return this.__IGeofence.get_StartTime()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_Duration() {
        if (!this.HasProp("__IGeofence")) {
            if ((queryResult := this.QueryInterface(IGeofence.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeofence := IGeofence(outPtr)
        }

        return this.__IGeofence.get_Duration()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_DwellTime() {
        if (!this.HasProp("__IGeofence")) {
            if ((queryResult := this.QueryInterface(IGeofence.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeofence := IGeofence(outPtr)
        }

        return this.__IGeofence.get_DwellTime()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        if (!this.HasProp("__IGeofence")) {
            if ((queryResult := this.QueryInterface(IGeofence.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeofence := IGeofence(outPtr)
        }

        return this.__IGeofence.get_Id()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MonitoredStates() {
        if (!this.HasProp("__IGeofence")) {
            if ((queryResult := this.QueryInterface(IGeofence.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeofence := IGeofence(outPtr)
        }

        return this.__IGeofence.get_MonitoredStates()
    }

    /**
     * 
     * @returns {IGeoshape} 
     */
    get_Geoshape() {
        if (!this.HasProp("__IGeofence")) {
            if ((queryResult := this.QueryInterface(IGeofence.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeofence := IGeofence(outPtr)
        }

        return this.__IGeofence.get_Geoshape()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_SingleUse() {
        if (!this.HasProp("__IGeofence")) {
            if ((queryResult := this.QueryInterface(IGeofence.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeofence := IGeofence(outPtr)
        }

        return this.__IGeofence.get_SingleUse()
    }

;@endregion Instance Methods
}

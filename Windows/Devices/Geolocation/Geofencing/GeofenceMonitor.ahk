#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGeofenceMonitor.ahk
#Include .\IGeofenceMonitorStatics.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\GeofenceMonitor.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Contains the information about the monitored [Geofence](geofence.md) objects.
 * @remarks
 * Use the static [Current](geofencemonitor_current.md) property to get the `GeofenceMonitor` object which contains all of an app's geofence information.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geofencing.geofencemonitor
 * @namespace Windows.Devices.Geolocation.Geofencing
 * @version WindowsRuntime 1.4
 */
class GeofenceMonitor extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGeofenceMonitor

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGeofenceMonitor.IID

    /**
     * Gets the [GeofenceMonitor](geofencemonitor.md) object which contains all of an app's [Geofence](geofence.md) information.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geofencing.geofencemonitor.current
     * @type {GeofenceMonitor} 
     */
    static Current {
        get => GeofenceMonitor.get_Current()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {GeofenceMonitor} 
     */
    static get_Current() {
        if (!GeofenceMonitor.HasProp("__IGeofenceMonitorStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Geolocation.Geofencing.GeofenceMonitor")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGeofenceMonitorStatics.IID)
            GeofenceMonitor.__IGeofenceMonitorStatics := IGeofenceMonitorStatics(factoryPtr)
        }

        return GeofenceMonitor.__IGeofenceMonitorStatics.get_Current()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Indicates the current state of the [GeofenceMonitor](geofencemonitor.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geofencing.geofencemonitor.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * Returns a vector of the app's [Geofence](geofence.md) objects currently registered with the system-wide [GeofenceMonitor](geofencemonitor.md).
     * @remarks
     * Register a [Geofence](geofence.md) to be monitored by the system by adding it to this collection.
     * 
     * Geofences are persisted to disk, so they only need to be added to the system once. Attempting to add a [Geofence](geofence.md) with an [Id](geofence_id.md) that is already registered will throw an exception.
     * 
     * Attempting to remove a [Geofence](geofence.md) from the Geofences property will fail with an exception if the specified [Geofence](geofence.md) is registered with the system but does not belong to the calling application's collection.
     * 
     * This vector reflects only updates made by the app. To view changes made by the system, as in after a single-use [Geofence](geofence.md) is triggered and removed, the app can call this property again or safely remove the removed [Geofence](geofence.md) from a previously returned vector.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geofencing.geofencemonitor.geofences
     * @type {IVector<Geofence>} 
     */
    Geofences {
        get => this.get_Geofences()
    }

    /**
     * Last reading of the device's location.
     * @remarks
     * Before using the value from this property, the application must first check that the value is not `null`.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geofencing.geofencemonitor.lastknowngeoposition
     * @type {Geoposition} 
     */
    LastKnownGeoposition {
        get => this.get_LastKnownGeoposition()
    }

    /**
     * Raised when the state of one or more [Geofence](geofence.md) objects in the [Geofences](geofencemonitor_geofences.md) collection of the [GeofenceMonitor](geofencemonitor.md) has changed.
     * @remarks
     * This event is raised when your app is running and the state of a geofence registered by your app changes. This event is also raised when your app activates if there are unread reports in the collection obtained by calling [ReadReports](geofencemonitor_readreports_231406138.md). This allows an app that is coming back from being suspended to be notified that there are unread reports in the queue and update the UI accordingly. This also allows your app to read reports that occurred in the background in cases where your background task was not launched to due to conditions set with [SystemCondition](../windows.applicationmodel.background/systemcondition.md), such as waiting for an internet connection or waiting for the user to be present.
     * @type {TypedEventHandler<GeofenceMonitor, IInspectable>}
    */
    OnGeofenceStateChanged {
        get {
            if(!this.HasProp("__OnGeofenceStateChanged")){
                this.__OnGeofenceStateChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{ecc5af2c-e47a-59ce-86be-9c3066fe26f7}"),
                    GeofenceMonitor,
                    IInspectable
                )
                this.__OnGeofenceStateChangedToken := this.add_GeofenceStateChanged(this.__OnGeofenceStateChanged.iface)
            }
            return this.__OnGeofenceStateChanged
        }
    }

    /**
     * Raised when the status of the [GeofenceMonitor](geofencemonitor.md) has changed.
     * @remarks
     * When using a geofence, use the [GeofenceMonitor](geofencemonitor.md) StatusChanged event to monitor changes in location permissions instead of the [StatusChanged](../windows.devices.geolocation/geolocator_statuschanged.md) event from the [Geolocator](../windows.devices.geolocation/geolocator.md) class. A [GeofenceMonitorStatus](geofencemonitorstatus.md) value of `GeofenceMonitorStatus.Disabled` is equivalent to the `PositionStatus.Disabled` value exposed by [Geolocator](../windows.devices.geolocation/geolocator.md); both indicate that the app does not have permission to access the location.
     * @type {TypedEventHandler<GeofenceMonitor, IInspectable>}
    */
    OnStatusChanged {
        get {
            if(!this.HasProp("__OnStatusChanged")){
                this.__OnStatusChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{ecc5af2c-e47a-59ce-86be-9c3066fe26f7}"),
                    GeofenceMonitor,
                    IInspectable
                )
                this.__OnStatusChangedToken := this.add_StatusChanged(this.__OnStatusChanged.iface)
            }
            return this.__OnStatusChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnGeofenceStateChangedToken")) {
            this.remove_GeofenceStateChanged(this.__OnGeofenceStateChangedToken)
            this.__OnGeofenceStateChanged.iface.Dispose()
        }

        if(this.HasProp("__OnStatusChangedToken")) {
            this.remove_StatusChanged(this.__OnStatusChangedToken)
            this.__OnStatusChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__IGeofenceMonitor")) {
            if ((queryResult := this.QueryInterface(IGeofenceMonitor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeofenceMonitor := IGeofenceMonitor(outPtr)
        }

        return this.__IGeofenceMonitor.get_Status()
    }

    /**
     * 
     * @returns {IVector<Geofence>} 
     */
    get_Geofences() {
        if (!this.HasProp("__IGeofenceMonitor")) {
            if ((queryResult := this.QueryInterface(IGeofenceMonitor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeofenceMonitor := IGeofenceMonitor(outPtr)
        }

        return this.__IGeofenceMonitor.get_Geofences()
    }

    /**
     * 
     * @returns {Geoposition} 
     */
    get_LastKnownGeoposition() {
        if (!this.HasProp("__IGeofenceMonitor")) {
            if ((queryResult := this.QueryInterface(IGeofenceMonitor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeofenceMonitor := IGeofenceMonitor(outPtr)
        }

        return this.__IGeofenceMonitor.get_LastKnownGeoposition()
    }

    /**
     * 
     * @param {TypedEventHandler<GeofenceMonitor, IInspectable>} eventHandler 
     * @returns {EventRegistrationToken} 
     */
    add_GeofenceStateChanged(eventHandler) {
        if (!this.HasProp("__IGeofenceMonitor")) {
            if ((queryResult := this.QueryInterface(IGeofenceMonitor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeofenceMonitor := IGeofenceMonitor(outPtr)
        }

        return this.__IGeofenceMonitor.add_GeofenceStateChanged(eventHandler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_GeofenceStateChanged(token) {
        if (!this.HasProp("__IGeofenceMonitor")) {
            if ((queryResult := this.QueryInterface(IGeofenceMonitor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeofenceMonitor := IGeofenceMonitor(outPtr)
        }

        return this.__IGeofenceMonitor.remove_GeofenceStateChanged(token)
    }

    /**
     * Gets a collection of status changes to the [Geofence](geofence.md) objects in the [Geofences](geofencemonitor_geofences.md) collection of the [GeofenceMonitor](geofencemonitor.md).
     * @remarks
     * Each report in the collection contains the most recent state for the geofences that changed state since the last time `ReadReports` was called. Older state changes may be present in the collection if `ReadReports` hasn't been called over a period of time when many geofence state changes have occurred, but the system may purge these older state changes.
     * 
     * The collection returned from this method may be empty and contain no [GeofenceStateChangeReport](geofencestatechangereport.md) objects. This can happen if no status changes have occurred since the last time the method was called, either by the app or the background task.
     * @returns {IVectorView<GeofenceStateChangeReport>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geofencing.geofencemonitor.readreports
     */
    ReadReports() {
        if (!this.HasProp("__IGeofenceMonitor")) {
            if ((queryResult := this.QueryInterface(IGeofenceMonitor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeofenceMonitor := IGeofenceMonitor(outPtr)
        }

        return this.__IGeofenceMonitor.ReadReports()
    }

    /**
     * 
     * @param {TypedEventHandler<GeofenceMonitor, IInspectable>} eventHandler 
     * @returns {EventRegistrationToken} 
     */
    add_StatusChanged(eventHandler) {
        if (!this.HasProp("__IGeofenceMonitor")) {
            if ((queryResult := this.QueryInterface(IGeofenceMonitor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeofenceMonitor := IGeofenceMonitor(outPtr)
        }

        return this.__IGeofenceMonitor.add_StatusChanged(eventHandler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_StatusChanged(token) {
        if (!this.HasProp("__IGeofenceMonitor")) {
            if ((queryResult := this.QueryInterface(IGeofenceMonitor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeofenceMonitor := IGeofenceMonitor(outPtr)
        }

        return this.__IGeofenceMonitor.remove_StatusChanged(token)
    }

;@endregion Instance Methods
}

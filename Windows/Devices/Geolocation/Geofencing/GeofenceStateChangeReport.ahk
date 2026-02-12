#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGeofenceStateChangeReport.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Contains the information about the state changes for a [Geofence](geofence.md).
 * @remarks
 * Use the [GeofenceMonitor.ReadReports](geofencemonitor_readreports_231406138.md) method to get a collection of GeofenceStateChangeReport objects which contain information about changes in state to a geofence.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geofencing.geofencestatechangereport
 * @namespace Windows.Devices.Geolocation.Geofencing
 * @version WindowsRuntime 1.4
 */
class GeofenceStateChangeReport extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGeofenceStateChangeReport

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGeofenceStateChangeReport.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The new state of the [Geofence](geofence.md) object whose state has changed.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geofencing.geofencestatechangereport.newstate
     * @type {Integer} 
     */
    NewState {
        get => this.get_NewState()
    }

    /**
     * The [Geofence](geofence.md) object whose state has changed.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geofencing.geofencestatechangereport.geofence
     * @type {Geofence} 
     */
    Geofence {
        get => this.get_Geofence()
    }

    /**
     * The position of the [Geofence](geofence.md) object whose state has changed.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geofencing.geofencestatechangereport.geoposition
     * @type {Geoposition} 
     */
    Geoposition {
        get => this.get_Geoposition()
    }

    /**
     * Indicates the reason a [Geofence](geofence.md) was removed.
     * @remarks
     * This property defaults to `GeofenceRemovalReason.Used`. Ignore this property unless the geofence state has changed to `GeofenceState.Removed`.
     * 
     * Removal event notifications can happen when the app is in the foreground or the background. However, removal events themselves do not fire the trigger when the app is in the background. This means that background apps cannot use the removal event to wake up the app. When an app comes back from being in the background, it can see the removal event that occurred waiting in the [GeofenceStateChangeReport](geofencestatechangereport.md) collection.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geofencing.geofencestatechangereport.removalreason
     * @type {Integer} 
     */
    RemovalReason {
        get => this.get_RemovalReason()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NewState() {
        if (!this.HasProp("__IGeofenceStateChangeReport")) {
            if ((queryResult := this.QueryInterface(IGeofenceStateChangeReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeofenceStateChangeReport := IGeofenceStateChangeReport(outPtr)
        }

        return this.__IGeofenceStateChangeReport.get_NewState()
    }

    /**
     * 
     * @returns {Geofence} 
     */
    get_Geofence() {
        if (!this.HasProp("__IGeofenceStateChangeReport")) {
            if ((queryResult := this.QueryInterface(IGeofenceStateChangeReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeofenceStateChangeReport := IGeofenceStateChangeReport(outPtr)
        }

        return this.__IGeofenceStateChangeReport.get_Geofence()
    }

    /**
     * 
     * @returns {Geoposition} 
     */
    get_Geoposition() {
        if (!this.HasProp("__IGeofenceStateChangeReport")) {
            if ((queryResult := this.QueryInterface(IGeofenceStateChangeReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeofenceStateChangeReport := IGeofenceStateChangeReport(outPtr)
        }

        return this.__IGeofenceStateChangeReport.get_Geoposition()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RemovalReason() {
        if (!this.HasProp("__IGeofenceStateChangeReport")) {
            if ((queryResult := this.QueryInterface(IGeofenceStateChangeReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeofenceStateChangeReport := IGeofenceStateChangeReport(outPtr)
        }

        return this.__IGeofenceStateChangeReport.get_RemovalReason()
    }

;@endregion Instance Methods
}

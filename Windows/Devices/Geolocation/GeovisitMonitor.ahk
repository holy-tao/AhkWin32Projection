#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGeovisitMonitor.ahk
#Include .\IGeovisitMonitorStatics.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\GeovisitMonitor.ahk
#Include .\GeovisitStateChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Handles the monitoring of a user's visits when the app is in use (not in the background).
 * @remarks
 * The `GeovisitMonitor` class tracks visit state changes while your app runs in the foreground. Background visit monitoring relies on triggers that continue working even when your app is suspended.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geovisitmonitor
 * @namespace Windows.Devices.Geolocation
 * @version WindowsRuntime 1.4
 */
class GeovisitMonitor extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGeovisitMonitor

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGeovisitMonitor.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Retrieves the latest Visit-related event the user has completed.
     * @remarks
     * This method allows you to get the most recent visit information without having to wait for new visit events to occur. The returned visit represents the last completed visit state change.
     * @returns {IAsyncOperation<Geovisit>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geovisitmonitor.getlastreportasync
     */
    static GetLastReportAsync() {
        if (!GeovisitMonitor.HasProp("__IGeovisitMonitorStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Geolocation.GeovisitMonitor")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGeovisitMonitorStatics.IID)
            GeovisitMonitor.__IGeovisitMonitorStatics := IGeovisitMonitorStatics(factoryPtr)
        }

        return GeovisitMonitor.__IGeovisitMonitorStatics.GetLastReportAsync()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the scope of visits to monitor.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geovisitmonitor.monitoringscope
     * @type {Integer} 
     */
    MonitoringScope {
        get => this.get_MonitoringScope()
    }

    /**
     * Raised when the user's current visit state has changed, provided this [GeovisitMonitor](geovisitmonitor.md) is currently monitoring.
     * @remarks
     * This event is triggered when the system detects that the user has entered or left a significant location. The event provides information about the visit through the [GeovisitStateChangedEventArgs](geovisitstatechangedeventargs.md) parameter.
     * @type {TypedEventHandler<GeovisitMonitor, GeovisitStateChangedEventArgs>}
    */
    OnVisitStateChanged {
        get {
            if(!this.HasProp("__OnVisitStateChanged")){
                this.__OnVisitStateChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{76abc5ea-ee4f-5391-9b50-deca5d4311c9}"),
                    GeovisitMonitor,
                    GeovisitStateChangedEventArgs
                )
                this.__OnVisitStateChangedToken := this.add_VisitStateChanged(this.__OnVisitStateChanged.iface)
            }
            return this.__OnVisitStateChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes an instance of [GeovisitMonitor](geovisitmonitor.md).
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Devices.Geolocation.GeovisitMonitor")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnVisitStateChangedToken")) {
            this.remove_VisitStateChanged(this.__OnVisitStateChangedToken)
            this.__OnVisitStateChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MonitoringScope() {
        if (!this.HasProp("__IGeovisitMonitor")) {
            if ((queryResult := this.QueryInterface(IGeovisitMonitor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeovisitMonitor := IGeovisitMonitor(outPtr)
        }

        return this.__IGeovisitMonitor.get_MonitoringScope()
    }

    /**
     * Begins monitoring for Visit-related events.
     * @param {Integer} value A [VisitMonitoringScope](visitmonitoringscope.md) value representing the desired scope of location changes to monitor.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geovisitmonitor.start
     */
    Start(value) {
        if (!this.HasProp("__IGeovisitMonitor")) {
            if ((queryResult := this.QueryInterface(IGeovisitMonitor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeovisitMonitor := IGeovisitMonitor(outPtr)
        }

        return this.__IGeovisitMonitor.Start(value)
    }

    /**
     * Stops monitoring for Visit-related events.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geovisitmonitor.stop
     */
    Stop() {
        if (!this.HasProp("__IGeovisitMonitor")) {
            if ((queryResult := this.QueryInterface(IGeovisitMonitor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeovisitMonitor := IGeovisitMonitor(outPtr)
        }

        return this.__IGeovisitMonitor.Stop()
    }

    /**
     * 
     * @param {TypedEventHandler<GeovisitMonitor, GeovisitStateChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_VisitStateChanged(handler) {
        if (!this.HasProp("__IGeovisitMonitor")) {
            if ((queryResult := this.QueryInterface(IGeovisitMonitor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeovisitMonitor := IGeovisitMonitor(outPtr)
        }

        return this.__IGeovisitMonitor.add_VisitStateChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_VisitStateChanged(token) {
        if (!this.HasProp("__IGeovisitMonitor")) {
            if ((queryResult := this.QueryInterface(IGeovisitMonitor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeovisitMonitor := IGeovisitMonitor(outPtr)
        }

        return this.__IGeovisitMonitor.remove_VisitStateChanged(token)
    }

;@endregion Instance Methods
}

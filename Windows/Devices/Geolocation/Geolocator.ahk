#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGeolocator.ahk
#Include .\IGeolocatorWithScalarAccuracy.ahk
#Include .\IGeolocator2.ahk
#Include .\IGeolocatorStatics2.ahk
#Include .\IGeolocatorStatics.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\Geolocator.ahk
#Include .\PositionChangedEventArgs.ahk
#Include .\StatusChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Provides access to the current geographic location.
 * @remarks
 * The [Geolocator](geolocator.md) class is the primary entry point for accessing location data in Windows applications.
 * It provides both one-time location requests and continuous location tracking through events.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geolocator
 * @namespace Windows.Devices.Geolocation
 * @version WindowsRuntime 1.4
 */
class Geolocator extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGeolocator

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGeolocator.IID

    /**
     * Indicates whether the user should be prompted to set a default location manually.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geolocator.isdefaultgeopositionrecommended
     * @type {Boolean} 
     */
    static IsDefaultGeopositionRecommended {
        get => Geolocator.get_IsDefaultGeopositionRecommended()
    }

    /**
     * Gets the location manually entered into the system by the user, to be utilized if no better options exist.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geolocator.defaultgeoposition
     * @type {IReference<BasicGeoposition>} 
     */
    static DefaultGeoposition {
        get => Geolocator.get_DefaultGeoposition()
        set => Geolocator.put_DefaultGeoposition(value)
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {Boolean} 
     */
    static get_IsDefaultGeopositionRecommended() {
        if (!Geolocator.HasProp("__IGeolocatorStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Geolocation.Geolocator")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGeolocatorStatics2.IID)
            Geolocator.__IGeolocatorStatics2 := IGeolocatorStatics2(factoryPtr)
        }

        return Geolocator.__IGeolocatorStatics2.get_IsDefaultGeopositionRecommended()
    }

    /**
     * 
     * @param {IReference<BasicGeoposition>} value 
     * @returns {HRESULT} 
     */
    static put_DefaultGeoposition(value) {
        if (!Geolocator.HasProp("__IGeolocatorStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Geolocation.Geolocator")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGeolocatorStatics2.IID)
            Geolocator.__IGeolocatorStatics2 := IGeolocatorStatics2(factoryPtr)
        }

        return Geolocator.__IGeolocatorStatics2.put_DefaultGeoposition(value)
    }

    /**
     * 
     * @returns {IReference<BasicGeoposition>} 
     */
    static get_DefaultGeoposition() {
        if (!Geolocator.HasProp("__IGeolocatorStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Geolocation.Geolocator")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGeolocatorStatics2.IID)
            Geolocator.__IGeolocatorStatics2 := IGeolocatorStatics2(factoryPtr)
        }

        return Geolocator.__IGeolocatorStatics2.get_DefaultGeoposition()
    }

    /**
     * Requests permission to access location data.
     * 
     * > [!IMPORTANT]
     * > Location consent is now required for Wi-Fi BSSID access. For details on how this affects apps using Wi-Fi or location APIs,
     * > see [Changes to API behavior for Wi-Fi access and location](/windows/win32/nativewifi/wi-fi-access-location-changes).
     * @remarks
     * Call RequestAccessAsync before accessing the user's location. At that time, your app must be in the foreground and
     * RequestAccessAsync must be called from the UI thread. Until the user grants your app permission to their location, your
     * app can't access location data.
     * 
     * You must call this method on the UI thread, otherwise an exception will occur.
     * 
     * When you first call this method, it prompts the user to give permission. The prompt is displayed for each app (per app).
     * After the first time they grant or deny permission, this method no longer prompts for permission. Provide an in-app link
     * to the device's location privacy settings so users can revisit their choice later. When the user has given the app any
     * level of location permission, your app can work as intended.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geolocator.requestaccessasync
     */
    static RequestAccessAsync() {
        if (!Geolocator.HasProp("__IGeolocatorStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Geolocation.Geolocator")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGeolocatorStatics.IID)
            Geolocator.__IGeolocatorStatics := IGeolocatorStatics(factoryPtr)
        }

        return Geolocator.__IGeolocatorStatics.RequestAccessAsync()
    }

    /**
     * > [!IMPORTANT]
     * > The `Geolocator.GetGeopositionHistoryAsync` method is deprecated as of SDK version 10.0.26100.3037 and will be removed entirely in a future version.
     * 
     * Starts an asynchronous operation to retrieve the location history of the device.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @remarks
     * Only positions that were collected during the specified *duration* after *startTime* will be returned.
     * @param {DateTime} startTime Represents the beginning of the time span for which positions are to be returned.
     * @returns {IAsyncOperation<IVectorView<Geoposition>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geolocator.getgeopositionhistoryasync
     */
    static GetGeopositionHistoryAsync(startTime) {
        if (!Geolocator.HasProp("__IGeolocatorStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Geolocation.Geolocator")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGeolocatorStatics.IID)
            Geolocator.__IGeolocatorStatics := IGeolocatorStatics(factoryPtr)
        }

        return Geolocator.__IGeolocatorStatics.GetGeopositionHistoryAsync(startTime)
    }

    /**
     * > [!IMPORTANT]
     * > The `Geolocator.GetGeopositionHistoryAsync` method is deprecated as of SDK version 26100.3037 and will be removed
     * > entirely in a future version.
     * 
     * Starts an asynchronous operation to retrieve the location history of the device.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @remarks
     * The GetGeopositionHistoryAsync method allows your app to asynchronously fetch a list of positions that have been
     * collected by location services. Only positions that have been collected since the specified *startTime* will be returned.
     * If no positions are available from that time span, an empty list will be returned.
     * 
     * This method returns only positions that have already been collected by location services in the last 24 hours; it does
     * not resolve new positions. Specifying a time span that exceeds this 24-hour window will not yield any additional
     * positions.
     * 
     * Location services collects positions only when an app or services queries for the user's location - but no more than once
     * per second. Location history is limited to 3600 positions; if location history isn't cleared by the user, each position
     * will be stored in location history between 1 and 24 hours.
     * 
     * > [!TIP]
     * > If you use a background task to call this method frequently, it's important to consider the impact that will have on the
     * > battery. Although this method doesn't activate the GNSS receiver, processor resources are still required to run the
     * > background task.
     * @param {DateTime} startTime Represents the beginning of the time span for which positions are to be returned.
     * @param {TimeSpan} duration_ 
     * @returns {IAsyncOperation<IVectorView<Geoposition>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geolocator.getgeopositionhistoryasync
     */
    static GetGeopositionHistoryWithDurationAsync(startTime, duration_) {
        if (!Geolocator.HasProp("__IGeolocatorStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Geolocation.Geolocator")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGeolocatorStatics.IID)
            Geolocator.__IGeolocatorStatics := IGeolocatorStatics(factoryPtr)
        }

        return Geolocator.__IGeolocatorStatics.GetGeopositionHistoryWithDurationAsync(startTime, duration_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * The accuracy level at which the [Geolocator](geolocator.md) provides location updates.
     * @remarks
     * Set `DesiredAccuracy` to `High` only if your application requires the most accurate data available. Set
     * `DesiredAccuracy` to `Default` to optimize for power.
     * 
     * 
     * 
     * > [!NOTE]
     * > Some hardware may not support high accuracy location data. If your app attempts to set accuracy to a value that's
     * > not supported, accuracy will be set to the limit that the hardware supports. Therefore, setting the `DesiredAccuracy`
     * > property is not guaranteed to have an effect on the accuracy of data.
     * 
     * The [DesiredAccuracyInMeters](geolocator_desiredaccuracyinmeters.md) property provides more granularity and control of
     * the accuracy of the position results. Most applications can simply use the `DesiredAccuracy` property.
     * 
     * When neither [DesiredAccuracyInMeters](geolocator_desiredaccuracyinmeters.md) nor `DesiredAccuracy` are set, your app will
     * use an accuracy setting of 500 meters (which corresponds to the `DesiredAccuracy` setting of `Default`). Setting
     * `DesiredAccuracy` to `Default` or `High` indirectly sets [DesiredAccuracyInMeters](geolocator_desiredaccuracyinmeters.md)
     * to 500 or 10 meters, respectively. When your app sets both `DesiredAccuracy` and
     * [DesiredAccuracyInMeters](geolocator_desiredaccuracyinmeters.md), your app will use whichever accuracy value was set last.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geolocator.desiredaccuracy
     * @type {Integer} 
     */
    DesiredAccuracy {
        get => this.get_DesiredAccuracy()
        set => this.put_DesiredAccuracy(value)
    }

    /**
     * The distance of movement, in meters, relative to the coordinate from the last [PositionChanged](geolocator_positionchanged.md)
     * event, that is required for the [Geolocator](geolocator.md) to raise a [PositionChanged](geolocator_positionchanged.md) event.
     * @remarks
     * The default report interval is 1 second or as frequent as the hardware can support, whichever is shorter. Location
     * updates can be set to a different frequency if you specify a `MovementThreshold` or set
     * [ReportInterval](geolocator_reportinterval.md) to a different value. If your app sets both `MovementThreshold` and
     * [ReportInterval](geolocator_reportinterval.md), location will be updated according to `MovementThreshold`.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geolocator.movementthreshold
     * @type {Float} 
     */
    MovementThreshold {
        get => this.get_MovementThreshold()
        set => this.put_MovementThreshold(value)
    }

    /**
     * The requested minimum time interval between location updates, in milliseconds. If your application requires updates
     * infrequently, set this value so that location services can conserve power by calculating location only when needed.
     * @remarks
     * > [!IMPORTANT]
     * > The value of `ReportInterval` must be greater than or equal to 1. Passing 0 is not supported, and is treated as
     * > not set. While any value ≥ 1 is accepted, the system enforces a practical minimum of 1000 milliseconds (1 second)
     * > for location updates.
     * 
     * > [!NOTE]
     * > The default report interval is 1 second or as frequent as the hardware can support, whichever is shorter. Location
     * > updates can be set to a different frequency if you specify a [MovementThreshold](geolocator_movementthreshold.md) or
     * > set `ReportInterval` to a different value. If your app sets both [MovementThreshold](geolocator_movementthreshold.md)
     * > and `ReportInterval`, location will be updated according to [MovementThreshold](geolocator_movementthreshold.md).
     * 
     * If another application has requested more frequent updates, by specifying a smaller value for `ReportInterval`, your
     * application may receive updates at a higher frequency than requested.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geolocator.reportinterval
     * @type {Integer} 
     */
    ReportInterval {
        get => this.get_ReportInterval()
        set => this.put_ReportInterval(value)
    }

    /**
     * The status that indicates the ability of the [Geolocator](geolocator.md) to provide location updates.
     * @remarks
     * The `LocationStatus` property is updated dynamically only when a tracking session is active. Otherwise, it is either `NotInitialized` or `Disabled`.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geolocator.locationstatus
     * @type {Integer} 
     */
    LocationStatus {
        get => this.get_LocationStatus()
    }

    /**
     * Gets or sets the desired accuracy in meters for data returned from the location service.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geolocator.desiredaccuracyinmeters
     * @type {IReference<Integer>} 
     */
    DesiredAccuracyInMeters {
        get => this.get_DesiredAccuracyInMeters()
        set => this.put_DesiredAccuracyInMeters(value)
    }

    /**
     * Raised when the location is updated.
     * @remarks
     * You can access information about the event with the [PositionChangedEventArgs](positionchangedeventargs.md) object that is passed to your event handler.
     * 
     * > [!TIP]
     * > When using an emulator, you must manually change the emulated location in order to trigger the PositionChanged event.
     * @type {TypedEventHandler<Geolocator, PositionChangedEventArgs>}
    */
    OnPositionChanged {
        get {
            if(!this.HasProp("__OnPositionChanged")){
                this.__OnPositionChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{df3c6164-4e7b-5e8e-9a7e-13da059dec1e}"),
                    Geolocator,
                    PositionChangedEventArgs
                )
                this.__OnPositionChangedToken := this.add_PositionChanged(this.__OnPositionChanged.iface)
            }
            return this.__OnPositionChanged
        }
    }

    /**
     * Raised when the ability of the [Geolocator](geolocator.md) to provide updated location changes.
     * @remarks
     * You can access information about the event with the [StatusChangedEventArgs](statuschangedeventargs.md) object that is
     * passed to your event handler.
     * 
     * When using a geofence, use the
     * [GeofenceMonitor](../windows.devices.geolocation.geofencing/geofencemonitor.md)'s
     * [StatusChanged](../windows.devices.geolocation.geofencing/geofencemonitor_statuschanged.md) event to monitor changes in
     * location permissions instead of this event from the [Geolocator](geolocator.md) class. A
     * [GeofenceMonitorStatus](../windows.devices.geolocation.geofencing/geofencemonitorstatus.md) of `Disabled` is equivalent
     * to a `Disabled` [PositionStatus](positionstatus.md), and both indicate that the app does not have permission to access
     * location.
     * 
     * The [Geolocator](geolocator.md) object triggers the `StatusChanged` event to indicate that the user's location settings
     * changed. That event passes the corresponding status via the argument's `Status` property (of type
     * [PositionStatus](positionstatus.md)). Note that this method is not called from the UI thread and the
     * [Dispatcher](../windows.ui.core/coredispatcher.md) object invokes the UI changes. For more info, see
     * [Get current location](/windows/uwp/maps-and-location/get-location).
     * @type {TypedEventHandler<Geolocator, StatusChangedEventArgs>}
    */
    OnStatusChanged {
        get {
            if(!this.HasProp("__OnStatusChanged")){
                this.__OnStatusChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{97fcf582-de6b-5cd3-9690-e2ecbb66da4d}"),
                    Geolocator,
                    StatusChangedEventArgs
                )
                this.__OnStatusChangedToken := this.add_StatusChanged(this.__OnStatusChanged.iface)
            }
            return this.__OnStatusChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new [Geolocator](geolocator.md) object.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Devices.Geolocation.Geolocator")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnPositionChangedToken")) {
            this.remove_PositionChanged(this.__OnPositionChangedToken)
            this.__OnPositionChanged.iface.Dispose()
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
    get_DesiredAccuracy() {
        if (!this.HasProp("__IGeolocator")) {
            if ((queryResult := this.QueryInterface(IGeolocator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeolocator := IGeolocator(outPtr)
        }

        return this.__IGeolocator.get_DesiredAccuracy()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_DesiredAccuracy(value) {
        if (!this.HasProp("__IGeolocator")) {
            if ((queryResult := this.QueryInterface(IGeolocator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeolocator := IGeolocator(outPtr)
        }

        return this.__IGeolocator.put_DesiredAccuracy(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MovementThreshold() {
        if (!this.HasProp("__IGeolocator")) {
            if ((queryResult := this.QueryInterface(IGeolocator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeolocator := IGeolocator(outPtr)
        }

        return this.__IGeolocator.get_MovementThreshold()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_MovementThreshold(value) {
        if (!this.HasProp("__IGeolocator")) {
            if ((queryResult := this.QueryInterface(IGeolocator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeolocator := IGeolocator(outPtr)
        }

        return this.__IGeolocator.put_MovementThreshold(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ReportInterval() {
        if (!this.HasProp("__IGeolocator")) {
            if ((queryResult := this.QueryInterface(IGeolocator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeolocator := IGeolocator(outPtr)
        }

        return this.__IGeolocator.get_ReportInterval()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ReportInterval(value) {
        if (!this.HasProp("__IGeolocator")) {
            if ((queryResult := this.QueryInterface(IGeolocator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeolocator := IGeolocator(outPtr)
        }

        return this.__IGeolocator.put_ReportInterval(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LocationStatus() {
        if (!this.HasProp("__IGeolocator")) {
            if ((queryResult := this.QueryInterface(IGeolocator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeolocator := IGeolocator(outPtr)
        }

        return this.__IGeolocator.get_LocationStatus()
    }

    /**
     * Starts an asynchronous operation to retrieve the current location of the device.
     * @remarks
     * This method throws an exception if the app doesn't have location permissions or if it times out with no location data
     * retrieved. Therefore, the method should be called within a try/catch statement so that these common exception cases can be
     * handled.
     * 
     * This method times out after 60 seconds, except when in Connected Standby. During Connected Standby,
     * [Geolocator](geolocator.md) objects can be instantiated but the [Geolocator](geolocator.md) object will not find any
     * sensors to aggregate and calls to `GetGeopositionAsync` will time out after 7 seconds. Upon time out, the
     * [StatusChanged](geolocator_statuschanged.md) event listeners will be called once with the `NoData` status, and the
     * [PositionChanged](geolocator_positionchanged.md) event listeners will never be called.
     * 
     * The user sets the privacy of their location data with the **Location privacy settings** in Windows **Settings**. Your app
     * can access the user's location only when:
     * - **Location for this device...** is turned on
     * - The location services setting, **Location**, is turned on
     * - Under **Choose apps that can use your location**, your app is set to on
     * 
     * > [!IMPORTANT]
     * > Call the [RequestAccessAsync](geolocator_requestaccessasync_380675631.md) method before accessing the user's location.
     * > At that time, your app must be in the foreground and `RequestAccessAsync` must be called from the UI thread. Your app can
     * > then handle the no-permissions case without throwing an exception.
     * @returns {IAsyncOperation<Geoposition>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geolocator.getgeopositionasync
     */
    GetGeopositionAsync() {
        if (!this.HasProp("__IGeolocator")) {
            if ((queryResult := this.QueryInterface(IGeolocator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeolocator := IGeolocator(outPtr)
        }

        return this.__IGeolocator.GetGeopositionAsync()
    }

    /**
     * Starts an asynchronous operation to retrieve the current location of the device.
     * @remarks
     * This method throws an exception if the app doesn't have location permissions or if it times out with no location data
     * retrieved. Therefore, the method should be called within a try/catch statement so that these common exception cases can be
     * handled.
     * 
     * This method times out after 60 seconds, except when in Connected Standby. During Connected Standby,
     * [Geolocator](geolocator.md) objects can be instantiated but the [Geolocator](geolocator.md) object will not find any
     * sensors to aggregate and calls to `GetGeopositionAsync` will time out after 7 seconds. Upon time out, the
     * [StatusChanged](geolocator_statuschanged.md) event listeners will be called once with the `NoData` status, and the
     * [PositionChanged](geolocator_positionchanged.md) event listeners will never be called.
     * 
     * The user sets the privacy of their location data with the **Location privacy settings** in Windows **Settings**. Your app
     * can access the user's location only when:
     * - **Location for this device...** is turned on
     * - The location services setting, **Location**, is turned on
     * - Under **Choose apps that can use your location**, your app is set to on
     * 
     * > [!IMPORTANT]
     * > Call the [RequestAccessAsync](geolocator_requestaccessasync_380675631.md) method before accessing the user's location.
     * > At that time, your app must be in the foreground and `RequestAccessAsync` must be called from the UI thread. Your app can
     * > then handle the no-permissions case without throwing an exception.
     * @param {TimeSpan} maximumAge 
     * @param {TimeSpan} timeout 
     * @returns {IAsyncOperation<Geoposition>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geolocator.getgeopositionasync
     */
    GetGeopositionAsyncWithAgeAndTimeout(maximumAge, timeout) {
        if (!this.HasProp("__IGeolocator")) {
            if ((queryResult := this.QueryInterface(IGeolocator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeolocator := IGeolocator(outPtr)
        }

        return this.__IGeolocator.GetGeopositionAsyncWithAgeAndTimeout(maximumAge, timeout)
    }

    /**
     * 
     * @param {TypedEventHandler<Geolocator, PositionChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PositionChanged(handler) {
        if (!this.HasProp("__IGeolocator")) {
            if ((queryResult := this.QueryInterface(IGeolocator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeolocator := IGeolocator(outPtr)
        }

        return this.__IGeolocator.add_PositionChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PositionChanged(token) {
        if (!this.HasProp("__IGeolocator")) {
            if ((queryResult := this.QueryInterface(IGeolocator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeolocator := IGeolocator(outPtr)
        }

        return this.__IGeolocator.remove_PositionChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<Geolocator, StatusChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_StatusChanged(handler) {
        if (!this.HasProp("__IGeolocator")) {
            if ((queryResult := this.QueryInterface(IGeolocator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeolocator := IGeolocator(outPtr)
        }

        return this.__IGeolocator.add_StatusChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_StatusChanged(token) {
        if (!this.HasProp("__IGeolocator")) {
            if ((queryResult := this.QueryInterface(IGeolocator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeolocator := IGeolocator(outPtr)
        }

        return this.__IGeolocator.remove_StatusChanged(token)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_DesiredAccuracyInMeters() {
        if (!this.HasProp("__IGeolocatorWithScalarAccuracy")) {
            if ((queryResult := this.QueryInterface(IGeolocatorWithScalarAccuracy.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeolocatorWithScalarAccuracy := IGeolocatorWithScalarAccuracy(outPtr)
        }

        return this.__IGeolocatorWithScalarAccuracy.get_DesiredAccuracyInMeters()
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_DesiredAccuracyInMeters(value) {
        if (!this.HasProp("__IGeolocatorWithScalarAccuracy")) {
            if ((queryResult := this.QueryInterface(IGeolocatorWithScalarAccuracy.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeolocatorWithScalarAccuracy := IGeolocatorWithScalarAccuracy(outPtr)
        }

        return this.__IGeolocatorWithScalarAccuracy.put_DesiredAccuracyInMeters(value)
    }

    /**
     * Sets the [Geolocator](geolocator.md) to use coarse location as a fallback option (see Remarks).
     * @remarks
     * The coarse location feature allows the app to bypass the app-specific location switch (located in system settings) and
     * obtain a "rough" location that is obfuscated with at least a 4km radius of uncertainty. The
     * [PositionSource](geocoordinate_positionsource.md) property of the retrieved [Geocoordinate](geocoordinate.md) will
     * evaluate to `Obfuscated`.
     * 
     * Coarse location, if enabled in the app, will be utilized when the app-specific location switch is set to off (that
     * is, when precise location is not allowed). The system-wide location switch, however, must be still switched on in
     * order for any location retrieval to take place.
     * 
     * This feature is enabled for any [Geolocator](geolocator.md) object that calls `AllowFallbackToConsentlessPositions`. It
     * is disabled by default.
     * 
     * Normally, an app that uses location services should first call [RequestAccessAsync](geolocator_requestaccessasync_380675631.md) to check if its app-specific location is switched on, and if not, it should prompt the user to go to system settings and switch it on. However, an app that has coarse location capability does not need to call [RequestAccessAsync](geolocator_requestaccessasync_380675631.md), as it can function whether location access is allowed or denied. The user may still turn on the app-specific location in order to use precise location, but this is not needed for the app's location functionality to work.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geolocator.allowfallbacktoconsentlesspositions
     */
    AllowFallbackToConsentlessPositions() {
        if (!this.HasProp("__IGeolocator2")) {
            if ((queryResult := this.QueryInterface(IGeolocator2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeolocator2 := IGeolocator2(outPtr)
        }

        return this.__IGeolocator2.AllowFallbackToConsentlessPositions()
    }

;@endregion Instance Methods
}

#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGuidanceNavigator.ahk
#Include .\IGuidanceNavigator2.ahk
#Include .\IGuidanceNavigatorStatics.ahk
#Include .\IGuidanceNavigatorStatics2.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\GuidanceNavigator.ahk
#Include .\GuidanceUpdatedEventArgs.ahk
#Include .\GuidanceReroutedEventArgs.ahk
#Include .\GuidanceAudioNotificationRequestedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * [Deprecated - see Remarks.] Provides navigational guidance.
 * @remarks
 * > [!IMPORTANT]
 * > The UWP [MapControl](../windows.ui.xaml.controls.maps/mapcontrol.md) and Windows Maps platform APIs ([Windows.Services.Maps.*](../windows.services.maps/windows_services_maps.md)) are deprecated and may not be available in future versions of Windows. For more information, see [Resources for deprecated features](/windows/whats-new/deprecated-features-resources#windows-uwp-map-control-and-windows-maps-platform-apis).
 * 
 * > [!IMPORTANT]
 * > **Bing Maps for Enterprise service retirement**
 * >
 * > The UWP [MapControl](../windows.ui.xaml.controls.maps/mapcontrol.md) and map services from the [Windows.Services.Maps](../windows.services.maps/windows_services_maps.md) namespaces rely on Bing Maps. Bing Maps for Enterprise is deprecated and will be retired, at which point the MapControl and services will no longer receive data.
 * >
 * > For more information, see the [Bing Maps Developer Center](https://www.bingmapsportal.com/) and [Bing Maps documentation](/bingmaps/getting-started/).
 * 
 * > [!NOTE]
 * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
 * @see https://learn.microsoft.com/uwp/api/windows.services.maps.guidance.guidancenavigator
 * @namespace Windows.Services.Maps.Guidance
 * @version WindowsRuntime 1.4
 */
class GuidanceNavigator extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGuidanceNavigator

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGuidanceNavigator.IID

    /**
     * Gets a value that indicates if Cortana is being used on the device.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.guidance.guidancenavigator.useappprovidedvoice
     * @type {Boolean} 
     */
    static UseAppProvidedVoice {
        get => GuidanceNavigator.get_UseAppProvidedVoice()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets the [GuidanceNavigator](guidancenavigator.md) object that represents the current navigational guidance.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
     * @returns {GuidanceNavigator} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.guidance.guidancenavigator.getcurrent
     */
    static GetCurrent() {
        if (!GuidanceNavigator.HasProp("__IGuidanceNavigatorStatics")) {
            activatableClassId := HSTRING.Create("Windows.Services.Maps.Guidance.GuidanceNavigator")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGuidanceNavigatorStatics.IID)
            GuidanceNavigator.__IGuidanceNavigatorStatics := IGuidanceNavigatorStatics(factoryPtr)
        }

        return GuidanceNavigator.__IGuidanceNavigatorStatics.GetCurrent()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    static get_UseAppProvidedVoice() {
        if (!GuidanceNavigator.HasProp("__IGuidanceNavigatorStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Services.Maps.Guidance.GuidanceNavigator")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGuidanceNavigatorStatics2.IID)
            GuidanceNavigator.__IGuidanceNavigatorStatics2 := IGuidanceNavigatorStatics2(factoryPtr)
        }

        return GuidanceNavigator.__IGuidanceNavigatorStatics2.get_UseAppProvidedVoice()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the measurement system used for audio guidance.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
     * @remarks
     * Regardless of the measurement system used for audio guidance (AudioMeasurementSystem), the metric system is always used for distance and speed API values.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.guidance.guidancenavigator.audiomeasurementsystem
     * @type {Integer} 
     */
    AudioMeasurementSystem {
        get => this.get_AudioMeasurementSystem()
        set => this.put_AudioMeasurementSystem(value)
    }

    /**
     * Gets or sets the types of audio notifications provided by the navigational guidance.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.guidance.guidancenavigator.audionotifications
     * @type {Integer} 
     */
    AudioNotifications {
        get => this.get_AudioNotifications()
        set => this.put_AudioNotifications(value)
    }

    /**
     * Gets or sets a value that indicates if the audio guidance is muted.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.guidance.guidancenavigator.isguidanceaudiomuted
     * @type {Boolean} 
     */
    IsGuidanceAudioMuted {
        get => this.get_IsGuidanceAudioMuted()
        set => this.put_IsGuidanceAudioMuted(value)
    }

    /**
     * Occurs when the navigational guidance has been updated.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
     * @type {TypedEventHandler<GuidanceNavigator, GuidanceUpdatedEventArgs>}
    */
    OnGuidanceUpdated {
        get {
            if(!this.HasProp("__OnGuidanceUpdated")){
                this.__OnGuidanceUpdated := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{82b3f7df-bf13-5445-aadc-ec61b50fbb46}"),
                    GuidanceNavigator,
                    GuidanceUpdatedEventArgs
                )
                this.__OnGuidanceUpdatedToken := this.add_GuidanceUpdated(this.__OnGuidanceUpdated.iface)
            }
            return this.__OnGuidanceUpdated
        }
    }

    /**
     * Occurs when the route destination has been reached.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
     * @type {TypedEventHandler<GuidanceNavigator, IInspectable>}
    */
    OnDestinationReached {
        get {
            if(!this.HasProp("__OnDestinationReached")){
                this.__OnDestinationReached := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{3f496c35-3dca-5e91-8730-6ef77e9d70bd}"),
                    GuidanceNavigator,
                    IInspectable
                )
                this.__OnDestinationReachedToken := this.add_DestinationReached(this.__OnDestinationReached.iface)
            }
            return this.__OnDestinationReached
        }
    }

    /**
     * Occurs when navigational guidance is rerouting.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
     * @type {TypedEventHandler<GuidanceNavigator, IInspectable>}
    */
    OnRerouting {
        get {
            if(!this.HasProp("__OnRerouting")){
                this.__OnRerouting := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{3f496c35-3dca-5e91-8730-6ef77e9d70bd}"),
                    GuidanceNavigator,
                    IInspectable
                )
                this.__OnReroutingToken := this.add_Rerouting(this.__OnRerouting.iface)
            }
            return this.__OnRerouting
        }
    }

    /**
     * Occurs when the navigational guidance has been rerouted.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
     * @type {TypedEventHandler<GuidanceNavigator, GuidanceReroutedEventArgs>}
    */
    OnRerouted {
        get {
            if(!this.HasProp("__OnRerouted")){
                this.__OnRerouted := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{61b92b1b-f22f-581b-bfa0-4868c314c63a}"),
                    GuidanceNavigator,
                    GuidanceReroutedEventArgs
                )
                this.__OnReroutedToken := this.add_Rerouted(this.__OnRerouted.iface)
            }
            return this.__OnRerouted
        }
    }

    /**
     * Occurs when rerouting of the navigational guidance fails.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
     * @type {TypedEventHandler<GuidanceNavigator, IInspectable>}
    */
    OnRerouteFailed {
        get {
            if(!this.HasProp("__OnRerouteFailed")){
                this.__OnRerouteFailed := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{3f496c35-3dca-5e91-8730-6ef77e9d70bd}"),
                    GuidanceNavigator,
                    IInspectable
                )
                this.__OnRerouteFailedToken := this.add_RerouteFailed(this.__OnRerouteFailed.iface)
            }
            return this.__OnRerouteFailed
        }
    }

    /**
     * Occurs when the user's location has been lost.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
     * @type {TypedEventHandler<GuidanceNavigator, IInspectable>}
    */
    OnUserLocationLost {
        get {
            if(!this.HasProp("__OnUserLocationLost")){
                this.__OnUserLocationLost := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{3f496c35-3dca-5e91-8730-6ef77e9d70bd}"),
                    GuidanceNavigator,
                    IInspectable
                )
                this.__OnUserLocationLostToken := this.add_UserLocationLost(this.__OnUserLocationLost.iface)
            }
            return this.__OnUserLocationLost
        }
    }

    /**
     * Occurs when the user's location has been restored.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
     * @type {TypedEventHandler<GuidanceNavigator, IInspectable>}
    */
    OnUserLocationRestored {
        get {
            if(!this.HasProp("__OnUserLocationRestored")){
                this.__OnUserLocationRestored := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{3f496c35-3dca-5e91-8730-6ef77e9d70bd}"),
                    GuidanceNavigator,
                    IInspectable
                )
                this.__OnUserLocationRestoredToken := this.add_UserLocationRestored(this.__OnUserLocationRestored.iface)
            }
            return this.__OnUserLocationRestored
        }
    }

    /**
     * Occurs when audio notifications are appropriate for navigational guidance, such as prior to an upcoming turn or exit.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
     * @remarks
     * Registering to handle this event turns off automatic audio notifications. Use the [GuidanceAudioNotificationRequestedEventArgs](guidanceaudionotificationrequestedeventargs.md) to provide your own audio notifications.
     * @type {TypedEventHandler<GuidanceNavigator, GuidanceAudioNotificationRequestedEventArgs>}
    */
    OnAudioNotificationRequested {
        get {
            if(!this.HasProp("__OnAudioNotificationRequested")){
                this.__OnAudioNotificationRequested := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{743db36f-e9aa-557a-9fd7-304c9b0499df}"),
                    GuidanceNavigator,
                    GuidanceAudioNotificationRequestedEventArgs
                )
                this.__OnAudioNotificationRequestedToken := this.add_AudioNotificationRequested(this.__OnAudioNotificationRequested.iface)
            }
            return this.__OnAudioNotificationRequested
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnGuidanceUpdatedToken")) {
            this.remove_GuidanceUpdated(this.__OnGuidanceUpdatedToken)
            this.__OnGuidanceUpdated.iface.Dispose()
        }

        if(this.HasProp("__OnDestinationReachedToken")) {
            this.remove_DestinationReached(this.__OnDestinationReachedToken)
            this.__OnDestinationReached.iface.Dispose()
        }

        if(this.HasProp("__OnReroutingToken")) {
            this.remove_Rerouting(this.__OnReroutingToken)
            this.__OnRerouting.iface.Dispose()
        }

        if(this.HasProp("__OnReroutedToken")) {
            this.remove_Rerouted(this.__OnReroutedToken)
            this.__OnRerouted.iface.Dispose()
        }

        if(this.HasProp("__OnRerouteFailedToken")) {
            this.remove_RerouteFailed(this.__OnRerouteFailedToken)
            this.__OnRerouteFailed.iface.Dispose()
        }

        if(this.HasProp("__OnUserLocationLostToken")) {
            this.remove_UserLocationLost(this.__OnUserLocationLostToken)
            this.__OnUserLocationLost.iface.Dispose()
        }

        if(this.HasProp("__OnUserLocationRestoredToken")) {
            this.remove_UserLocationRestored(this.__OnUserLocationRestoredToken)
            this.__OnUserLocationRestored.iface.Dispose()
        }

        if(this.HasProp("__OnAudioNotificationRequestedToken")) {
            this.remove_AudioNotificationRequested(this.__OnAudioNotificationRequestedToken)
            this.__OnAudioNotificationRequested.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * Starts navigational guidance, using the specified route.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
     * @param {GuidanceRoute} route The route to be navigated.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.guidance.guidancenavigator.startnavigating
     */
    StartNavigating(route) {
        if (!this.HasProp("__IGuidanceNavigator")) {
            if ((queryResult := this.QueryInterface(IGuidanceNavigator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGuidanceNavigator := IGuidanceNavigator(outPtr)
        }

        return this.__IGuidanceNavigator.StartNavigating(route)
    }

    /**
     * Starts simulation of the navigational guidance, using the specified route.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
     * @param {GuidanceRoute} route The route to be navigated.
     * @param {Integer} speedInMetersPerSecond The speed of the navigational simulation, in meters per second.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.guidance.guidancenavigator.startsimulating
     */
    StartSimulating(route, speedInMetersPerSecond) {
        if (!this.HasProp("__IGuidanceNavigator")) {
            if ((queryResult := this.QueryInterface(IGuidanceNavigator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGuidanceNavigator := IGuidanceNavigator(outPtr)
        }

        return this.__IGuidanceNavigator.StartSimulating(route, speedInMetersPerSecond)
    }

    /**
     * Starts navigational guidance, without a specified route.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.guidance.guidancenavigator.starttracking
     */
    StartTracking() {
        if (!this.HasProp("__IGuidanceNavigator")) {
            if ((queryResult := this.QueryInterface(IGuidanceNavigator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGuidanceNavigator := IGuidanceNavigator(outPtr)
        }

        return this.__IGuidanceNavigator.StartTracking()
    }

    /**
     * Pauses navigational guidance.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.guidance.guidancenavigator.pause
     */
    Pause() {
        if (!this.HasProp("__IGuidanceNavigator")) {
            if ((queryResult := this.QueryInterface(IGuidanceNavigator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGuidanceNavigator := IGuidanceNavigator(outPtr)
        }

        return this.__IGuidanceNavigator.Pause()
    }

    /**
     * Resumes navigational guidance.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.guidance.guidancenavigator.resume
     */
    Resume() {
        if (!this.HasProp("__IGuidanceNavigator")) {
            if ((queryResult := this.QueryInterface(IGuidanceNavigator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGuidanceNavigator := IGuidanceNavigator(outPtr)
        }

        return this.__IGuidanceNavigator.Resume()
    }

    /**
     * Stops navigational guidance.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.guidance.guidancenavigator.stop
     */
    Stop() {
        if (!this.HasProp("__IGuidanceNavigator")) {
            if ((queryResult := this.QueryInterface(IGuidanceNavigator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGuidanceNavigator := IGuidanceNavigator(outPtr)
        }

        return this.__IGuidanceNavigator.Stop()
    }

    /**
     * Repeats the last audio notification.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.guidance.guidancenavigator.repeatlastaudionotification
     */
    RepeatLastAudioNotification() {
        if (!this.HasProp("__IGuidanceNavigator")) {
            if ((queryResult := this.QueryInterface(IGuidanceNavigator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGuidanceNavigator := IGuidanceNavigator(outPtr)
        }

        return this.__IGuidanceNavigator.RepeatLastAudioNotification()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AudioMeasurementSystem() {
        if (!this.HasProp("__IGuidanceNavigator")) {
            if ((queryResult := this.QueryInterface(IGuidanceNavigator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGuidanceNavigator := IGuidanceNavigator(outPtr)
        }

        return this.__IGuidanceNavigator.get_AudioMeasurementSystem()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_AudioMeasurementSystem(value) {
        if (!this.HasProp("__IGuidanceNavigator")) {
            if ((queryResult := this.QueryInterface(IGuidanceNavigator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGuidanceNavigator := IGuidanceNavigator(outPtr)
        }

        return this.__IGuidanceNavigator.put_AudioMeasurementSystem(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AudioNotifications() {
        if (!this.HasProp("__IGuidanceNavigator")) {
            if ((queryResult := this.QueryInterface(IGuidanceNavigator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGuidanceNavigator := IGuidanceNavigator(outPtr)
        }

        return this.__IGuidanceNavigator.get_AudioNotifications()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_AudioNotifications(value) {
        if (!this.HasProp("__IGuidanceNavigator")) {
            if ((queryResult := this.QueryInterface(IGuidanceNavigator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGuidanceNavigator := IGuidanceNavigator(outPtr)
        }

        return this.__IGuidanceNavigator.put_AudioNotifications(value)
    }

    /**
     * 
     * @param {TypedEventHandler<GuidanceNavigator, GuidanceUpdatedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_GuidanceUpdated(handler) {
        if (!this.HasProp("__IGuidanceNavigator")) {
            if ((queryResult := this.QueryInterface(IGuidanceNavigator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGuidanceNavigator := IGuidanceNavigator(outPtr)
        }

        return this.__IGuidanceNavigator.add_GuidanceUpdated(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_GuidanceUpdated(token) {
        if (!this.HasProp("__IGuidanceNavigator")) {
            if ((queryResult := this.QueryInterface(IGuidanceNavigator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGuidanceNavigator := IGuidanceNavigator(outPtr)
        }

        return this.__IGuidanceNavigator.remove_GuidanceUpdated(token)
    }

    /**
     * 
     * @param {TypedEventHandler<GuidanceNavigator, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_DestinationReached(handler) {
        if (!this.HasProp("__IGuidanceNavigator")) {
            if ((queryResult := this.QueryInterface(IGuidanceNavigator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGuidanceNavigator := IGuidanceNavigator(outPtr)
        }

        return this.__IGuidanceNavigator.add_DestinationReached(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_DestinationReached(token) {
        if (!this.HasProp("__IGuidanceNavigator")) {
            if ((queryResult := this.QueryInterface(IGuidanceNavigator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGuidanceNavigator := IGuidanceNavigator(outPtr)
        }

        return this.__IGuidanceNavigator.remove_DestinationReached(token)
    }

    /**
     * 
     * @param {TypedEventHandler<GuidanceNavigator, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Rerouting(handler) {
        if (!this.HasProp("__IGuidanceNavigator")) {
            if ((queryResult := this.QueryInterface(IGuidanceNavigator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGuidanceNavigator := IGuidanceNavigator(outPtr)
        }

        return this.__IGuidanceNavigator.add_Rerouting(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Rerouting(token) {
        if (!this.HasProp("__IGuidanceNavigator")) {
            if ((queryResult := this.QueryInterface(IGuidanceNavigator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGuidanceNavigator := IGuidanceNavigator(outPtr)
        }

        return this.__IGuidanceNavigator.remove_Rerouting(token)
    }

    /**
     * 
     * @param {TypedEventHandler<GuidanceNavigator, GuidanceReroutedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Rerouted(handler) {
        if (!this.HasProp("__IGuidanceNavigator")) {
            if ((queryResult := this.QueryInterface(IGuidanceNavigator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGuidanceNavigator := IGuidanceNavigator(outPtr)
        }

        return this.__IGuidanceNavigator.add_Rerouted(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Rerouted(token) {
        if (!this.HasProp("__IGuidanceNavigator")) {
            if ((queryResult := this.QueryInterface(IGuidanceNavigator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGuidanceNavigator := IGuidanceNavigator(outPtr)
        }

        return this.__IGuidanceNavigator.remove_Rerouted(token)
    }

    /**
     * 
     * @param {TypedEventHandler<GuidanceNavigator, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_RerouteFailed(handler) {
        if (!this.HasProp("__IGuidanceNavigator")) {
            if ((queryResult := this.QueryInterface(IGuidanceNavigator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGuidanceNavigator := IGuidanceNavigator(outPtr)
        }

        return this.__IGuidanceNavigator.add_RerouteFailed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_RerouteFailed(token) {
        if (!this.HasProp("__IGuidanceNavigator")) {
            if ((queryResult := this.QueryInterface(IGuidanceNavigator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGuidanceNavigator := IGuidanceNavigator(outPtr)
        }

        return this.__IGuidanceNavigator.remove_RerouteFailed(token)
    }

    /**
     * 
     * @param {TypedEventHandler<GuidanceNavigator, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_UserLocationLost(handler) {
        if (!this.HasProp("__IGuidanceNavigator")) {
            if ((queryResult := this.QueryInterface(IGuidanceNavigator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGuidanceNavigator := IGuidanceNavigator(outPtr)
        }

        return this.__IGuidanceNavigator.add_UserLocationLost(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_UserLocationLost(token) {
        if (!this.HasProp("__IGuidanceNavigator")) {
            if ((queryResult := this.QueryInterface(IGuidanceNavigator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGuidanceNavigator := IGuidanceNavigator(outPtr)
        }

        return this.__IGuidanceNavigator.remove_UserLocationLost(token)
    }

    /**
     * 
     * @param {TypedEventHandler<GuidanceNavigator, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_UserLocationRestored(handler) {
        if (!this.HasProp("__IGuidanceNavigator")) {
            if ((queryResult := this.QueryInterface(IGuidanceNavigator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGuidanceNavigator := IGuidanceNavigator(outPtr)
        }

        return this.__IGuidanceNavigator.add_UserLocationRestored(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_UserLocationRestored(token) {
        if (!this.HasProp("__IGuidanceNavigator")) {
            if ((queryResult := this.QueryInterface(IGuidanceNavigator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGuidanceNavigator := IGuidanceNavigator(outPtr)
        }

        return this.__IGuidanceNavigator.remove_UserLocationRestored(token)
    }

    /**
     * Sets the voice used for audio notifications.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
     * @param {Integer} voiceId The voice identifier.
     * @param {HSTRING} voiceFolder The folder path of the specified voice.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.guidance.guidancenavigator.setguidancevoice
     */
    SetGuidanceVoice(voiceId, voiceFolder) {
        if (!this.HasProp("__IGuidanceNavigator")) {
            if ((queryResult := this.QueryInterface(IGuidanceNavigator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGuidanceNavigator := IGuidanceNavigator(outPtr)
        }

        return this.__IGuidanceNavigator.SetGuidanceVoice(voiceId, voiceFolder)
    }

    /**
     * Updates navigational guidance, using the specified geographic location.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
     * @remarks
     * To find the user's current location, use the [Geolocator](../windows.devices.geolocation/geolocator.md) object in the [Windows.Devices.Geolocation](../windows.devices.geolocation/windows_devices_geolocation.md) namespace. For more information, see [Get current location](/windows/uwp/maps-and-location/get-location).
     * @param {Geocoordinate} userLocation The user's current location.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.guidance.guidancenavigator.updateuserlocation
     */
    UpdateUserLocation(userLocation) {
        if (!this.HasProp("__IGuidanceNavigator")) {
            if ((queryResult := this.QueryInterface(IGuidanceNavigator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGuidanceNavigator := IGuidanceNavigator(outPtr)
        }

        return this.__IGuidanceNavigator.UpdateUserLocation(userLocation)
    }

    /**
     * Updates navigational guidance, using the specified geographic location.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
     * @remarks
     * See the remarks in the [UpdateUserLocation(Geocoordinate)](guidancenavigator_updateuserlocation_449934857.md) overload of this method.
     * @param {Geocoordinate} userLocation The user's current location.
     * @param {BasicGeoposition} positionOverride The altitude, latitude, and longitude to use instead of what's specified in *userLocation*.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.guidance.guidancenavigator.updateuserlocation
     */
    UpdateUserLocationWithPositionOverride(userLocation, positionOverride) {
        if (!this.HasProp("__IGuidanceNavigator")) {
            if ((queryResult := this.QueryInterface(IGuidanceNavigator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGuidanceNavigator := IGuidanceNavigator(outPtr)
        }

        return this.__IGuidanceNavigator.UpdateUserLocationWithPositionOverride(userLocation, positionOverride)
    }

    /**
     * 
     * @param {TypedEventHandler<GuidanceNavigator, GuidanceAudioNotificationRequestedEventArgs>} value 
     * @returns {EventRegistrationToken} 
     */
    add_AudioNotificationRequested(value) {
        if (!this.HasProp("__IGuidanceNavigator2")) {
            if ((queryResult := this.QueryInterface(IGuidanceNavigator2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGuidanceNavigator2 := IGuidanceNavigator2(outPtr)
        }

        return this.__IGuidanceNavigator2.add_AudioNotificationRequested(value)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_AudioNotificationRequested(token) {
        if (!this.HasProp("__IGuidanceNavigator2")) {
            if ((queryResult := this.QueryInterface(IGuidanceNavigator2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGuidanceNavigator2 := IGuidanceNavigator2(outPtr)
        }

        return this.__IGuidanceNavigator2.remove_AudioNotificationRequested(token)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsGuidanceAudioMuted() {
        if (!this.HasProp("__IGuidanceNavigator2")) {
            if ((queryResult := this.QueryInterface(IGuidanceNavigator2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGuidanceNavigator2 := IGuidanceNavigator2(outPtr)
        }

        return this.__IGuidanceNavigator2.get_IsGuidanceAudioMuted()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsGuidanceAudioMuted(value) {
        if (!this.HasProp("__IGuidanceNavigator2")) {
            if ((queryResult := this.QueryInterface(IGuidanceNavigator2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGuidanceNavigator2 := IGuidanceNavigator2(outPtr)
        }

        return this.__IGuidanceNavigator2.put_IsGuidanceAudioMuted(value)
    }

;@endregion Instance Methods
}

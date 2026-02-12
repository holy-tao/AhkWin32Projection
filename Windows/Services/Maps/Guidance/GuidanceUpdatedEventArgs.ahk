#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGuidanceUpdatedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides data for the [GuidanceUpdated](guidancenavigator_guidanceupdated.md) event.
  * 
  * > [!NOTE]
  * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
 * @remarks
 * During a guidance update, the geographic location returned by GuidanceUpdatedEventArgs corresponds to the nearest point on the route near the user's actual geographic location. This helps compensate for GPS inaccuracies. If the route is not nearby, a point on the nearest road will be used. For example, if the user misses a turn.
 * @see https://learn.microsoft.com/uwp/api/windows.services.maps.guidance.guidanceupdatedeventargs
 * @namespace Windows.Services.Maps.Guidance
 * @version WindowsRuntime 1.4
 */
class GuidanceUpdatedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGuidanceUpdatedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGuidanceUpdatedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the type of the navigational guidance.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.guidance.guidanceupdatedeventargs.mode
     * @type {Integer} 
     */
    Mode {
        get => this.get_Mode()
    }

    /**
     * Gets the maneuver that follows the current maneuver.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.guidance.guidanceupdatedeventargs.nextmaneuver
     * @type {GuidanceManeuver} 
     */
    NextManeuver {
        get => this.get_NextManeuver()
    }

    /**
     * Gets the distance along the route between the current location and [NextManeuver](guidanceupdatedeventargs_nextmaneuver.md), in meters.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.guidance.guidanceupdatedeventargs.nextmaneuverdistance
     * @type {Integer} 
     */
    NextManeuverDistance {
        get => this.get_NextManeuverDistance()
    }

    /**
     * Gets the maneuver that follows [NextManeuver](guidanceupdatedeventargs_nextmaneuver.md).
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.guidance.guidanceupdatedeventargs.afternextmaneuver
     * @type {GuidanceManeuver} 
     */
    AfterNextManeuver {
        get => this.get_AfterNextManeuver()
    }

    /**
     * Gets the distance along the route between the current location and [AfterNextManeuver](guidanceupdatedeventargs_afternextmaneuver.md), in meters.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.guidance.guidanceupdatedeventargs.afternextmaneuverdistance
     * @type {Integer} 
     */
    AfterNextManeuverDistance {
        get => this.get_AfterNextManeuverDistance()
    }

    /**
     * Gets the distance remaining along the route, in meters.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.guidance.guidanceupdatedeventargs.distancetodestination
     * @type {Integer} 
     */
    DistanceToDestination {
        get => this.get_DistanceToDestination()
    }

    /**
     * Gets the distance traveled along the route prior to the update, in meters.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.guidance.guidanceupdatedeventargs.elapseddistance
     * @type {Integer} 
     */
    ElapsedDistance {
        get => this.get_ElapsedDistance()
    }

    /**
     * Gets the time that has elapsed along the route prior to the update.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.guidance.guidanceupdatedeventargs.elapsedtime
     * @type {TimeSpan} 
     */
    ElapsedTime {
        get => this.get_ElapsedTime()
    }

    /**
     * Gets the estimated travel time to reach the destination.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.guidance.guidanceupdatedeventargs.timetodestination
     * @type {TimeSpan} 
     */
    TimeToDestination {
        get => this.get_TimeToDestination()
    }

    /**
     * Gets the full name of the current road segment.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.guidance.guidanceupdatedeventargs.roadname
     * @type {HSTRING} 
     */
    RoadName {
        get => this.get_RoadName()
    }

    /**
     * Gets the updated route.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.guidance.guidanceupdatedeventargs.route
     * @type {GuidanceRoute} 
     */
    Route {
        get => this.get_Route()
    }

    /**
     * Gets the navigational conditions at the current location.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
     * @remarks
     * During a guidance update, the geographic location returned by [GuidanceUpdatedEventArgs](guidanceupdatedeventargs.md) corresponds to the nearest point on the route near the user's actual geographic location. This helps compensate for GPS inaccuracies. If the route is not nearby, a point on the nearest road will be used. For example, if the user misses a turn.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.guidance.guidanceupdatedeventargs.currentlocation
     * @type {GuidanceMapMatchedCoordinate} 
     */
    CurrentLocation {
        get => this.get_CurrentLocation()
    }

    /**
     * Gets a value that indicates if the update contains a new maneuver.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.guidance.guidanceupdatedeventargs.isnewmaneuver
     * @type {Boolean} 
     */
    IsNewManeuver {
        get => this.get_IsNewManeuver()
    }

    /**
     * Gets a list of lanes near the current location, ordered from left to right.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.guidance.guidanceupdatedeventargs.laneinfo
     * @type {IVectorView<GuidanceLaneInfo>} 
     */
    LaneInfo {
        get => this.get_LaneInfo()
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
    get_Mode() {
        if (!this.HasProp("__IGuidanceUpdatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IGuidanceUpdatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGuidanceUpdatedEventArgs := IGuidanceUpdatedEventArgs(outPtr)
        }

        return this.__IGuidanceUpdatedEventArgs.get_Mode()
    }

    /**
     * 
     * @returns {GuidanceManeuver} 
     */
    get_NextManeuver() {
        if (!this.HasProp("__IGuidanceUpdatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IGuidanceUpdatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGuidanceUpdatedEventArgs := IGuidanceUpdatedEventArgs(outPtr)
        }

        return this.__IGuidanceUpdatedEventArgs.get_NextManeuver()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NextManeuverDistance() {
        if (!this.HasProp("__IGuidanceUpdatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IGuidanceUpdatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGuidanceUpdatedEventArgs := IGuidanceUpdatedEventArgs(outPtr)
        }

        return this.__IGuidanceUpdatedEventArgs.get_NextManeuverDistance()
    }

    /**
     * 
     * @returns {GuidanceManeuver} 
     */
    get_AfterNextManeuver() {
        if (!this.HasProp("__IGuidanceUpdatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IGuidanceUpdatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGuidanceUpdatedEventArgs := IGuidanceUpdatedEventArgs(outPtr)
        }

        return this.__IGuidanceUpdatedEventArgs.get_AfterNextManeuver()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AfterNextManeuverDistance() {
        if (!this.HasProp("__IGuidanceUpdatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IGuidanceUpdatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGuidanceUpdatedEventArgs := IGuidanceUpdatedEventArgs(outPtr)
        }

        return this.__IGuidanceUpdatedEventArgs.get_AfterNextManeuverDistance()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DistanceToDestination() {
        if (!this.HasProp("__IGuidanceUpdatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IGuidanceUpdatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGuidanceUpdatedEventArgs := IGuidanceUpdatedEventArgs(outPtr)
        }

        return this.__IGuidanceUpdatedEventArgs.get_DistanceToDestination()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ElapsedDistance() {
        if (!this.HasProp("__IGuidanceUpdatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IGuidanceUpdatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGuidanceUpdatedEventArgs := IGuidanceUpdatedEventArgs(outPtr)
        }

        return this.__IGuidanceUpdatedEventArgs.get_ElapsedDistance()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_ElapsedTime() {
        if (!this.HasProp("__IGuidanceUpdatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IGuidanceUpdatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGuidanceUpdatedEventArgs := IGuidanceUpdatedEventArgs(outPtr)
        }

        return this.__IGuidanceUpdatedEventArgs.get_ElapsedTime()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_TimeToDestination() {
        if (!this.HasProp("__IGuidanceUpdatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IGuidanceUpdatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGuidanceUpdatedEventArgs := IGuidanceUpdatedEventArgs(outPtr)
        }

        return this.__IGuidanceUpdatedEventArgs.get_TimeToDestination()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_RoadName() {
        if (!this.HasProp("__IGuidanceUpdatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IGuidanceUpdatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGuidanceUpdatedEventArgs := IGuidanceUpdatedEventArgs(outPtr)
        }

        return this.__IGuidanceUpdatedEventArgs.get_RoadName()
    }

    /**
     * 
     * @returns {GuidanceRoute} 
     */
    get_Route() {
        if (!this.HasProp("__IGuidanceUpdatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IGuidanceUpdatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGuidanceUpdatedEventArgs := IGuidanceUpdatedEventArgs(outPtr)
        }

        return this.__IGuidanceUpdatedEventArgs.get_Route()
    }

    /**
     * 
     * @returns {GuidanceMapMatchedCoordinate} 
     */
    get_CurrentLocation() {
        if (!this.HasProp("__IGuidanceUpdatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IGuidanceUpdatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGuidanceUpdatedEventArgs := IGuidanceUpdatedEventArgs(outPtr)
        }

        return this.__IGuidanceUpdatedEventArgs.get_CurrentLocation()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsNewManeuver() {
        if (!this.HasProp("__IGuidanceUpdatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IGuidanceUpdatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGuidanceUpdatedEventArgs := IGuidanceUpdatedEventArgs(outPtr)
        }

        return this.__IGuidanceUpdatedEventArgs.get_IsNewManeuver()
    }

    /**
     * 
     * @returns {IVectorView<GuidanceLaneInfo>} 
     */
    get_LaneInfo() {
        if (!this.HasProp("__IGuidanceUpdatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IGuidanceUpdatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGuidanceUpdatedEventArgs := IGuidanceUpdatedEventArgs(outPtr)
        }

        return this.__IGuidanceUpdatedEventArgs.get_LaneInfo()
    }

;@endregion Instance Methods
}

#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGuidanceRoute.ahk
#Include .\IGuidanceRouteStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a route for which navigational guidance is provided.
  * 
  * > [!NOTE]
  * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.services.maps.guidance.guidanceroute
 * @namespace Windows.Services.Maps.Guidance
 * @version WindowsRuntime 1.4
 */
class GuidanceRoute extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGuidanceRoute

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGuidanceRoute.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Checks if the specified [MapRoute](../windows.services.maps/maproute.md) object can be converted to a [GuidanceRoute](guidanceroute.md) object.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
     * @param {MapRoute} mapRoute_ The potential route to be navigated.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.guidance.guidanceroute.cancreatefrommaproute
     */
    static CanCreateFromMapRoute(mapRoute_) {
        if (!GuidanceRoute.HasProp("__IGuidanceRouteStatics")) {
            activatableClassId := HSTRING.Create("Windows.Services.Maps.Guidance.GuidanceRoute")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGuidanceRouteStatics.IID)
            GuidanceRoute.__IGuidanceRouteStatics := IGuidanceRouteStatics(factoryPtr)
        }

        return GuidanceRoute.__IGuidanceRouteStatics.CanCreateFromMapRoute(mapRoute_)
    }

    /**
     * Creates a [GuidanceRoute](guidanceroute.md) object that's based on the specified [MapRoute](../windows.services.maps/maproute.md).
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
     * @param {MapRoute} mapRoute_ The potential route to be navigated.
     * @returns {GuidanceRoute} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.guidance.guidanceroute.trycreatefrommaproute
     */
    static TryCreateFromMapRoute(mapRoute_) {
        if (!GuidanceRoute.HasProp("__IGuidanceRouteStatics")) {
            activatableClassId := HSTRING.Create("Windows.Services.Maps.Guidance.GuidanceRoute")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGuidanceRouteStatics.IID)
            GuidanceRoute.__IGuidanceRouteStatics := IGuidanceRouteStatics(factoryPtr)
        }

        return GuidanceRoute.__IGuidanceRouteStatics.TryCreateFromMapRoute(mapRoute_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the estimated travel time of the route.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.guidance.guidanceroute.duration
     * @type {TimeSpan} 
     */
    Duration {
        get => this.get_Duration()
    }

    /**
     * Gets the total distance of the route in meters.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.guidance.guidanceroute.distance
     * @type {Integer} 
     */
    Distance {
        get => this.get_Distance()
    }

    /**
     * Gets a list of maneuvers required to navigate the route.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.guidance.guidanceroute.maneuvers
     * @type {IVectorView<GuidanceManeuver>} 
     */
    Maneuvers {
        get => this.get_Maneuvers()
    }

    /**
     * Gets the geographic area that contains the route.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.guidance.guidanceroute.boundingbox
     * @type {GeoboundingBox} 
     */
    BoundingBox {
        get => this.get_BoundingBox()
    }

    /**
     * Gets an ordered series of geographic points along the route.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.guidance.guidanceroute.path
     * @type {Geopath} 
     */
    Path {
        get => this.get_Path()
    }

    /**
     * Gets a list of road segments, ordered from start to finish, that make up the route.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.guidance.guidanceroute.roadsegments
     * @type {IVectorView<GuidanceRoadSegment>} 
     */
    RoadSegments {
        get => this.get_RoadSegments()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_Duration() {
        if (!this.HasProp("__IGuidanceRoute")) {
            if ((queryResult := this.QueryInterface(IGuidanceRoute.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGuidanceRoute := IGuidanceRoute(outPtr)
        }

        return this.__IGuidanceRoute.get_Duration()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Distance() {
        if (!this.HasProp("__IGuidanceRoute")) {
            if ((queryResult := this.QueryInterface(IGuidanceRoute.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGuidanceRoute := IGuidanceRoute(outPtr)
        }

        return this.__IGuidanceRoute.get_Distance()
    }

    /**
     * 
     * @returns {IVectorView<GuidanceManeuver>} 
     */
    get_Maneuvers() {
        if (!this.HasProp("__IGuidanceRoute")) {
            if ((queryResult := this.QueryInterface(IGuidanceRoute.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGuidanceRoute := IGuidanceRoute(outPtr)
        }

        return this.__IGuidanceRoute.get_Maneuvers()
    }

    /**
     * 
     * @returns {GeoboundingBox} 
     */
    get_BoundingBox() {
        if (!this.HasProp("__IGuidanceRoute")) {
            if ((queryResult := this.QueryInterface(IGuidanceRoute.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGuidanceRoute := IGuidanceRoute(outPtr)
        }

        return this.__IGuidanceRoute.get_BoundingBox()
    }

    /**
     * 
     * @returns {Geopath} 
     */
    get_Path() {
        if (!this.HasProp("__IGuidanceRoute")) {
            if ((queryResult := this.QueryInterface(IGuidanceRoute.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGuidanceRoute := IGuidanceRoute(outPtr)
        }

        return this.__IGuidanceRoute.get_Path()
    }

    /**
     * 
     * @returns {IVectorView<GuidanceRoadSegment>} 
     */
    get_RoadSegments() {
        if (!this.HasProp("__IGuidanceRoute")) {
            if ((queryResult := this.QueryInterface(IGuidanceRoute.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGuidanceRoute := IGuidanceRoute(outPtr)
        }

        return this.__IGuidanceRoute.get_RoadSegments()
    }

    /**
     * Creates a [MapRoute](../windows.services.maps/maproute.md) object that's based on the current [GuidanceRoute](guidanceroute.md).
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
     * @returns {MapRoute} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.guidance.guidanceroute.converttomaproute
     */
    ConvertToMapRoute() {
        if (!this.HasProp("__IGuidanceRoute")) {
            if ((queryResult := this.QueryInterface(IGuidanceRoute.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGuidanceRoute := IGuidanceRoute(outPtr)
        }

        return this.__IGuidanceRoute.ConvertToMapRoute()
    }

;@endregion Instance Methods
}

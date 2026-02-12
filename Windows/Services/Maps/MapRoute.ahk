#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMapRoute.ahk
#Include .\IMapRoute2.ahk
#Include .\IMapRoute3.ahk
#Include .\IMapRoute4.ahk
#Include ..\..\..\Guid.ahk

/**
 * [Deprecated - see Remarks.] Represents a path to be traveled between two or more waypoints.
 * @remarks
 * > [!IMPORTANT]
 * > The UWP [MapControl](../windows.ui.xaml.controls.maps/mapcontrol.md) and Windows Maps platform APIs ([Windows.Services.Maps.*](../windows.services.maps/windows_services_maps.md)) are deprecated and may not be available in future versions of Windows. For more information, see [Resources for deprecated features](/windows/whats-new/deprecated-features-resources#windows-uwp-map-control-and-windows-maps-platform-apis).
 * 
 * > [!IMPORTANT]
 * > **Bing Maps for Enterprise service retirement**
 * >
 * > The UWP [MapControl](../windows.ui.xaml.controls.maps/mapcontrol.md) and map services from the [Windows.Services.Maps](windows_services_maps.md) namespaces rely on Bing Maps. Bing Maps for Enterprise is deprecated and will be retired, at which point the MapControl and services will no longer receive data.
 * >
 * > For more information, see the [Bing Maps Developer Center](https://www.bingmapsportal.com/) and [Bing Maps documentation](/bingmaps/getting-started/).
 * 
 * A MapRoute object is returned through the [Route](maproutefinderresult_route.md) property of the [MapRouteFinderResult](maproutefinderresult.md) when you call the methods of the [MapRouteFinder](maproutefinder.md) class.
 * 
 * To display a MapRoute on a [MapControl](../windows.ui.xaml.controls.maps/mapcontrol.md), construct a [MapRouteView](../windows.ui.xaml.controls.maps/maprouteview.md) with the MapRoute and add the [MapRouteView](../windows.ui.xaml.controls.maps/maprouteview.md) to the [Routes](../windows.ui.xaml.controls.maps/mapcontrol_routes.md) collection of the [MapControl](../windows.ui.xaml.controls.maps/mapcontrol.md).
 * 
 * Your app must be authenticated before it can use the [MapControl](../windows.ui.xaml.controls.maps/mapcontrol.md) and map services in the [Windows.Services.Maps](windows_services_maps.md) namespace. To authenticate your app, you must specify a maps authentication key.
 * 
 * See [Request a maps authentication key](/windows/uwp/maps-and-location/authentication-key).
 * @see https://learn.microsoft.com/uwp/api/windows.services.maps.maproute
 * @namespace Windows.Services.Maps
 * @version WindowsRuntime 1.4
 */
class MapRoute extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMapRoute

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMapRoute.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the bounding box that contains the route.
     * @remarks
     * If you want to display this bounding box in the [MapControl](../windows.ui.xaml.controls.maps/mapcontrol.md), use one of the overloads of the [TrySetViewAsync](../windows.ui.xaml.controls.maps/mapcontrol_trysetviewasync_117228238.md) method that accepts a [GeoboundingBox](../windows.devices.geolocation/geoboundingbox.md) as input.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.maproute.boundingbox
     * @type {GeoboundingBox} 
     */
    BoundingBox {
        get => this.get_BoundingBox()
    }

    /**
     * Gets the length of the route in meters.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.maproute.lengthinmeters
     * @type {Float} 
     */
    LengthInMeters {
        get => this.get_LengthInMeters()
    }

    /**
     * Gets the estimated time required to traverse the route.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.maproute.estimatedduration
     * @type {TimeSpan} 
     */
    EstimatedDuration {
        get => this.get_EstimatedDuration()
    }

    /**
     * Gets the path of the route.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.maproute.path
     * @type {Geopath} 
     */
    Path {
        get => this.get_Path()
    }

    /**
     * Gets the list of legs associated with the route.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.maproute.legs
     * @type {IVectorView<MapRouteLeg>} 
     */
    Legs {
        get => this.get_Legs()
    }

    /**
     * Gets a value indicating whether the [MapRoute](maproute.md) is based on traffic.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.maproute.istrafficbased
     * @type {Boolean} 
     */
    IsTrafficBased {
        get => this.get_IsTrafficBased()
    }

    /**
     * Gets a value that indicates if any restrictions have been violated by the route.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.maproute.violatedrestrictions
     * @type {Integer} 
     */
    ViolatedRestrictions {
        get => this.get_ViolatedRestrictions()
    }

    /**
     * Gets a value that indicates the route has been modified from the "best" route to avoid blocked roads.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.maproute.hasblockedroads
     * @type {Boolean} 
     */
    HasBlockedRoads {
        get => this.get_HasBlockedRoads()
    }

    /**
     * Gets the estimated time required to traverse the route without traffic.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.maproute.durationwithouttraffic
     * @type {TimeSpan} 
     */
    DurationWithoutTraffic {
        get => this.get_DurationWithoutTraffic()
    }

    /**
     * Gets the level of traffic congestion along a map route.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.maproute.trafficcongestion
     * @type {Integer} 
     */
    TrafficCongestion {
        get => this.get_TrafficCongestion()
    }

    /**
     * Gets a value that indicates whether the [MapRoute](maproute.md) is based on scenic roads.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.maproute.isscenic
     * @type {Boolean} 
     */
    IsScenic {
        get => this.get_IsScenic()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {GeoboundingBox} 
     */
    get_BoundingBox() {
        if (!this.HasProp("__IMapRoute")) {
            if ((queryResult := this.QueryInterface(IMapRoute.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapRoute := IMapRoute(outPtr)
        }

        return this.__IMapRoute.get_BoundingBox()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_LengthInMeters() {
        if (!this.HasProp("__IMapRoute")) {
            if ((queryResult := this.QueryInterface(IMapRoute.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapRoute := IMapRoute(outPtr)
        }

        return this.__IMapRoute.get_LengthInMeters()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_EstimatedDuration() {
        if (!this.HasProp("__IMapRoute")) {
            if ((queryResult := this.QueryInterface(IMapRoute.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapRoute := IMapRoute(outPtr)
        }

        return this.__IMapRoute.get_EstimatedDuration()
    }

    /**
     * 
     * @returns {Geopath} 
     */
    get_Path() {
        if (!this.HasProp("__IMapRoute")) {
            if ((queryResult := this.QueryInterface(IMapRoute.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapRoute := IMapRoute(outPtr)
        }

        return this.__IMapRoute.get_Path()
    }

    /**
     * 
     * @returns {IVectorView<MapRouteLeg>} 
     */
    get_Legs() {
        if (!this.HasProp("__IMapRoute")) {
            if ((queryResult := this.QueryInterface(IMapRoute.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapRoute := IMapRoute(outPtr)
        }

        return this.__IMapRoute.get_Legs()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsTrafficBased() {
        if (!this.HasProp("__IMapRoute")) {
            if ((queryResult := this.QueryInterface(IMapRoute.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapRoute := IMapRoute(outPtr)
        }

        return this.__IMapRoute.get_IsTrafficBased()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ViolatedRestrictions() {
        if (!this.HasProp("__IMapRoute2")) {
            if ((queryResult := this.QueryInterface(IMapRoute2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapRoute2 := IMapRoute2(outPtr)
        }

        return this.__IMapRoute2.get_ViolatedRestrictions()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasBlockedRoads() {
        if (!this.HasProp("__IMapRoute2")) {
            if ((queryResult := this.QueryInterface(IMapRoute2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapRoute2 := IMapRoute2(outPtr)
        }

        return this.__IMapRoute2.get_HasBlockedRoads()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_DurationWithoutTraffic() {
        if (!this.HasProp("__IMapRoute3")) {
            if ((queryResult := this.QueryInterface(IMapRoute3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapRoute3 := IMapRoute3(outPtr)
        }

        return this.__IMapRoute3.get_DurationWithoutTraffic()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TrafficCongestion() {
        if (!this.HasProp("__IMapRoute3")) {
            if ((queryResult := this.QueryInterface(IMapRoute3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapRoute3 := IMapRoute3(outPtr)
        }

        return this.__IMapRoute3.get_TrafficCongestion()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsScenic() {
        if (!this.HasProp("__IMapRoute4")) {
            if ((queryResult := this.QueryInterface(IMapRoute4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapRoute4 := IMapRoute4(outPtr)
        }

        return this.__IMapRoute4.get_IsScenic()
    }

;@endregion Instance Methods
}

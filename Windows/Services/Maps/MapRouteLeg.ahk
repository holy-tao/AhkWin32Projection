#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMapRouteLeg.ahk
#Include .\IMapRouteLeg2.ahk
#Include ..\..\..\Guid.ahk

/**
 * [Deprecated - see Remarks.] Represents the set of actions (maneuvers) required to travel between two waypoints along a route.
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
 * A collection of MapRouteLeg objects is returned through the [Legs](maproute_legs.md) property of a [MapRoute](maproute.md) object. A [MapRoute](maproute.md) object is returned through the [Route](maproute.md) property of the [MapRouteFinderResult](maproutefinderresult.md) when you call the methods of the [MapRouteFinder](maproutefinder.md) class.
 * 
 * Your app must be authenticated before it can use the [MapControl](../windows.ui.xaml.controls.maps/mapcontrol.md) and map services in the [Windows.Services.Maps](windows_services_maps.md) namespace. To authenticate your app, you must specify a maps authentication key.
 * 
 * See [Request a maps authentication key](/windows/uwp/maps-and-location/authentication-key).
 * @see https://learn.microsoft.com/uwp/api/windows.services.maps.maprouteleg
 * @namespace Windows.Services.Maps
 * @version WindowsRuntime 1.4
 */
class MapRouteLeg extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMapRouteLeg

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMapRouteLeg.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the bounding box that contains the route leg.
     * @remarks
     * If you want to display this bounding box in the [MapControl](../windows.ui.xaml.controls.maps/mapcontrol.md), use one of the overloads of the [TrySetViewAsync](../windows.ui.xaml.controls.maps/mapcontrol_trysetviewasync_117228238.md) method that accepts a [GeoboundingBox](../windows.devices.geolocation/geoboundingbox.md) as input.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.maprouteleg.boundingbox
     * @type {GeoboundingBox} 
     */
    BoundingBox {
        get => this.get_BoundingBox()
    }

    /**
     * Gets the path of the route leg.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.maprouteleg.path
     * @type {Geopath} 
     */
    Path {
        get => this.get_Path()
    }

    /**
     * Gets the length of the route leg in meters.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.maprouteleg.lengthinmeters
     * @type {Float} 
     */
    LengthInMeters {
        get => this.get_LengthInMeters()
    }

    /**
     * Gets the estimated time required to traverse the route leg.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.maprouteleg.estimatedduration
     * @type {TimeSpan} 
     */
    EstimatedDuration {
        get => this.get_EstimatedDuration()
    }

    /**
     * Gets the list of maneuvers associated with the route leg.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.maprouteleg.maneuvers
     * @type {IVectorView<MapRouteManeuver>} 
     */
    Maneuvers {
        get => this.get_Maneuvers()
    }

    /**
     * Gets the estimated time required to traverse the route without traffic.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.maprouteleg.durationwithouttraffic
     * @type {TimeSpan} 
     */
    DurationWithoutTraffic {
        get => this.get_DurationWithoutTraffic()
    }

    /**
     * Gets the level of traffic congestion along a map route leg.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.maprouteleg.trafficcongestion
     * @type {Integer} 
     */
    TrafficCongestion {
        get => this.get_TrafficCongestion()
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
        if (!this.HasProp("__IMapRouteLeg")) {
            if ((queryResult := this.QueryInterface(IMapRouteLeg.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapRouteLeg := IMapRouteLeg(outPtr)
        }

        return this.__IMapRouteLeg.get_BoundingBox()
    }

    /**
     * 
     * @returns {Geopath} 
     */
    get_Path() {
        if (!this.HasProp("__IMapRouteLeg")) {
            if ((queryResult := this.QueryInterface(IMapRouteLeg.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapRouteLeg := IMapRouteLeg(outPtr)
        }

        return this.__IMapRouteLeg.get_Path()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_LengthInMeters() {
        if (!this.HasProp("__IMapRouteLeg")) {
            if ((queryResult := this.QueryInterface(IMapRouteLeg.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapRouteLeg := IMapRouteLeg(outPtr)
        }

        return this.__IMapRouteLeg.get_LengthInMeters()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_EstimatedDuration() {
        if (!this.HasProp("__IMapRouteLeg")) {
            if ((queryResult := this.QueryInterface(IMapRouteLeg.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapRouteLeg := IMapRouteLeg(outPtr)
        }

        return this.__IMapRouteLeg.get_EstimatedDuration()
    }

    /**
     * 
     * @returns {IVectorView<MapRouteManeuver>} 
     */
    get_Maneuvers() {
        if (!this.HasProp("__IMapRouteLeg")) {
            if ((queryResult := this.QueryInterface(IMapRouteLeg.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapRouteLeg := IMapRouteLeg(outPtr)
        }

        return this.__IMapRouteLeg.get_Maneuvers()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_DurationWithoutTraffic() {
        if (!this.HasProp("__IMapRouteLeg2")) {
            if ((queryResult := this.QueryInterface(IMapRouteLeg2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapRouteLeg2 := IMapRouteLeg2(outPtr)
        }

        return this.__IMapRouteLeg2.get_DurationWithoutTraffic()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TrafficCongestion() {
        if (!this.HasProp("__IMapRouteLeg2")) {
            if ((queryResult := this.QueryInterface(IMapRouteLeg2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapRouteLeg2 := IMapRouteLeg2(outPtr)
        }

        return this.__IMapRouteLeg2.get_TrafficCongestion()
    }

;@endregion Instance Methods
}

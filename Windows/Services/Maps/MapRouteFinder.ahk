#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMapRouteFinderStatics2.ahk
#Include .\IMapRouteFinderStatics3.ahk
#Include .\IMapRouteFinderStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * [Deprecated - see Remarks.] Gets a route.
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
 * Your app must be authenticated before it can use the [MapControl](../windows.ui.xaml.controls.maps/mapcontrol.md) and map services in the [Windows.Services.Maps](windows_services_maps.md) namespace. To authenticate your app, you must specify a maps authentication key.
 * 
 * See [Request a maps authentication key](/windows/uwp/maps-and-location/authentication-key).
 * @see https://learn.microsoft.com/uwp/api/windows.services.maps.maproutefinder
 * @namespace Windows.Services.Maps
 * @version WindowsRuntime 1.4
 */
class MapRouteFinder extends IInspectable {
;@region Static Methods
    /**
     * Gets a driving route for the specified start and end coordinates (using optimizations and restrictions).
     * @param {Geopoint} startPoint The starting point of the driving route.
     * @param {Geopoint} endPoint The ending point of the driving route.
     * @param {MapRouteDrivingOptions} options 
     * @returns {IAsyncOperation<MapRouteFinderResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.maproutefinder.getdrivingrouteasync
     */
    static GetDrivingRouteWithOptionsAsync(startPoint, endPoint, options) {
        if (!MapRouteFinder.HasProp("__IMapRouteFinderStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Services.Maps.MapRouteFinder")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapRouteFinderStatics2.IID)
            MapRouteFinder.__IMapRouteFinderStatics2 := IMapRouteFinderStatics2(factoryPtr)
        }

        return MapRouteFinder.__IMapRouteFinderStatics2.GetDrivingRouteWithOptionsAsync(startPoint, endPoint, options)
    }

    /**
     * Gets a driving route for the specified waypoints (using optimizations).
     * @param {IIterable<EnhancedWaypoint>} waypoints A collection of stop, start, or intermediate waypoint that a route must pass through.
     * @returns {IAsyncOperation<MapRouteFinderResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.maproutefinder.getdrivingroutefromenhancedwaypointsasync
     */
    static GetDrivingRouteFromEnhancedWaypointsAsync(waypoints) {
        if (!MapRouteFinder.HasProp("__IMapRouteFinderStatics3")) {
            activatableClassId := HSTRING.Create("Windows.Services.Maps.MapRouteFinder")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapRouteFinderStatics3.IID)
            MapRouteFinder.__IMapRouteFinderStatics3 := IMapRouteFinderStatics3(factoryPtr)
        }

        return MapRouteFinder.__IMapRouteFinderStatics3.GetDrivingRouteFromEnhancedWaypointsAsync(waypoints)
    }

    /**
     * Gets a driving route for the specified waypoints (using optimizations).
     * @param {IIterable<EnhancedWaypoint>} waypoints A collection of stop, start, or intermediate waypoint that a route must pass through.
     * @param {MapRouteDrivingOptions} options 
     * @returns {IAsyncOperation<MapRouteFinderResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.maproutefinder.getdrivingroutefromenhancedwaypointsasync
     */
    static GetDrivingRouteFromEnhancedWaypointsWithOptionsAsync(waypoints, options) {
        if (!MapRouteFinder.HasProp("__IMapRouteFinderStatics3")) {
            activatableClassId := HSTRING.Create("Windows.Services.Maps.MapRouteFinder")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapRouteFinderStatics3.IID)
            MapRouteFinder.__IMapRouteFinderStatics3 := IMapRouteFinderStatics3(factoryPtr)
        }

        return MapRouteFinder.__IMapRouteFinderStatics3.GetDrivingRouteFromEnhancedWaypointsWithOptionsAsync(waypoints, options)
    }

    /**
     * Gets a driving route for the specified start and end coordinates (using optimizations).
     * @param {Geopoint} startPoint The starting point of the driving route.
     * @param {Geopoint} endPoint The ending point of the driving route.
     * @returns {IAsyncOperation<MapRouteFinderResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.maproutefinder.getdrivingrouteasync
     */
    static GetDrivingRouteAsync(startPoint, endPoint) {
        if (!MapRouteFinder.HasProp("__IMapRouteFinderStatics")) {
            activatableClassId := HSTRING.Create("Windows.Services.Maps.MapRouteFinder")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapRouteFinderStatics.IID)
            MapRouteFinder.__IMapRouteFinderStatics := IMapRouteFinderStatics(factoryPtr)
        }

        return MapRouteFinder.__IMapRouteFinderStatics.GetDrivingRouteAsync(startPoint, endPoint)
    }

    /**
     * Gets a driving route for the specified start and end coordinates (using optimizations and restrictions).
     * @param {Geopoint} startPoint The starting point of the driving route.
     * @param {Geopoint} endPoint The ending point of the driving route.
     * @param {Integer} optimization The optimizations to apply when calculating the driving route.
     * @returns {IAsyncOperation<MapRouteFinderResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.maproutefinder.getdrivingrouteasync
     */
    static GetDrivingRouteWithOptimizationAsync(startPoint, endPoint, optimization) {
        if (!MapRouteFinder.HasProp("__IMapRouteFinderStatics")) {
            activatableClassId := HSTRING.Create("Windows.Services.Maps.MapRouteFinder")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapRouteFinderStatics.IID)
            MapRouteFinder.__IMapRouteFinderStatics := IMapRouteFinderStatics(factoryPtr)
        }

        return MapRouteFinder.__IMapRouteFinderStatics.GetDrivingRouteWithOptimizationAsync(startPoint, endPoint, optimization)
    }

    /**
     * Gets a driving route for the specified start and end coordinates (using optimizations, restrictions, and heading).
     * @param {Geopoint} startPoint The starting point of the driving route.
     * @param {Geopoint} endPoint The ending point of the driving route.
     * @param {Integer} optimization The optimizations to apply when calculating the driving route.
     * @param {Integer} restrictions_ The restrictions to apply when calculating the driving route.
     * @returns {IAsyncOperation<MapRouteFinderResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.maproutefinder.getdrivingrouteasync
     */
    static GetDrivingRouteWithOptimizationAndRestrictionsAsync(startPoint, endPoint, optimization, restrictions_) {
        if (!MapRouteFinder.HasProp("__IMapRouteFinderStatics")) {
            activatableClassId := HSTRING.Create("Windows.Services.Maps.MapRouteFinder")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapRouteFinderStatics.IID)
            MapRouteFinder.__IMapRouteFinderStatics := IMapRouteFinderStatics(factoryPtr)
        }

        return MapRouteFinder.__IMapRouteFinderStatics.GetDrivingRouteWithOptimizationAndRestrictionsAsync(startPoint, endPoint, optimization, restrictions_)
    }

    /**
     * Gets a driving route for the specified start and end coordinates.
     * @param {Geopoint} startPoint The starting point of the driving route.
     * @param {Geopoint} endPoint The ending point of the driving route.
     * @param {Integer} optimization 
     * @param {Integer} restrictions_ 
     * @param {Float} headingInDegrees 
     * @returns {IAsyncOperation<MapRouteFinderResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.maproutefinder.getdrivingrouteasync
     */
    static GetDrivingRouteWithOptimizationRestrictionsAndHeadingAsync(startPoint, endPoint, optimization, restrictions_, headingInDegrees) {
        if (!MapRouteFinder.HasProp("__IMapRouteFinderStatics")) {
            activatableClassId := HSTRING.Create("Windows.Services.Maps.MapRouteFinder")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapRouteFinderStatics.IID)
            MapRouteFinder.__IMapRouteFinderStatics := IMapRouteFinderStatics(factoryPtr)
        }

        return MapRouteFinder.__IMapRouteFinderStatics.GetDrivingRouteWithOptimizationRestrictionsAndHeadingAsync(startPoint, endPoint, optimization, restrictions_, headingInDegrees)
    }

    /**
     * Gets a driving route for the specified waypoints.
     * @param {IIterable<Geopoint>} wayPoints The start and end coordinates and optional waypoints of the driving route.
     * @returns {IAsyncOperation<MapRouteFinderResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.maproutefinder.getdrivingroutefromwaypointsasync
     */
    static GetDrivingRouteFromWaypointsAsync(wayPoints) {
        if (!MapRouteFinder.HasProp("__IMapRouteFinderStatics")) {
            activatableClassId := HSTRING.Create("Windows.Services.Maps.MapRouteFinder")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapRouteFinderStatics.IID)
            MapRouteFinder.__IMapRouteFinderStatics := IMapRouteFinderStatics(factoryPtr)
        }

        return MapRouteFinder.__IMapRouteFinderStatics.GetDrivingRouteFromWaypointsAsync(wayPoints)
    }

    /**
     * Gets a driving route for the specified waypoints (using optimizations and restrictions).
     * @param {IIterable<Geopoint>} wayPoints The start and end coordinates and optional waypoints of the driving route.
     * @param {Integer} optimization The optimizations to apply when calculating the driving route.
     * @returns {IAsyncOperation<MapRouteFinderResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.maproutefinder.getdrivingroutefromwaypointsasync
     */
    static GetDrivingRouteFromWaypointsAndOptimizationAsync(wayPoints, optimization) {
        if (!MapRouteFinder.HasProp("__IMapRouteFinderStatics")) {
            activatableClassId := HSTRING.Create("Windows.Services.Maps.MapRouteFinder")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapRouteFinderStatics.IID)
            MapRouteFinder.__IMapRouteFinderStatics := IMapRouteFinderStatics(factoryPtr)
        }

        return MapRouteFinder.__IMapRouteFinderStatics.GetDrivingRouteFromWaypointsAndOptimizationAsync(wayPoints, optimization)
    }

    /**
     * Gets a driving route for the specified waypoints (using optimizations, restrictions, and heading).
     * @param {IIterable<Geopoint>} wayPoints The start and end coordinates and optional waypoints of the driving route.
     * @param {Integer} optimization The optimizations to apply when calculating the driving route.
     * @param {Integer} restrictions_ The restrictions to apply when calculating the driving route.
     * @returns {IAsyncOperation<MapRouteFinderResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.maproutefinder.getdrivingroutefromwaypointsasync
     */
    static GetDrivingRouteFromWaypointsOptimizationAndRestrictionsAsync(wayPoints, optimization, restrictions_) {
        if (!MapRouteFinder.HasProp("__IMapRouteFinderStatics")) {
            activatableClassId := HSTRING.Create("Windows.Services.Maps.MapRouteFinder")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapRouteFinderStatics.IID)
            MapRouteFinder.__IMapRouteFinderStatics := IMapRouteFinderStatics(factoryPtr)
        }

        return MapRouteFinder.__IMapRouteFinderStatics.GetDrivingRouteFromWaypointsOptimizationAndRestrictionsAsync(wayPoints, optimization, restrictions_)
    }

    /**
     * Gets a driving route for the specified waypoints (using optimizations).
     * @param {IIterable<Geopoint>} wayPoints The start and end coordinates and optional waypoints of the driving route.
     * @param {Integer} optimization 
     * @param {Integer} restrictions_ 
     * @param {Float} headingInDegrees 
     * @returns {IAsyncOperation<MapRouteFinderResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.maproutefinder.getdrivingroutefromwaypointsasync
     */
    static GetDrivingRouteFromWaypointsOptimizationRestrictionsAndHeadingAsync(wayPoints, optimization, restrictions_, headingInDegrees) {
        if (!MapRouteFinder.HasProp("__IMapRouteFinderStatics")) {
            activatableClassId := HSTRING.Create("Windows.Services.Maps.MapRouteFinder")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapRouteFinderStatics.IID)
            MapRouteFinder.__IMapRouteFinderStatics := IMapRouteFinderStatics(factoryPtr)
        }

        return MapRouteFinder.__IMapRouteFinderStatics.GetDrivingRouteFromWaypointsOptimizationRestrictionsAndHeadingAsync(wayPoints, optimization, restrictions_, headingInDegrees)
    }

    /**
     * Gets a walking route using the specified start and end coordinates.
     * @param {Geopoint} startPoint The starting point of the walking route.
     * @param {Geopoint} endPoint The ending point of the walking route.
     * @returns {IAsyncOperation<MapRouteFinderResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.maproutefinder.getwalkingrouteasync
     */
    static GetWalkingRouteAsync(startPoint, endPoint) {
        if (!MapRouteFinder.HasProp("__IMapRouteFinderStatics")) {
            activatableClassId := HSTRING.Create("Windows.Services.Maps.MapRouteFinder")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapRouteFinderStatics.IID)
            MapRouteFinder.__IMapRouteFinderStatics := IMapRouteFinderStatics(factoryPtr)
        }

        return MapRouteFinder.__IMapRouteFinderStatics.GetWalkingRouteAsync(startPoint, endPoint)
    }

    /**
     * Gets a walking route using the specified waypoints.
     * @param {IIterable<Geopoint>} wayPoints The start and end coordinates and optional waypoints of the walking route.
     * @returns {IAsyncOperation<MapRouteFinderResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.maproutefinder.getwalkingroutefromwaypointsasync
     */
    static GetWalkingRouteFromWaypointsAsync(wayPoints) {
        if (!MapRouteFinder.HasProp("__IMapRouteFinderStatics")) {
            activatableClassId := HSTRING.Create("Windows.Services.Maps.MapRouteFinder")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapRouteFinderStatics.IID)
            MapRouteFinder.__IMapRouteFinderStatics := IMapRouteFinderStatics(factoryPtr)
        }

        return MapRouteFinder.__IMapRouteFinderStatics.GetWalkingRouteFromWaypointsAsync(wayPoints)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}

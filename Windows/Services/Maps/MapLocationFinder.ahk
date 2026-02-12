#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMapLocationFinderStatics2.ahk
#Include .\IMapLocationFinderStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * [Deprecated - see Remarks.] Provides methods to convert addresses to geographic locations (geocoding) and to convert geographic locations to addresses (reverse geocoding).
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
 * @see https://learn.microsoft.com/uwp/api/windows.services.maps.maplocationfinder
 * @namespace Windows.Services.Maps
 * @version WindowsRuntime 1.4
 */
class MapLocationFinder extends IInspectable {
;@region Static Methods
    /**
     * Converts a geographic location to a collection of addresses (reverse geocoding).
     * @param {Geopoint} queryPoint The point for which you want to get locations.
     * @param {Integer} accuracy 
     * @returns {IAsyncOperation<MapLocationFinderResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.maplocationfinder.findlocationsatasync
     */
    static FindLocationsAtWithAccuracyAsync(queryPoint, accuracy) {
        if (!MapLocationFinder.HasProp("__IMapLocationFinderStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Services.Maps.MapLocationFinder")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapLocationFinderStatics2.IID)
            MapLocationFinder.__IMapLocationFinderStatics2 := IMapLocationFinderStatics2(factoryPtr)
        }

        return MapLocationFinder.__IMapLocationFinderStatics2.FindLocationsAtWithAccuracyAsync(queryPoint, accuracy)
    }

    /**
     * Converts a geopoint to a collection of addresses with the desired accuracy (reverse geocoding).
     * @param {Geopoint} queryPoint The point for which you want to get locations.
     * @returns {IAsyncOperation<MapLocationFinderResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.maplocationfinder.findlocationsatasync
     */
    static FindLocationsAtAsync(queryPoint) {
        if (!MapLocationFinder.HasProp("__IMapLocationFinderStatics")) {
            activatableClassId := HSTRING.Create("Windows.Services.Maps.MapLocationFinder")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapLocationFinderStatics.IID)
            MapLocationFinder.__IMapLocationFinderStatics := IMapLocationFinderStatics(factoryPtr)
        }

        return MapLocationFinder.__IMapLocationFinderStatics.FindLocationsAtAsync(queryPoint)
    }

    /**
     * Converts the specified address to a collection of geographic locations (geocoding), using the specified reference point as a query hint. The list contains no more than the specified maximum number of results.
     * @param {HSTRING} searchText The query for which you want to get locations.
     * @param {Geopoint} referencePoint A reference point that provides a query hint.
     * @returns {IAsyncOperation<MapLocationFinderResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.maplocationfinder.findlocationsasync
     */
    static FindLocationsAsync(searchText, referencePoint) {
        if (!MapLocationFinder.HasProp("__IMapLocationFinderStatics")) {
            activatableClassId := HSTRING.Create("Windows.Services.Maps.MapLocationFinder")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapLocationFinderStatics.IID)
            MapLocationFinder.__IMapLocationFinderStatics := IMapLocationFinderStatics(factoryPtr)
        }

        return MapLocationFinder.__IMapLocationFinderStatics.FindLocationsAsync(searchText, referencePoint)
    }

    /**
     * Converts the specified address to a collection of geographic locations (geocoding), using the specified reference point as a query hint.
     * @param {HSTRING} searchText The query for which you want to get locations.
     * @param {Geopoint} referencePoint A reference point that provides a query hint.
     * @param {Integer} maxCount 
     * @returns {IAsyncOperation<MapLocationFinderResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.maplocationfinder.findlocationsasync
     */
    static FindLocationsWithMaxCountAsync(searchText, referencePoint, maxCount) {
        if (!MapLocationFinder.HasProp("__IMapLocationFinderStatics")) {
            activatableClassId := HSTRING.Create("Windows.Services.Maps.MapLocationFinder")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapLocationFinderStatics.IID)
            MapLocationFinder.__IMapLocationFinderStatics := IMapLocationFinderStatics(factoryPtr)
        }

        return MapLocationFinder.__IMapLocationFinderStatics.FindLocationsWithMaxCountAsync(searchText, referencePoint, maxCount)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * [Deprecated - see Remarks.] Specifies the restrictions applied to a route. This enumeration provides values for certain parameters of some overloads of the [GetDrivingRouteAsync](maproutefinder_getdrivingrouteasync_1041948120.md) and [GetDrivingRouteFromWaypointsAsync](maproutefinder_getdrivingroutefromwaypointsasync_1378129125.md) methods.
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
 * @see https://learn.microsoft.com/uwp/api/windows.services.maps.maprouterestrictions
 * @namespace Windows.Services.Maps
 * @version WindowsRuntime 1.4
 */
class MapRouteRestrictions extends Win32BitflagEnum{

    /**
     * No restrictions are applied to the route.
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * Avoid highways.
     * @type {Integer (UInt32)}
     */
    static Highways => 1

    /**
     * Avoid toll roads.
     * @type {Integer (UInt32)}
     */
    static TollRoads => 2

    /**
     * Avoid ferries.
     * @type {Integer (UInt32)}
     */
    static Ferries => 4

    /**
     * Avoid tunnels.
     * @type {Integer (UInt32)}
     */
    static Tunnels => 8

    /**
     * Avoid dirt roads.
     * @type {Integer (UInt32)}
     */
    static DirtRoads => 16

    /**
     * Avoid motorail train services.
     * @type {Integer (UInt32)}
     */
    static Motorail => 32
}

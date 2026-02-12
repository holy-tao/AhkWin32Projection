#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * [Deprecated - see Remarks.] Returns the status of a [MapRouteFinder](maproutefinder.md) query. This enumeration provides values for the [Status](maproutefinderresult_status.md) property of a [MapRouteFinderResult](maproutefinderresult.md).
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
 * @see https://learn.microsoft.com/uwp/api/windows.services.maps.maproutefinderstatus
 * @namespace Windows.Services.Maps
 * @version WindowsRuntime 1.4
 */
class MapRouteFinderStatus extends Win32Enum{

    /**
     * The query was successful.
     * @type {Integer (Int32)}
     */
    static Success => 0

    /**
     * The query returned an unknown error.
     * @type {Integer (Int32)}
     */
    static UnknownError => 1

    /**
     * The query provided credentials that are not valid.
     * @type {Integer (Int32)}
     */
    static InvalidCredentials => 2

    /**
     * The query did not find a route.
     * @type {Integer (Int32)}
     */
    static NoRouteFound => 3

    /**
     * The query did not find a route with the specified options.
     * @type {Integer (Int32)}
     */
    static NoRouteFoundWithGivenOptions => 4

    /**
     * The specified starting point is not valid in a route. For example, the point is in an ocean or a desert.
     * @type {Integer (Int32)}
     */
    static StartPointNotFound => 5

    /**
     * The specified ending point is not valid in a route. For example, the point is in an ocean or a desert.
     * @type {Integer (Int32)}
     */
    static EndPointNotFound => 6

    /**
     * The query did not find a pedestrian route.
     * @type {Integer (Int32)}
     */
    static NoPedestrianRouteFound => 7

    /**
     * The query encountered a network failure.
     * @type {Integer (Int32)}
     */
    static NetworkFailure => 8

    /**
     * The query is not supported.
     * @type {Integer (Int32)}
     */
    static NotSupported => 9
}

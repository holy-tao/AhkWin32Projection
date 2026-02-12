#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * [Deprecated - see Remarks.] Returns the status of a [MapLocationFinder](maplocationfinder.md) query. This enumeration provides values for the [Status](maplocationfinderresult_status.md) property of a [MapLocationFinderResult](maplocationfinderresult.md).
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
 * @see https://learn.microsoft.com/uwp/api/windows.services.maps.maplocationfinderstatus
 * @namespace Windows.Services.Maps
 * @version WindowsRuntime 1.4
 */
class MapLocationFinderStatus extends Win32Enum{

    /**
     * Query search operation was successful. Check result size before accessing results.
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
     * The specified point cannot be converted to a location. For example, the point is in an ocean or a desert.
     * @type {Integer (Int32)}
     */
    static BadLocation => 3

    /**
     * The query encountered an internal error.
     * @type {Integer (Int32)}
     */
    static IndexFailure => 4

    /**
     * The query encountered a network failure.
     * @type {Integer (Int32)}
     */
    static NetworkFailure => 5

    /**
     * The query is not supported.
     * @type {Integer (Int32)}
     */
    static NotSupported => 6
}

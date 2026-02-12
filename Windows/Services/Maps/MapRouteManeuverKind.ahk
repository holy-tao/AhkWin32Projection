#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * [Deprecated - see Remarks.] Describes the various types of maneuvers that can occur in a route. This enumeration provides values for the [Kind](maproutemaneuver_kind.md) property of a [MapRouteManeuver](maproutemaneuver.md).
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
 * @see https://learn.microsoft.com/uwp/api/windows.services.maps.maproutemaneuverkind
 * @namespace Windows.Services.Maps
 * @version WindowsRuntime 1.4
 */
class MapRouteManeuverKind extends Win32Enum{

    /**
     * The maneuver is not defined.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * The start of the route.
     * @type {Integer (Int32)}
     */
    static Start => 1

    /**
     * A stopover on the route.
     * @type {Integer (Int32)}
     */
    static Stopover => 2

    /**
     * The route has resumed after a stopover.
     * @type {Integer (Int32)}
     */
    static StopoverResume => 3

    /**
     * The end of the route.
     * @type {Integer (Int32)}
     */
    static End => 4

    /**
     * Go straight.
     * @type {Integer (Int32)}
     */
    static GoStraight => 5

    /**
     * Make a U-turn to the left.
     * @type {Integer (Int32)}
     */
    static UTurnLeft => 6

    /**
     * Make a U-turn to the right.
     * @type {Integer (Int32)}
     */
    static UTurnRight => 7

    /**
     * Keep left.
     * @type {Integer (Int32)}
     */
    static TurnKeepLeft => 8

    /**
     * Keep right.
     * @type {Integer (Int32)}
     */
    static TurnKeepRight => 9

    /**
     * Make a gentle left turn.
     * @type {Integer (Int32)}
     */
    static TurnLightLeft => 10

    /**
     * Make a gentle right turn.
     * @type {Integer (Int32)}
     */
    static TurnLightRight => 11

    /**
     * Turn left.
     * @type {Integer (Int32)}
     */
    static TurnLeft => 12

    /**
     * Turn right.
     * @type {Integer (Int32)}
     */
    static TurnRight => 13

    /**
     * Make a hard left turn.
     * @type {Integer (Int32)}
     */
    static TurnHardLeft => 14

    /**
     * Make a hard right turn.
     * @type {Integer (Int32)}
     */
    static TurnHardRight => 15

    /**
     * Enter the freeway on the left.
     * @type {Integer (Int32)}
     */
    static FreewayEnterLeft => 16

    /**
     * Enter the freeway on the right.
     * @type {Integer (Int32)}
     */
    static FreewayEnterRight => 17

    /**
     * Leave the freeway on the left.
     * @type {Integer (Int32)}
     */
    static FreewayLeaveLeft => 18

    /**
     * Leave the freeway on the right.
     * @type {Integer (Int32)}
     */
    static FreewayLeaveRight => 19

    /**
     * Continue on the freeway on the left.
     * @type {Integer (Int32)}
     */
    static FreewayContinueLeft => 20

    /**
     * Continue on the freeway on the right.
     * @type {Integer (Int32)}
     */
    static FreewayContinueRight => 21

    /**
     * Enter the traffic circle on the left.
     * @type {Integer (Int32)}
     */
    static TrafficCircleLeft => 22

    /**
     * Enter the traffic circle on the right.
     * @type {Integer (Int32)}
     */
    static TrafficCircleRight => 23

    /**
     * Take the ferry.
     * @type {Integer (Int32)}
     */
    static TakeFerry => 24
}

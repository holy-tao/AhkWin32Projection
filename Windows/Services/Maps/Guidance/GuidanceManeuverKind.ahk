#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies types of guidance maneuvers.
  * 
  * > [!NOTE]
  * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.services.maps.guidance.guidancemaneuverkind
 * @namespace Windows.Services.Maps.Guidance
 * @version WindowsRuntime 1.4
 */
class GuidanceManeuverKind extends Win32Enum{

    /**
     * No maneuvers are applicable.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Go straight.
     * @type {Integer (Int32)}
     */
    static GoStraight => 1

    /**
     * U-turn to right side.
     * @type {Integer (Int32)}
     */
    static UTurnRight => 2

    /**
     * U-turn to left side.
     * @type {Integer (Int32)}
     */
    static UTurnLeft => 3

    /**
     * Keep in the right lane.
     * @type {Integer (Int32)}
     */
    static TurnKeepRight => 4

    /**
     * Turn slightly right.
     * @type {Integer (Int32)}
     */
    static TurnLightRight => 5

    /**
     * Turn right (about 90 degrees).
     * @type {Integer (Int32)}
     */
    static TurnRight => 6

    /**
     * Turn heavily right.
     * @type {Integer (Int32)}
     */
    static TurnHardRight => 7

    /**
     * Keep in the middle lane.
     * @type {Integer (Int32)}
     */
    static KeepMiddle => 8

    /**
     * Keep in the left lane.
     * @type {Integer (Int32)}
     */
    static TurnKeepLeft => 9

    /**
     * Turn slightly left.
     * @type {Integer (Int32)}
     */
    static TurnLightLeft => 10

    /**
     * Turn left (about 90 degrees).
     * @type {Integer (Int32)}
     */
    static TurnLeft => 11

    /**
     * Turn heavily left.
     * @type {Integer (Int32)}
     */
    static TurnHardLeft => 12

    /**
     * Enter the highway to its left lane.
     * @type {Integer (Int32)}
     */
    static FreewayEnterRight => 13

    /**
     * Enter the highway to its right lane.
     * @type {Integer (Int32)}
     */
    static FreewayEnterLeft => 14

    /**
     * Leave the highway from the right lane.
     * @type {Integer (Int32)}
     */
    static FreewayLeaveRight => 15

    /**
     * Leave the highway from the left lane.
     * @type {Integer (Int32)}
     */
    static FreewayLeaveLeft => 16

    /**
     * Keep right on the highway.
     * @type {Integer (Int32)}
     */
    static FreewayKeepRight => 17

    /**
     * Keep left on the highway.
     * @type {Integer (Int32)}
     */
    static FreewayKeepLeft => 18

    /**
     * Take roundabout exit 1 (right-hand traffic).
     * @type {Integer (Int32)}
     */
    static TrafficCircleRight1 => 19

    /**
     * Take roundabout exit 2 (right-hand traffic).
     * @type {Integer (Int32)}
     */
    static TrafficCircleRight2 => 20

    /**
     * Take roundabout exit 3 (right-hand traffic).
     * @type {Integer (Int32)}
     */
    static TrafficCircleRight3 => 21

    /**
     * Take roundabout exit 4 (right-hand traffic).
     * @type {Integer (Int32)}
     */
    static TrafficCircleRight4 => 22

    /**
     * Take roundabout exit 5 (right-hand traffic).
     * @type {Integer (Int32)}
     */
    static TrafficCircleRight5 => 23

    /**
     * Take roundabout exit 6 (right-hand traffic).
     * @type {Integer (Int32)}
     */
    static TrafficCircleRight6 => 24

    /**
     * Take roundabout exit 7 (right-hand traffic).
     * @type {Integer (Int32)}
     */
    static TrafficCircleRight7 => 25

    /**
     * Take roundabout exit 8 (right-hand traffic).
     * @type {Integer (Int32)}
     */
    static TrafficCircleRight8 => 26

    /**
     * Take roundabout exit 9 (right-hand traffic).
     * @type {Integer (Int32)}
     */
    static TrafficCircleRight9 => 27

    /**
     * Take roundabout exit 10 (right-hand traffic).
     * @type {Integer (Int32)}
     */
    static TrafficCircleRight10 => 28

    /**
     * Take roundabout exit 11 (right-hand traffic).
     * @type {Integer (Int32)}
     */
    static TrafficCircleRight11 => 29

    /**
     * Take roundabout exit 12 (right-hand traffic).
     * @type {Integer (Int32)}
     */
    static TrafficCircleRight12 => 30

    /**
     * Take roundabout exit 1 (left-hand traffic).
     * @type {Integer (Int32)}
     */
    static TrafficCircleLeft1 => 31

    /**
     * Take roundabout exit 2 (left-hand traffic).
     * @type {Integer (Int32)}
     */
    static TrafficCircleLeft2 => 32

    /**
     * Take roundabout exit 3 (left-hand traffic).
     * @type {Integer (Int32)}
     */
    static TrafficCircleLeft3 => 33

    /**
     * Take roundabout exit 4 (left-hand traffic).
     * @type {Integer (Int32)}
     */
    static TrafficCircleLeft4 => 34

    /**
     * Take roundabout exit 5 (left-hand traffic).
     * @type {Integer (Int32)}
     */
    static TrafficCircleLeft5 => 35

    /**
     * Take roundabout exit 6 (left-hand traffic).
     * @type {Integer (Int32)}
     */
    static TrafficCircleLeft6 => 36

    /**
     * Take roundabout exit 7 (left-hand traffic).
     * @type {Integer (Int32)}
     */
    static TrafficCircleLeft7 => 37

    /**
     * Take roundabout exit 8 (left-hand traffic).
     * @type {Integer (Int32)}
     */
    static TrafficCircleLeft8 => 38

    /**
     * Take roundabout exit 9 (left-hand traffic).
     * @type {Integer (Int32)}
     */
    static TrafficCircleLeft9 => 39

    /**
     * Take roundabout exit 10 (left-hand traffic).
     * @type {Integer (Int32)}
     */
    static TrafficCircleLeft10 => 40

    /**
     * Take roundabout exit 11 (left-hand traffic).
     * @type {Integer (Int32)}
     */
    static TrafficCircleLeft11 => 41

    /**
     * Take roundabout exit 12 (left-hand traffic).
     * @type {Integer (Int32)}
     */
    static TrafficCircleLeft12 => 42

    /**
     * The starting point.
     * @type {Integer (Int32)}
     */
    static Start => 43

    /**
     * The destination has been reached.
     * @type {Integer (Int32)}
     */
    static End => 44

    /**
     * Enter ferry.
     * @type {Integer (Int32)}
     */
    static TakeFerry => 45

    /**
     * Passing a public transit station.
     * @type {Integer (Int32)}
     */
    static PassTransitStation => 46

    /**
     * Leaving a public transit station.
     * @type {Integer (Int32)}
     */
    static LeaveTransitStation => 47
}

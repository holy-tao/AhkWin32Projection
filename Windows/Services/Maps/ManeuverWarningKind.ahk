#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the type of potential issue along a route leg.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.services.maps.maneuverwarningkind
 * @namespace Windows.Services.Maps
 * @version WindowsRuntime 1.4
 */
class ManeuverWarningKind extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * @type {Integer (Int32)}
     */
    static Accident => 1

    /**
     * @type {Integer (Int32)}
     */
    static AdministrativeDivisionChange => 2

    /**
     * @type {Integer (Int32)}
     */
    static Alert => 3

    /**
     * @type {Integer (Int32)}
     */
    static BlockedRoad => 4

    /**
     * @type {Integer (Int32)}
     */
    static CheckTimetable => 5

    /**
     * @type {Integer (Int32)}
     */
    static Congestion => 6

    /**
     * @type {Integer (Int32)}
     */
    static Construction => 7

    /**
     * @type {Integer (Int32)}
     */
    static CountryChange => 8

    /**
     * @type {Integer (Int32)}
     */
    static DisabledVehicle => 9

    /**
     * @type {Integer (Int32)}
     */
    static GateAccess => 10

    /**
     * @type {Integer (Int32)}
     */
    static GetOffTransit => 11

    /**
     * @type {Integer (Int32)}
     */
    static GetOnTransit => 12

    /**
     * @type {Integer (Int32)}
     */
    static IllegalUTurn => 13

    /**
     * @type {Integer (Int32)}
     */
    static MassTransit => 14

    /**
     * @type {Integer (Int32)}
     */
    static Miscellaneous => 15

    /**
     * @type {Integer (Int32)}
     */
    static NoIncident => 16

    /**
     * @type {Integer (Int32)}
     */
    static Other => 17

    /**
     * @type {Integer (Int32)}
     */
    static OtherNews => 18

    /**
     * @type {Integer (Int32)}
     */
    static OtherTrafficIncidents => 19

    /**
     * @type {Integer (Int32)}
     */
    static PlannedEvent => 20

    /**
     * @type {Integer (Int32)}
     */
    static PrivateRoad => 21

    /**
     * @type {Integer (Int32)}
     */
    static RestrictedTurn => 22

    /**
     * @type {Integer (Int32)}
     */
    static RoadClosures => 23

    /**
     * @type {Integer (Int32)}
     */
    static RoadHazard => 24

    /**
     * @type {Integer (Int32)}
     */
    static ScheduledConstruction => 25

    /**
     * @type {Integer (Int32)}
     */
    static SeasonalClosures => 26

    /**
     * @type {Integer (Int32)}
     */
    static Tollbooth => 27

    /**
     * @type {Integer (Int32)}
     */
    static TollRoad => 28

    /**
     * @type {Integer (Int32)}
     */
    static TollZoneEnter => 29

    /**
     * @type {Integer (Int32)}
     */
    static TollZoneExit => 30

    /**
     * @type {Integer (Int32)}
     */
    static TrafficFlow => 31

    /**
     * @type {Integer (Int32)}
     */
    static TransitLineChange => 32

    /**
     * @type {Integer (Int32)}
     */
    static UnpavedRoad => 33

    /**
     * @type {Integer (Int32)}
     */
    static UnscheduledConstruction => 34

    /**
     * @type {Integer (Int32)}
     */
    static Weather => 35
}

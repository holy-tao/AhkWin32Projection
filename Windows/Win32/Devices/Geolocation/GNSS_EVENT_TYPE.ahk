#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Geolocation
 */
class GNSS_EVENT_TYPE extends Win32Enum {

    /**
     * Native name: GNSS_Event_FixAvailable
     * @type {Integer (Int32)}
     */
    static FixAvailable => 1

    /**
     * Native name: GNSS_Event_RequireAgnss
     * @type {Integer (Int32)}
     */
    static RequireAgnss => 2

    /**
     * Native name: GNSS_Event_Error
     * @type {Integer (Int32)}
     */
    static Error => 3

    /**
     * Native name: GNSS_Event_NiRequest
     * @type {Integer (Int32)}
     */
    static NiRequest => 12

    /**
     * Native name: GNSS_Event_NmeaData
     * @type {Integer (Int32)}
     */
    static NmeaData => 13

    /**
     * Native name: GNSS_Event_GeofenceAlertData
     * @type {Integer (Int32)}
     */
    static GeofenceAlertData => 14

    /**
     * Native name: GNSS_Event_GeofencesTrackingStatus
     * @type {Integer (Int32)}
     */
    static GeofencesTrackingStatus => 15

    /**
     * Native name: GNSS_Event_DriverRequest
     * @type {Integer (Int32)}
     */
    static DriverRequest => 16

    /**
     * Native name: GNSS_Event_BreadcrumbAlertEvent
     * @type {Integer (Int32)}
     */
    static BreadcrumbAlertEvent => 17

    /**
     * Native name: GNSS_Event_FixAvailable_2
     * @type {Integer (Int32)}
     */
    static FixAvailable_2 => 18

    /**
     * Native name: GNSS_Event_Custom
     * @type {Integer (Int32)}
     */
    static Custom => 32768
}

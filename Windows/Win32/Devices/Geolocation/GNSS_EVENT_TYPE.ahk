#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Devices.Geolocation
 * @version v4.0.30319
 */
class GNSS_EVENT_TYPE{

    /**
     * @type {Integer (Int32)}
     */
    static GNSS_Event_FixAvailable => 1

    /**
     * @type {Integer (Int32)}
     */
    static GNSS_Event_RequireAgnss => 2

    /**
     * @type {Integer (Int32)}
     */
    static GNSS_Event_Error => 3

    /**
     * @type {Integer (Int32)}
     */
    static GNSS_Event_NiRequest => 12

    /**
     * @type {Integer (Int32)}
     */
    static GNSS_Event_NmeaData => 13

    /**
     * @type {Integer (Int32)}
     */
    static GNSS_Event_GeofenceAlertData => 14

    /**
     * @type {Integer (Int32)}
     */
    static GNSS_Event_GeofencesTrackingStatus => 15

    /**
     * @type {Integer (Int32)}
     */
    static GNSS_Event_DriverRequest => 16

    /**
     * @type {Integer (Int32)}
     */
    static GNSS_Event_BreadcrumbAlertEvent => 17

    /**
     * @type {Integer (Int32)}
     */
    static GNSS_Event_FixAvailable_2 => 18

    /**
     * @type {Integer (Int32)}
     */
    static GNSS_Event_Custom => 32768
}

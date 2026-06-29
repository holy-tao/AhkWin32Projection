#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Geolocation
 */
export default struct GNSS_EVENT_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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

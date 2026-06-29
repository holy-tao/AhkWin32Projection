#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Geolocation
 */
export default struct GNSS_DRIVERCOMMAND_TYPE {
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
    static GNSS_SetLocationServiceEnabled => 1

    /**
     * @type {Integer (Int32)}
     */
    static GNSS_SetLocationNIRequestAllowed => 2

    /**
     * @type {Integer (Int32)}
     */
    static GNSS_ForceSatelliteSystem => 3

    /**
     * @type {Integer (Int32)}
     */
    static GNSS_ForceOperationMode => 4

    /**
     * @type {Integer (Int32)}
     */
    static GNSS_ResetEngine => 9

    /**
     * @type {Integer (Int32)}
     */
    static GNSS_ClearAgnssData => 10

    /**
     * @type {Integer (Int32)}
     */
    static GNSS_SetSuplVersion => 12

    /**
     * @type {Integer (Int32)}
     */
    static GNSS_SetNMEALogging => 13

    /**
     * @type {Integer (Int32)}
     */
    static GNSS_SetUplServerAccessInterval => 14

    /**
     * @type {Integer (Int32)}
     */
    static GNSS_SetNiTimeoutInterval => 15

    /**
     * @type {Integer (Int32)}
     */
    static GNSS_ResetGeofencesTracking => 16

    /**
     * @type {Integer (Int32)}
     */
    static GNSS_SetSuplVersion2 => 17

    /**
     * @type {Integer (Int32)}
     */
    static GNSS_CustomCommand => 256
}

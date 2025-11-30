#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Geolocation
 * @version v4.0.30319
 */
class GNSS_DRIVERCOMMAND_TYPE extends Win32Enum{

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

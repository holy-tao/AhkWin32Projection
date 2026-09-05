#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Geolocation
 */
class GNSS_DRIVERCOMMAND_TYPE extends Win32Enum {

    /**
     * Native name: GNSS_SetLocationServiceEnabled
     * @type {Integer (Int32)}
     */
    static SetLocationServiceEnabled => 1

    /**
     * Native name: GNSS_SetLocationNIRequestAllowed
     * @type {Integer (Int32)}
     */
    static SetLocationNIRequestAllowed => 2

    /**
     * Native name: GNSS_ForceSatelliteSystem
     * @type {Integer (Int32)}
     */
    static ForceSatelliteSystem => 3

    /**
     * Native name: GNSS_ForceOperationMode
     * @type {Integer (Int32)}
     */
    static ForceOperationMode => 4

    /**
     * Native name: GNSS_ResetEngine
     * @type {Integer (Int32)}
     */
    static ResetEngine => 9

    /**
     * Native name: GNSS_ClearAgnssData
     * @type {Integer (Int32)}
     */
    static ClearAgnssData => 10

    /**
     * Native name: GNSS_SetSuplVersion
     * @type {Integer (Int32)}
     */
    static SetSuplVersion => 12

    /**
     * Native name: GNSS_SetNMEALogging
     * @type {Integer (Int32)}
     */
    static SetNMEALogging => 13

    /**
     * Native name: GNSS_SetUplServerAccessInterval
     * @type {Integer (Int32)}
     */
    static SetUplServerAccessInterval => 14

    /**
     * Native name: GNSS_SetNiTimeoutInterval
     * @type {Integer (Int32)}
     */
    static SetNiTimeoutInterval => 15

    /**
     * Native name: GNSS_ResetGeofencesTracking
     * @type {Integer (Int32)}
     */
    static ResetGeofencesTracking => 16

    /**
     * Native name: GNSS_SetSuplVersion2
     * @type {Integer (Int32)}
     */
    static SetSuplVersion2 => 17

    /**
     * Native name: GNSS_CustomCommand
     * @type {Integer (Int32)}
     */
    static CustomCommand => 256
}

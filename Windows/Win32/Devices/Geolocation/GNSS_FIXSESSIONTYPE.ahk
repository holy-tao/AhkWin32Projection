#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Geolocation
 */
class GNSS_FIXSESSIONTYPE extends Win32Enum {

    /**
     * Native name: GNSS_FixSession_SingleShot
     * @type {Integer (Int32)}
     */
    static FixSession_SingleShot => 1

    /**
     * Native name: GNSS_FixSession_DistanceTracking
     * @type {Integer (Int32)}
     */
    static FixSession_DistanceTracking => 2

    /**
     * Native name: GNSS_FixSession_ContinuousTracking
     * @type {Integer (Int32)}
     */
    static FixSession_ContinuousTracking => 3

    /**
     * Native name: GNSS_FixSession_LKG
     * @type {Integer (Int32)}
     */
    static FixSession_LKG => 4
}

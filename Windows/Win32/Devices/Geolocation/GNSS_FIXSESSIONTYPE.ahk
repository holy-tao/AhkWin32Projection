#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Devices.Geolocation
 * @version v4.0.30319
 */
class GNSS_FIXSESSIONTYPE{

    /**
     * @type {Integer (Int32)}
     */
    static GNSS_FixSession_SingleShot => 1

    /**
     * @type {Integer (Int32)}
     */
    static GNSS_FixSession_DistanceTracking => 2

    /**
     * @type {Integer (Int32)}
     */
    static GNSS_FixSession_ContinuousTracking => 3

    /**
     * @type {Integer (Int32)}
     */
    static GNSS_FixSession_LKG => 4
}

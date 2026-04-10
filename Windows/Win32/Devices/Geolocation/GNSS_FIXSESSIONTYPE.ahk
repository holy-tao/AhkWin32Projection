#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Geolocation
 */
class GNSS_FIXSESSIONTYPE extends Win32Enum {

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

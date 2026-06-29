#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Geolocation
 */
export default struct GNSS_FIXSESSIONTYPE {
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

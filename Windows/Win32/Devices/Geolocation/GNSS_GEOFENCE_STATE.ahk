#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Geolocation
 */
export default struct GNSS_GEOFENCE_STATE {
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
    static GNSS_GeofenceState_Unknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static GNSS_GeofenceState_Entered => 1

    /**
     * @type {Integer (Int32)}
     */
    static GNSS_GeofenceState_Exited => 2
}

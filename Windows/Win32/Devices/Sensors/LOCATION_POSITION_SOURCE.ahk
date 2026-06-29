#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Sensors
 */
export default struct LOCATION_POSITION_SOURCE {
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
    static LOCATION_POSITION_SOURCE_CELLULAR => 0

    /**
     * @type {Integer (Int32)}
     */
    static LOCATION_POSITION_SOURCE_SATELLITE => 1

    /**
     * @type {Integer (Int32)}
     */
    static LOCATION_POSITION_SOURCE_WIFI => 2

    /**
     * @type {Integer (Int32)}
     */
    static LOCATION_POSITION_SOURCE_IPADDRESS => 3

    /**
     * @type {Integer (Int32)}
     */
    static LOCATION_POSITION_SOURCE_UNKNOWN => 4
}

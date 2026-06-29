#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Geolocation
 */
export default struct GNSS_NI_PLANE_TYPE {
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
    static GNSS_NI_SUPL => 1

    /**
     * @type {Integer (Int32)}
     */
    static GNSS_NI_CP => 2

    /**
     * @type {Integer (Int32)}
     */
    static GNSS_NI_V2UPL => 3
}

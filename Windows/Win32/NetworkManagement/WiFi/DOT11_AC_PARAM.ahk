#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_AC_PARAM {
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
    static dot11_AC_param_BE => 0

    /**
     * @type {Integer (Int32)}
     */
    static dot11_AC_param_BK => 1

    /**
     * @type {Integer (Int32)}
     */
    static dot11_AC_param_VI => 2

    /**
     * @type {Integer (Int32)}
     */
    static dot11_AC_param_VO => 3

    /**
     * @type {Integer (Int32)}
     */
    static dot11_AC_param_max => 4
}

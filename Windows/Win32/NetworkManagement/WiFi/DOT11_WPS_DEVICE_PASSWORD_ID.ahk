#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_WPS_DEVICE_PASSWORD_ID {
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
    static DOT11_WPS_PASSWORD_ID_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static DOT11_WPS_PASSWORD_ID_USER_SPECIFIED => 1

    /**
     * @type {Integer (Int32)}
     */
    static DOT11_WPS_PASSWORD_ID_MACHINE_SPECIFIED => 2

    /**
     * @type {Integer (Int32)}
     */
    static DOT11_WPS_PASSWORD_ID_REKEY => 3

    /**
     * @type {Integer (Int32)}
     */
    static DOT11_WPS_PASSWORD_ID_PUSHBUTTON => 4

    /**
     * @type {Integer (Int32)}
     */
    static DOT11_WPS_PASSWORD_ID_REGISTRAR_SPECIFIED => 5

    /**
     * @type {Integer (Int32)}
     */
    static DOT11_WPS_PASSWORD_ID_NFC_CONNECTION_HANDOVER => 7

    /**
     * @type {Integer (Int32)}
     */
    static DOT11_WPS_PASSWORD_ID_WFD_SERVICES => 8

    /**
     * @type {Integer (Int32)}
     */
    static DOT11_WPS_PASSWORD_ID_OOB_RANGE_MIN => 16

    /**
     * @type {Integer (Int32)}
     */
    static DOT11_WPS_PASSWORD_ID_OOB_RANGE_MAX => 65535
}

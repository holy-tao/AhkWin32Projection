#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
class DOT11_WPS_DEVICE_PASSWORD_ID extends Win32Enum {

    /**
     * Native name: DOT11_WPS_PASSWORD_ID_DEFAULT
     * @type {Integer (Int32)}
     */
    static DEFAULT => 0

    /**
     * Native name: DOT11_WPS_PASSWORD_ID_USER_SPECIFIED
     * @type {Integer (Int32)}
     */
    static USER_SPECIFIED => 1

    /**
     * Native name: DOT11_WPS_PASSWORD_ID_MACHINE_SPECIFIED
     * @type {Integer (Int32)}
     */
    static MACHINE_SPECIFIED => 2

    /**
     * Native name: DOT11_WPS_PASSWORD_ID_REKEY
     * @type {Integer (Int32)}
     */
    static REKEY => 3

    /**
     * Native name: DOT11_WPS_PASSWORD_ID_PUSHBUTTON
     * @type {Integer (Int32)}
     */
    static PUSHBUTTON => 4

    /**
     * Native name: DOT11_WPS_PASSWORD_ID_REGISTRAR_SPECIFIED
     * @type {Integer (Int32)}
     */
    static REGISTRAR_SPECIFIED => 5

    /**
     * Native name: DOT11_WPS_PASSWORD_ID_NFC_CONNECTION_HANDOVER
     * @type {Integer (Int32)}
     */
    static NFC_CONNECTION_HANDOVER => 7

    /**
     * Native name: DOT11_WPS_PASSWORD_ID_WFD_SERVICES
     * @type {Integer (Int32)}
     */
    static WFD_SERVICES => 8

    /**
     * Native name: DOT11_WPS_PASSWORD_ID_OOB_RANGE_MIN
     * @type {Integer (Int32)}
     */
    static OOB_RANGE_MIN => 16

    /**
     * Native name: DOT11_WPS_PASSWORD_ID_OOB_RANGE_MAX
     * @type {Integer (Int32)}
     */
    static OOB_RANGE_MAX => 65535
}

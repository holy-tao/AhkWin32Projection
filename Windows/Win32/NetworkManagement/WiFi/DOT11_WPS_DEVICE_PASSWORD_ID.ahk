#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_WPS_DEVICE_PASSWORD_ID extends Win32Enum{

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

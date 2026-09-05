#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The MBN_PIN_TYPE enumerated type indicates the type of password required for unlocking the information stored on the interface.
 * @see https://learn.microsoft.com/windows/win32/api/mbnapi/ne-mbnapi-mbn_pin_type
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 */
class MBN_PIN_TYPE extends Win32Enum {

    /**
     * Indicates that no PIN is pending to be entered.
     * Native name: MBN_PIN_TYPE_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Indicates a custom PIN code.
     * Native name: MBN_PIN_TYPE_CUSTOM
     * @type {Integer (Int32)}
     */
    static CUSTOM => 1

    /**
     * Indicates a PIN1 code.  For CDMA devices, PIN1 represents the power-on device lock code.  For GSM devices, PIN1 represents the SIM lock, also referred to  as PIN in GSM terminology.
     * Native name: MBN_PIN_TYPE_PIN1
     * @type {Integer (Int32)}
     */
    static PIN1 => 2

    /**
     * Indicates a PIN2 code.
     * Native name: MBN_PIN_TYPE_PIN2
     * @type {Integer (Int32)}
     */
    static PIN2 => 3

    /**
     * Indicates a device to SIM password.
     * Native name: MBN_PIN_TYPE_DEVICE_SIM_PIN
     * @type {Integer (Int32)}
     */
    static DEVICE_SIM_PIN => 4

    /**
     * Indicates a device to very first SIM password.
     * Native name: MBN_PIN_TYPE_DEVICE_FIRST_SIM_PIN
     * @type {Integer (Int32)}
     */
    static DEVICE_FIRST_SIM_PIN => 5

    /**
     * Indicates a network personalization password.
     * Native name: MBN_PIN_TYPE_NETWORK_PIN
     * @type {Integer (Int32)}
     */
    static NETWORK_PIN => 6

    /**
     * Indicates a network subset personalization password.
     * Native name: MBN_PIN_TYPE_NETWORK_SUBSET_PIN
     * @type {Integer (Int32)}
     */
    static NETWORK_SUBSET_PIN => 7

    /**
     * Indicates a Service Provider (SP) personalization password.
     * Native name: MBN_PIN_TYPE_SVC_PROVIDER_PIN
     * @type {Integer (Int32)}
     */
    static SVC_PROVIDER_PIN => 8

    /**
     * Indicates a corporate personalization password.
     * Native name: MBN_PIN_TYPE_CORPORATE_PIN
     * @type {Integer (Int32)}
     */
    static CORPORATE_PIN => 9

    /**
     * Indicates a subsidy unlock code.
     * Native name: MBN_PIN_TYPE_SUBSIDY_LOCK
     * @type {Integer (Int32)}
     */
    static SUBSIDY_LOCK => 10
}

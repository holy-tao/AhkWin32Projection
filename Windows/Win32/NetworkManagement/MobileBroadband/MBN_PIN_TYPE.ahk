#Requires AutoHotkey v2.0.0 64-bit

/**
 * The MBN_PIN_TYPE enumerated type indicates the type of password required for unlocking the information stored on the interface.
 * @see https://docs.microsoft.com/windows/win32/api//mbnapi/ne-mbnapi-mbn_pin_type
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 * @version v4.0.30319
 */
class MBN_PIN_TYPE{

    /**
     * Indicates that no PIN is pending to be entered.
     * @type {Integer (Int32)}
     */
    static MBN_PIN_TYPE_NONE => 0

    /**
     * Indicates a custom PIN code.
     * @type {Integer (Int32)}
     */
    static MBN_PIN_TYPE_CUSTOM => 1

    /**
     * Indicates a PIN1 code.  For CDMA devices, PIN1 represents the power-on device lock code.  For GSM devices, PIN1 represents the SIM lock, also referred to  as PIN in GSM terminology.
     * @type {Integer (Int32)}
     */
    static MBN_PIN_TYPE_PIN1 => 2

    /**
     * Indicates a PIN2 code.
     * @type {Integer (Int32)}
     */
    static MBN_PIN_TYPE_PIN2 => 3

    /**
     * Indicates a device to SIM password.
     * @type {Integer (Int32)}
     */
    static MBN_PIN_TYPE_DEVICE_SIM_PIN => 4

    /**
     * Indicates a device to very first SIM password.
     * @type {Integer (Int32)}
     */
    static MBN_PIN_TYPE_DEVICE_FIRST_SIM_PIN => 5

    /**
     * Indicates a network personalization password.
     * @type {Integer (Int32)}
     */
    static MBN_PIN_TYPE_NETWORK_PIN => 6

    /**
     * Indicates a network subset personalization password.
     * @type {Integer (Int32)}
     */
    static MBN_PIN_TYPE_NETWORK_SUBSET_PIN => 7

    /**
     * Indicates a Service Provider (SP) personalization password.
     * @type {Integer (Int32)}
     */
    static MBN_PIN_TYPE_SVC_PROVIDER_PIN => 8

    /**
     * Indicates a corporate personalization password.
     * @type {Integer (Int32)}
     */
    static MBN_PIN_TYPE_CORPORATE_PIN => 9

    /**
     * Indicates a subsidy unlock code.
     * @type {Integer (Int32)}
     */
    static MBN_PIN_TYPE_SUBSIDY_LOCK => 10
}

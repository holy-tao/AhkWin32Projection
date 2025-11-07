#Requires AutoHotkey v2.0.0 64-bit

/**
 * The MBN_CTRL_CAPS enumerated type represents all of the Mobile Broadband device control capabilities as bit fields.
 * @see https://docs.microsoft.com/windows/win32/api//mbnapi/ne-mbnapi-mbn_ctrl_caps
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 * @version v4.0.30319
 */
class MBN_CTRL_CAPS{

    /**
     * Device control capabilities are unavailable.
     * @type {Integer (Int32)}
     */
    static MBN_CTRL_CAPS_NONE => 0

    /**
     * Manual selection is allowed for the interface.  This field will not be set for CDMA type interfaces.
     * @type {Integer (Int32)}
     */
    static MBN_CTRL_CAPS_REG_MANUAL => 1

    /**
     * Hardware radio switch functionality is supported.
     * @type {Integer (Int32)}
     */
    static MBN_CTRL_CAPS_HW_RADIO_SWITCH => 2

    /**
     * The Mobile Broadband device is configured for Mobile IP support.  This field is applicable only to CDMA devices.
     * @type {Integer (Int32)}
     */
    static MBN_CTRL_CAPS_CDMA_MOBILE_IP => 4

    /**
     * The Mobile Broadband device is configured for Simple IP support.  This field is applicable only to CDMA devices.
     * 
     * If this field is set in conjunction with <b>MBN_CTRL_CAPS_MOBILE_IP</b>, then this indicates that the device is configured for Mobile IP with Simple IP as a fallback option.
     * @type {Integer (Int32)}
     */
    static MBN_CTRL_CAPS_CDMA_SIMPLE_IP => 8

    /**
     * In some countries or regions, showing the International Mobile Subscriber Identity (IMSI) to the user is not allowed. When this flag is set, the application should not display the IMSI to users.
     * @type {Integer (Int32)}
     */
    static MBN_CTRL_CAPS_PROTECT_UNIQUEID => 16

    /**
     * Windows 8 or later: The Mobile Broadband device supports multi-carrier functionality and is not restricted by a Network Service Provider (NSP).
     * @type {Integer (Int32)}
     */
    static MBN_CTRL_CAPS_MODEL_MULTI_CARRIER => 32

    /**
     * Windows 8 or later: The Mobile Broadband device supports the USSD protocol. This flag applies only to GSM-based devices.
     * @type {Integer (Int32)}
     */
    static MBN_CTRL_CAPS_USSD => 64

    /**
     * Windows 8 or later: The Mobile Broadband device supports multiple cellular classes.
     * @type {Integer (Int32)}
     */
    static MBN_CTRL_CAPS_MULTI_MODE => 128
}

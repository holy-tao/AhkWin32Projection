#Requires AutoHotkey v2.0.0 64-bit

/**
 * The MBN_SMS_CAPS enumerated type contains bitfield values that specify SMS capabilities.
 * @see https://docs.microsoft.com/windows/win32/api//mbnapi/ne-mbnapi-mbn_sms_caps
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 * @version v4.0.30319
 */
class MBN_SMS_CAPS{

    /**
     * The device does not support SMS.
     * @type {Integer (Int32)}
     */
    static MBN_SMS_CAPS_NONE => 0

    /**
     * For GSM devices, this indicates that the device is capable of receiving PDU-type SMS. 
     * For CDMA devices, this indicates that the device is capable of reading the SMS in binary format as defined in section 3.4.2.1 “SMS Point-to-Point Message” in 3GPP2 specification C.S0015-A “Short Message Service (SMS) for Wideband Spread Spectrum Systems”.
     * @type {Integer (Int32)}
     */
    static MBN_SMS_CAPS_PDU_RECEIVE => 1

    /**
     * For GSM devices, this indicates that the device is capable of sending PDU-type SMS. 
     * For CDMA devices, this indicates that the device is capable of sending the SMS in binary format as defined in section 3.4.2.1 “SMS Point-to-Point Message” in 3GPP2 specification C.S0015-A “Short Message Service (SMS) for Wideband Spread Spectrum Systems”.
     * @type {Integer (Int32)}
     */
    static MBN_SMS_CAPS_PDU_SEND => 2

    /**
     * The device supports  receiving text-type SMS messages.  This is applicable only to CDMA devices.
     * @type {Integer (Int32)}
     */
    static MBN_SMS_CAPS_TEXT_RECEIVE => 4

    /**
     * The device supports  sending text-type SMS messages.  This is applicable only to CDMA devices.
     * @type {Integer (Int32)}
     */
    static MBN_SMS_CAPS_TEXT_SEND => 8
}

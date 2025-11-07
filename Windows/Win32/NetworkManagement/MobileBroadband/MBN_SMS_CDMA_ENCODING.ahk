#Requires AutoHotkey v2.0.0 64-bit

/**
 * The MBN_SMS_CDMA_ENCODING enumerated type specifies character encoding types for CDMA.
 * @remarks
 * 
 * The encodings are defined in section 4.5.2 of the 3GPP2 specification C.S0015-B "Short Message Service (SM) for Wideband Spread Spectrum Systems".
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mbnapi/ne-mbnapi-mbn_sms_cdma_encoding
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 * @version v4.0.30319
 */
class MBN_SMS_CDMA_ENCODING{

    /**
     * Octet encoding.
     * @type {Integer (Int32)}
     */
    static MBN_SMS_CDMA_ENCODING_OCTET => 0

    /**
     * EPM encoding.
     * @type {Integer (Int32)}
     */
    static MBN_SMS_CDMA_ENCODING_EPM => 1

    /**
     * 7 bit ASCII encoding.
     * @type {Integer (Int32)}
     */
    static MBN_SMS_CDMA_ENCODING_7BIT_ASCII => 2

    /**
     * IA5 encoding.
     * @type {Integer (Int32)}
     */
    static MBN_SMS_CDMA_ENCODING_IA5 => 3

    /**
     * Unicode encoding.
     * @type {Integer (Int32)}
     */
    static MBN_SMS_CDMA_ENCODING_UNICODE => 4

    /**
     * Shift JIS encoding for the Japanese Language.
     * @type {Integer (Int32)}
     */
    static MBN_SMS_CDMA_ENCODING_SHIFT_JIS => 5

    /**
     * Korean encoding.
     * @type {Integer (Int32)}
     */
    static MBN_SMS_CDMA_ENCODING_KOREAN => 6

    /**
     * Latin Hebrew encoding.
     * @type {Integer (Int32)}
     */
    static MBN_SMS_CDMA_ENCODING_LATIN_HEBREW => 7

    /**
     * Latin encoding.
     * @type {Integer (Int32)}
     */
    static MBN_SMS_CDMA_ENCODING_LATIN => 8

    /**
     * GSM 7 bit encoding.
     * @type {Integer (Int32)}
     */
    static MBN_SMS_CDMA_ENCODING_GSM_7BIT => 9
}

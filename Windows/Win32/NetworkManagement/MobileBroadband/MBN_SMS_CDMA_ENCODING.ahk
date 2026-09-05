#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The MBN_SMS_CDMA_ENCODING enumerated type specifies character encoding types for CDMA.
 * @remarks
 * The encodings are defined in section 4.5.2 of the 3GPP2 specification C.S0015-B "Short Message Service (SM) for Wideband Spread Spectrum Systems".
 * @see https://learn.microsoft.com/windows/win32/api/mbnapi/ne-mbnapi-mbn_sms_cdma_encoding
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 */
class MBN_SMS_CDMA_ENCODING extends Win32Enum {

    /**
     * Octet encoding.
     * Native name: MBN_SMS_CDMA_ENCODING_OCTET
     * @type {Integer (Int32)}
     */
    static OCTET => 0

    /**
     * EPM encoding.
     * Native name: MBN_SMS_CDMA_ENCODING_EPM
     * @type {Integer (Int32)}
     */
    static EPM => 1

    /**
     * 7 bit ASCII encoding.
     * Native name: MBN_SMS_CDMA_ENCODING_7BIT_ASCII
     * @type {Integer (Int32)}
     */
    static 7BIT_ASCII => 2

    /**
     * IA5 encoding.
     * Native name: MBN_SMS_CDMA_ENCODING_IA5
     * @type {Integer (Int32)}
     */
    static IA5 => 3

    /**
     * Unicode encoding.
     * Native name: MBN_SMS_CDMA_ENCODING_UNICODE
     * @type {Integer (Int32)}
     */
    static UNICODE => 4

    /**
     * Shift JIS encoding for the Japanese Language.
     * Native name: MBN_SMS_CDMA_ENCODING_SHIFT_JIS
     * @type {Integer (Int32)}
     */
    static SHIFT_JIS => 5

    /**
     * Korean encoding.
     * Native name: MBN_SMS_CDMA_ENCODING_KOREAN
     * @type {Integer (Int32)}
     */
    static KOREAN => 6

    /**
     * Latin Hebrew encoding.
     * Native name: MBN_SMS_CDMA_ENCODING_LATIN_HEBREW
     * @type {Integer (Int32)}
     */
    static LATIN_HEBREW => 7

    /**
     * Latin encoding.
     * Native name: MBN_SMS_CDMA_ENCODING_LATIN
     * @type {Integer (Int32)}
     */
    static LATIN => 8

    /**
     * GSM 7 bit encoding.
     * Native name: MBN_SMS_CDMA_ENCODING_GSM_7BIT
     * @type {Integer (Int32)}
     */
    static GSM_7BIT => 9
}

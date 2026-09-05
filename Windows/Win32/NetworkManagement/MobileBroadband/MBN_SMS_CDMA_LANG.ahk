#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The MBN_SMS_CDMA_LANG enumerated type represents the different languages that can be used in a CDMA message.
 * @see https://learn.microsoft.com/windows/win32/api/mbnapi/ne-mbnapi-mbn_sms_cdma_lang
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 */
class MBN_SMS_CDMA_LANG extends Win32Enum {

    /**
     * None.
     * Native name: MBN_SMS_CDMA_LANG_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * English.
     * Native name: MBN_SMS_CDMA_LANG_ENGLISH
     * @type {Integer (Int32)}
     */
    static ENGLISH => 1

    /**
     * French.
     * Native name: MBN_SMS_CDMA_LANG_FRENCH
     * @type {Integer (Int32)}
     */
    static FRENCH => 2

    /**
     * Spanish.
     * Native name: MBN_SMS_CDMA_LANG_SPANISH
     * @type {Integer (Int32)}
     */
    static SPANISH => 3

    /**
     * Japanese.
     * Native name: MBN_SMS_CDMA_LANG_JAPANESE
     * @type {Integer (Int32)}
     */
    static JAPANESE => 4

    /**
     * Korean.
     * Native name: MBN_SMS_CDMA_LANG_KOREAN
     * @type {Integer (Int32)}
     */
    static KOREAN => 5

    /**
     * Chinese.
     * Native name: MBN_SMS_CDMA_LANG_CHINESE
     * @type {Integer (Int32)}
     */
    static CHINESE => 6

    /**
     * Hebrew.
     * Native name: MBN_SMS_CDMA_LANG_HEBREW
     * @type {Integer (Int32)}
     */
    static HEBREW => 7
}

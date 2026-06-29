#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The MBN_SMS_CDMA_LANG enumerated type represents the different languages that can be used in a CDMA message.
 * @see https://learn.microsoft.com/windows/win32/api/mbnapi/ne-mbnapi-mbn_sms_cdma_lang
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 */
export default struct MBN_SMS_CDMA_LANG {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * None.
     * @type {Integer (Int32)}
     */
    static MBN_SMS_CDMA_LANG_NONE => 0

    /**
     * English.
     * @type {Integer (Int32)}
     */
    static MBN_SMS_CDMA_LANG_ENGLISH => 1

    /**
     * French.
     * @type {Integer (Int32)}
     */
    static MBN_SMS_CDMA_LANG_FRENCH => 2

    /**
     * Spanish.
     * @type {Integer (Int32)}
     */
    static MBN_SMS_CDMA_LANG_SPANISH => 3

    /**
     * Japanese.
     * @type {Integer (Int32)}
     */
    static MBN_SMS_CDMA_LANG_JAPANESE => 4

    /**
     * Korean.
     * @type {Integer (Int32)}
     */
    static MBN_SMS_CDMA_LANG_KOREAN => 5

    /**
     * Chinese.
     * @type {Integer (Int32)}
     */
    static MBN_SMS_CDMA_LANG_CHINESE => 6

    /**
     * Hebrew.
     * @type {Integer (Int32)}
     */
    static MBN_SMS_CDMA_LANG_HEBREW => 7
}

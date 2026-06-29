#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct USpoofChecks {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static USPOOF_SINGLE_SCRIPT_CONFUSABLE => 1

    /**
     * @type {Integer (Int32)}
     */
    static USPOOF_MIXED_SCRIPT_CONFUSABLE => 2

    /**
     * @type {Integer (Int32)}
     */
    static USPOOF_WHOLE_SCRIPT_CONFUSABLE => 4

    /**
     * @type {Integer (Int32)}
     */
    static USPOOF_CONFUSABLE => 7

    /**
     * @type {Integer (Int32)}
     */
    static USPOOF_RESTRICTION_LEVEL => 16

    /**
     * @type {Integer (Int32)}
     */
    static USPOOF_INVISIBLE => 32

    /**
     * @type {Integer (Int32)}
     */
    static USPOOF_CHAR_LIMIT => 64

    /**
     * @type {Integer (Int32)}
     */
    static USPOOF_MIXED_NUMBERS => 128

    /**
     * @type {Integer (Int32)}
     */
    static USPOOF_HIDDEN_OVERLAY => 256

    /**
     * @type {Integer (Int32)}
     */
    static USPOOF_ALL_CHECKS => 65535

    /**
     * @type {Integer (Int32)}
     */
    static USPOOF_AUX_INFO => 1073741824
}

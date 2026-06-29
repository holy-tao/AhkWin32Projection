#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct UTimeZoneFormatStyle {
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
    static UTZFMT_STYLE_GENERIC_LOCATION => 0

    /**
     * @type {Integer (Int32)}
     */
    static UTZFMT_STYLE_GENERIC_LONG => 1

    /**
     * @type {Integer (Int32)}
     */
    static UTZFMT_STYLE_GENERIC_SHORT => 2

    /**
     * @type {Integer (Int32)}
     */
    static UTZFMT_STYLE_SPECIFIC_LONG => 3

    /**
     * @type {Integer (Int32)}
     */
    static UTZFMT_STYLE_SPECIFIC_SHORT => 4

    /**
     * @type {Integer (Int32)}
     */
    static UTZFMT_STYLE_LOCALIZED_GMT => 5

    /**
     * @type {Integer (Int32)}
     */
    static UTZFMT_STYLE_LOCALIZED_GMT_SHORT => 6

    /**
     * @type {Integer (Int32)}
     */
    static UTZFMT_STYLE_ISO_BASIC_SHORT => 7

    /**
     * @type {Integer (Int32)}
     */
    static UTZFMT_STYLE_ISO_BASIC_LOCAL_SHORT => 8

    /**
     * @type {Integer (Int32)}
     */
    static UTZFMT_STYLE_ISO_BASIC_FIXED => 9

    /**
     * @type {Integer (Int32)}
     */
    static UTZFMT_STYLE_ISO_BASIC_LOCAL_FIXED => 10

    /**
     * @type {Integer (Int32)}
     */
    static UTZFMT_STYLE_ISO_BASIC_FULL => 11

    /**
     * @type {Integer (Int32)}
     */
    static UTZFMT_STYLE_ISO_BASIC_LOCAL_FULL => 12

    /**
     * @type {Integer (Int32)}
     */
    static UTZFMT_STYLE_ISO_EXTENDED_FIXED => 13

    /**
     * @type {Integer (Int32)}
     */
    static UTZFMT_STYLE_ISO_EXTENDED_LOCAL_FIXED => 14

    /**
     * @type {Integer (Int32)}
     */
    static UTZFMT_STYLE_ISO_EXTENDED_FULL => 15

    /**
     * @type {Integer (Int32)}
     */
    static UTZFMT_STYLE_ISO_EXTENDED_LOCAL_FULL => 16

    /**
     * @type {Integer (Int32)}
     */
    static UTZFMT_STYLE_ZONE_ID => 17

    /**
     * @type {Integer (Int32)}
     */
    static UTZFMT_STYLE_ZONE_ID_SHORT => 18

    /**
     * @type {Integer (Int32)}
     */
    static UTZFMT_STYLE_EXEMPLAR_LOCATION => 19
}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct UNumberUnitWidth {
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
    static UNUM_UNIT_WIDTH_NARROW => 0

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_UNIT_WIDTH_SHORT => 1

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_UNIT_WIDTH_FULL_NAME => 2

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_UNIT_WIDTH_ISO_CODE => 3

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_UNIT_WIDTH_FORMAL => 4

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_UNIT_WIDTH_VARIANT => 5

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_UNIT_WIDTH_HIDDEN => 6

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_UNIT_WIDTH_COUNT => 7
}

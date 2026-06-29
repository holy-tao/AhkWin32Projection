#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct UFormattableType {
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
    static UFMT_DATE => 0

    /**
     * @type {Integer (Int32)}
     */
    static UFMT_DOUBLE => 1

    /**
     * @type {Integer (Int32)}
     */
    static UFMT_LONG => 2

    /**
     * @type {Integer (Int32)}
     */
    static UFMT_STRING => 3

    /**
     * @type {Integer (Int32)}
     */
    static UFMT_ARRAY => 4

    /**
     * @type {Integer (Int32)}
     */
    static UFMT_INT64 => 5

    /**
     * @type {Integer (Int32)}
     */
    static UFMT_OBJECT => 6
}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct UCurrencySpacing {
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
    static UNUM_CURRENCY_MATCH => 0

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_CURRENCY_SURROUNDING_MATCH => 1

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_CURRENCY_INSERT => 2

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_CURRENCY_SPACING_COUNT => 3
}

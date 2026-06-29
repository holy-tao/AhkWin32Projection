#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct UAlphabeticIndexLabelType {
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
    static U_ALPHAINDEX_NORMAL => 0

    /**
     * @type {Integer (Int32)}
     */
    static U_ALPHAINDEX_UNDERFLOW => 1

    /**
     * @type {Integer (Int32)}
     */
    static U_ALPHAINDEX_INFLOW => 2

    /**
     * @type {Integer (Int32)}
     */
    static U_ALPHAINDEX_OVERFLOW => 3
}

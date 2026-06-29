#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct UNumberDecimalSeparatorDisplay {
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
    static UNUM_DECIMAL_SEPARATOR_AUTO => 0

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_DECIMAL_SEPARATOR_ALWAYS => 1

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_DECIMAL_SEPARATOR_COUNT => 2
}

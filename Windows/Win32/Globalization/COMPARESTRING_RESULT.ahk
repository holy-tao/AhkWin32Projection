#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct COMPARESTRING_RESULT {
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
    static CSTR_LESS_THAN => 1

    /**
     * @type {Integer (Int32)}
     */
    static CSTR_EQUAL => 2

    /**
     * @type {Integer (Int32)}
     */
    static CSTR_GREATER_THAN => 3
}

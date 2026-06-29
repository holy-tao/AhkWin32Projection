#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct UNumberRangeIdentityResult {
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
    static UNUM_IDENTITY_RESULT_EQUAL_BEFORE_ROUNDING => 0

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_IDENTITY_RESULT_EQUAL_AFTER_ROUNDING => 1

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_IDENTITY_RESULT_NOT_EQUAL => 2
}

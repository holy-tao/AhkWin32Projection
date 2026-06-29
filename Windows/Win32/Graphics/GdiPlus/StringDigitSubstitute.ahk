#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
export default struct StringDigitSubstitute {
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
    static StringDigitSubstituteUser => 0

    /**
     * @type {Integer (Int32)}
     */
    static StringDigitSubstituteNone => 1

    /**
     * @type {Integer (Int32)}
     */
    static StringDigitSubstituteNational => 2

    /**
     * @type {Integer (Int32)}
     */
    static StringDigitSubstituteTraditional => 3
}

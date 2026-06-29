#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct UBiDiReorderingMode {
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
    static UBIDI_REORDER_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static UBIDI_REORDER_NUMBERS_SPECIAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static UBIDI_REORDER_GROUP_NUMBERS_WITH_R => 2

    /**
     * @type {Integer (Int32)}
     */
    static UBIDI_REORDER_RUNS_ONLY => 3

    /**
     * @type {Integer (Int32)}
     */
    static UBIDI_REORDER_INVERSE_NUMBERS_AS_L => 4

    /**
     * @type {Integer (Int32)}
     */
    static UBIDI_REORDER_INVERSE_LIKE_DIRECT => 5

    /**
     * @type {Integer (Int32)}
     */
    static UBIDI_REORDER_INVERSE_FOR_NUMBERS_SPECIAL => 6
}

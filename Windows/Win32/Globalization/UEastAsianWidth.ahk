#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct UEastAsianWidth {
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
    static U_EA_NEUTRAL => 0

    /**
     * @type {Integer (Int32)}
     */
    static U_EA_AMBIGUOUS => 1

    /**
     * @type {Integer (Int32)}
     */
    static U_EA_HALFWIDTH => 2

    /**
     * @type {Integer (Int32)}
     */
    static U_EA_FULLWIDTH => 3

    /**
     * @type {Integer (Int32)}
     */
    static U_EA_NARROW => 4

    /**
     * @type {Integer (Int32)}
     */
    static U_EA_WIDE => 5
}

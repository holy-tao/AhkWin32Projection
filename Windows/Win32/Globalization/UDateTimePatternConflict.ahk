#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct UDateTimePatternConflict {
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
    static UDATPG_NO_CONFLICT => 0

    /**
     * @type {Integer (Int32)}
     */
    static UDATPG_BASE_CONFLICT => 1

    /**
     * @type {Integer (Int32)}
     */
    static UDATPG_CONFLICT => 2
}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct UScriptUsage {
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
    static USCRIPT_USAGE_NOT_ENCODED => 0

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_USAGE_UNKNOWN => 1

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_USAGE_EXCLUDED => 2

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_USAGE_LIMITED_USE => 3

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_USAGE_ASPIRATIONAL => 4

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_USAGE_RECOMMENDED => 5
}

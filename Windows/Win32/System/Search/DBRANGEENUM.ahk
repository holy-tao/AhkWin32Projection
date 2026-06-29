#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct DBRANGEENUM {
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
    static DBRANGE_INCLUSIVESTART => 0

    /**
     * @type {Integer (Int32)}
     */
    static DBRANGE_INCLUSIVEEND => 0

    /**
     * @type {Integer (Int32)}
     */
    static DBRANGE_EXCLUSIVESTART => 1

    /**
     * @type {Integer (Int32)}
     */
    static DBRANGE_EXCLUSIVEEND => 2

    /**
     * @type {Integer (Int32)}
     */
    static DBRANGE_EXCLUDENULLS => 4

    /**
     * @type {Integer (Int32)}
     */
    static DBRANGE_PREFIX => 8

    /**
     * @type {Integer (Int32)}
     */
    static DBRANGE_MATCH => 16
}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct DUMP_TYPE {
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
    static DUMP_TYPE_INVALID => -1

    /**
     * @type {Integer (Int32)}
     */
    static DUMP_TYPE_UNKNOWN => 0

    /**
     * @type {Integer (Int32)}
     */
    static DUMP_TYPE_FULL => 1

    /**
     * @type {Integer (Int32)}
     */
    static DUMP_TYPE_SUMMARY => 2

    /**
     * @type {Integer (Int32)}
     */
    static DUMP_TYPE_HEADER => 3

    /**
     * @type {Integer (Int32)}
     */
    static DUMP_TYPE_TRIAGE => 4

    /**
     * @type {Integer (Int32)}
     */
    static DUMP_TYPE_BITMAP_FULL => 5

    /**
     * @type {Integer (Int32)}
     */
    static DUMP_TYPE_BITMAP_KERNEL => 6

    /**
     * @type {Integer (Int32)}
     */
    static DUMP_TYPE_AUTOMATIC => 7
}

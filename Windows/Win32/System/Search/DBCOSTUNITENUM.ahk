#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct DBCOSTUNITENUM {
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
    static DBUNIT_INVALID => 0

    /**
     * @type {Integer (Int32)}
     */
    static DBUNIT_WEIGHT => 1

    /**
     * @type {Integer (Int32)}
     */
    static DBUNIT_PERCENT => 2

    /**
     * @type {Integer (Int32)}
     */
    static DBUNIT_MAXIMUM => 4

    /**
     * @type {Integer (Int32)}
     */
    static DBUNIT_MINIMUM => 8

    /**
     * @type {Integer (Int32)}
     */
    static DBUNIT_MICRO_SECOND => 16

    /**
     * @type {Integer (Int32)}
     */
    static DBUNIT_MILLI_SECOND => 32

    /**
     * @type {Integer (Int32)}
     */
    static DBUNIT_SECOND => 64

    /**
     * @type {Integer (Int32)}
     */
    static DBUNIT_MINUTE => 128

    /**
     * @type {Integer (Int32)}
     */
    static DBUNIT_HOUR => 256

    /**
     * @type {Integer (Int32)}
     */
    static DBUNIT_BYTE => 512

    /**
     * @type {Integer (Int32)}
     */
    static DBUNIT_KILO_BYTE => 1024

    /**
     * @type {Integer (Int32)}
     */
    static DBUNIT_MEGA_BYTE => 2048

    /**
     * @type {Integer (Int32)}
     */
    static DBUNIT_GIGA_BYTE => 4096

    /**
     * @type {Integer (Int32)}
     */
    static DBUNIT_NUM_MSGS => 8192

    /**
     * @type {Integer (Int32)}
     */
    static DBUNIT_NUM_LOCKS => 16384

    /**
     * @type {Integer (Int32)}
     */
    static DBUNIT_NUM_ROWS => 32768

    /**
     * @type {Integer (Int32)}
     */
    static DBUNIT_OTHER => 65536
}

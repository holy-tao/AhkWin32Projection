#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Learn more about: JET_ERRCAT enumeration
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jet-errcat-enumeration
 * @namespace Windows.Win32.Storage.Jet
 */
export default struct JET_ERRCAT {
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
    static JET_errcatUnknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static JET_errcatError => 1

    /**
     * @type {Integer (Int32)}
     */
    static JET_errcatOperation => 2

    /**
     * @type {Integer (Int32)}
     */
    static JET_errcatFatal => 3

    /**
     * @type {Integer (Int32)}
     */
    static JET_errcatIO => 4

    /**
     * @type {Integer (Int32)}
     */
    static JET_errcatResource => 5

    /**
     * @type {Integer (Int32)}
     */
    static JET_errcatMemory => 6

    /**
     * @type {Integer (Int32)}
     */
    static JET_errcatQuota => 7

    /**
     * @type {Integer (Int32)}
     */
    static JET_errcatDisk => 8

    /**
     * @type {Integer (Int32)}
     */
    static JET_errcatData => 9

    /**
     * @type {Integer (Int32)}
     */
    static JET_errcatCorruption => 10

    /**
     * @type {Integer (Int32)}
     */
    static JET_errcatInconsistent => 11

    /**
     * @type {Integer (Int32)}
     */
    static JET_errcatFragmentation => 12

    /**
     * @type {Integer (Int32)}
     */
    static JET_errcatApi => 13

    /**
     * @type {Integer (Int32)}
     */
    static JET_errcatUsage => 14

    /**
     * @type {Integer (Int32)}
     */
    static JET_errcatState => 15

    /**
     * @type {Integer (Int32)}
     */
    static JET_errcatObsolete => 16

    /**
     * @type {Integer (Int32)}
     */
    static JET_errcatMax => 17
}

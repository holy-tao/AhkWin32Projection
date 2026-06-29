#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct KBUGCHECK_DUMP_IO_TYPE {
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
    static KbDumpIoInvalid => 0

    /**
     * @type {Integer (Int32)}
     */
    static KbDumpIoHeader => 1

    /**
     * @type {Integer (Int32)}
     */
    static KbDumpIoBody => 2

    /**
     * @type {Integer (Int32)}
     */
    static KbDumpIoSecondaryData => 3

    /**
     * @type {Integer (Int32)}
     */
    static KbDumpIoComplete => 4
}

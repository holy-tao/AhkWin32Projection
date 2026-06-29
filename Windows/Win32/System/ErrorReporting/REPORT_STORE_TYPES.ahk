#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.ErrorReporting
 */
export default struct REPORT_STORE_TYPES {
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
    static E_STORE_USER_ARCHIVE => 0

    /**
     * @type {Integer (Int32)}
     */
    static E_STORE_USER_QUEUE => 1

    /**
     * @type {Integer (Int32)}
     */
    static E_STORE_MACHINE_ARCHIVE => 2

    /**
     * @type {Integer (Int32)}
     */
    static E_STORE_MACHINE_QUEUE => 3

    /**
     * @type {Integer (Int32)}
     */
    static E_STORE_INVALID => 4
}

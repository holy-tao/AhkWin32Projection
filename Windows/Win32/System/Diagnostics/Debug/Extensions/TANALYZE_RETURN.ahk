#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct TANALYZE_RETURN {
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
    static NO_TYPE => 0

    /**
     * @type {Integer (Int32)}
     */
    static PROCESS_END => 1

    /**
     * @type {Integer (Int32)}
     */
    static EXIT_STATUS => 2

    /**
     * @type {Integer (Int32)}
     */
    static DISK_READ_0_BYTES => 3

    /**
     * @type {Integer (Int32)}
     */
    static DISK_WRITE => 4

    /**
     * @type {Integer (Int32)}
     */
    static NT_STATUS_CODE => 5
}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.WindowsSync
 */
export default struct SYNC_CONSTRAINT_RESOLVE_ACTION {
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
    static SCRA_DEFER => 0

    /**
     * @type {Integer (Int32)}
     */
    static SCRA_ACCEPT_DESTINATION_PROVIDER => 1

    /**
     * @type {Integer (Int32)}
     */
    static SCRA_ACCEPT_SOURCE_PROVIDER => 2

    /**
     * @type {Integer (Int32)}
     */
    static SCRA_TRANSFER_AND_DEFER => 3

    /**
     * @type {Integer (Int32)}
     */
    static SCRA_MERGE => 4

    /**
     * @type {Integer (Int32)}
     */
    static SCRA_RENAME_SOURCE => 5

    /**
     * @type {Integer (Int32)}
     */
    static SCRA_RENAME_DESTINATION => 6
}

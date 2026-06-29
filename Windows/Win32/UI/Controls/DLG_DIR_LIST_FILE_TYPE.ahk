#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct DLG_DIR_LIST_FILE_TYPE {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt32)}
     */
    static DDL_ARCHIVE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DDL_DIRECTORY => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DDL_DRIVES => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static DDL_EXCLUSIVE => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static DDL_HIDDEN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DDL_READONLY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DDL_READWRITE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DDL_SYSTEM => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DDL_POSTMSGS => 8192
}

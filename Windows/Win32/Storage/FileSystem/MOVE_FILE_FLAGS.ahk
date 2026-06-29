#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct MOVE_FILE_FLAGS {
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
    static MOVEFILE_COPY_ALLOWED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MOVEFILE_CREATE_HARDLINK => 16

    /**
     * @type {Integer (UInt32)}
     */
    static MOVEFILE_DELAY_UNTIL_REBOOT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MOVEFILE_REPLACE_EXISTING => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MOVEFILE_WRITE_THROUGH => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MOVEFILE_FAIL_IF_NOT_TRACKABLE => 32
}

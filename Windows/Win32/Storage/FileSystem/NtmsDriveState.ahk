#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct NtmsDriveState {
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
    static NTMS_DRIVESTATE_DISMOUNTED => 0

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_DRIVESTATE_MOUNTED => 1

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_DRIVESTATE_LOADED => 2

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_DRIVESTATE_UNLOADED => 5

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_DRIVESTATE_BEING_CLEANED => 6

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_DRIVESTATE_DISMOUNTABLE => 7
}

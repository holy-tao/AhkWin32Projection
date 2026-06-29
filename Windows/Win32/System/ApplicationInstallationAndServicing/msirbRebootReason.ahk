#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
export default struct msirbRebootReason {
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
    static msirbRebootUndeterminedReason => 0

    /**
     * @type {Integer (Int32)}
     */
    static msirbRebootInUseFilesReason => 1

    /**
     * @type {Integer (Int32)}
     */
    static msirbRebootScheduleRebootReason => 2

    /**
     * @type {Integer (Int32)}
     */
    static msirbRebootForceRebootReason => 3

    /**
     * @type {Integer (Int32)}
     */
    static msirbRebootCustomActionReason => 4
}

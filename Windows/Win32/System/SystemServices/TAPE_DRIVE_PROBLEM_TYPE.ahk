#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct TAPE_DRIVE_PROBLEM_TYPE {
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
    static TapeDriveProblemNone => 0

    /**
     * @type {Integer (Int32)}
     */
    static TapeDriveReadWriteWarning => 1

    /**
     * @type {Integer (Int32)}
     */
    static TapeDriveReadWriteError => 2

    /**
     * @type {Integer (Int32)}
     */
    static TapeDriveReadWarning => 3

    /**
     * @type {Integer (Int32)}
     */
    static TapeDriveWriteWarning => 4

    /**
     * @type {Integer (Int32)}
     */
    static TapeDriveReadError => 5

    /**
     * @type {Integer (Int32)}
     */
    static TapeDriveWriteError => 6

    /**
     * @type {Integer (Int32)}
     */
    static TapeDriveHardwareError => 7

    /**
     * @type {Integer (Int32)}
     */
    static TapeDriveUnsupportedMedia => 8

    /**
     * @type {Integer (Int32)}
     */
    static TapeDriveScsiConnectionError => 9

    /**
     * @type {Integer (Int32)}
     */
    static TapeDriveTimetoClean => 10

    /**
     * @type {Integer (Int32)}
     */
    static TapeDriveCleanDriveNow => 11

    /**
     * @type {Integer (Int32)}
     */
    static TapeDriveMediaLifeExpired => 12

    /**
     * @type {Integer (Int32)}
     */
    static TapeDriveSnappedTape => 13
}

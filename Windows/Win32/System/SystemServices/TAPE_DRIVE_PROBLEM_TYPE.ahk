#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 */
class TAPE_DRIVE_PROBLEM_TYPE extends Win32Enum {

    /**
     * Native name: TapeDriveProblemNone
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Native name: TapeDriveReadWriteWarning
     * @type {Integer (Int32)}
     */
    static ReadWriteWarning => 1

    /**
     * Native name: TapeDriveReadWriteError
     * @type {Integer (Int32)}
     */
    static ReadWriteError => 2

    /**
     * Native name: TapeDriveReadWarning
     * @type {Integer (Int32)}
     */
    static ReadWarning => 3

    /**
     * Native name: TapeDriveWriteWarning
     * @type {Integer (Int32)}
     */
    static WriteWarning => 4

    /**
     * Native name: TapeDriveReadError
     * @type {Integer (Int32)}
     */
    static ReadError => 5

    /**
     * Native name: TapeDriveWriteError
     * @type {Integer (Int32)}
     */
    static WriteError => 6

    /**
     * Native name: TapeDriveHardwareError
     * @type {Integer (Int32)}
     */
    static HardwareError => 7

    /**
     * Native name: TapeDriveUnsupportedMedia
     * @type {Integer (Int32)}
     */
    static UnsupportedMedia => 8

    /**
     * Native name: TapeDriveScsiConnectionError
     * @type {Integer (Int32)}
     */
    static ScsiConnectionError => 9

    /**
     * Native name: TapeDriveTimetoClean
     * @type {Integer (Int32)}
     */
    static TimetoClean => 10

    /**
     * Native name: TapeDriveCleanDriveNow
     * @type {Integer (Int32)}
     */
    static CleanDriveNow => 11

    /**
     * Native name: TapeDriveMediaLifeExpired
     * @type {Integer (Int32)}
     */
    static MediaLifeExpired => 12

    /**
     * Native name: TapeDriveSnappedTape
     * @type {Integer (Int32)}
     */
    static SnappedTape => 13
}

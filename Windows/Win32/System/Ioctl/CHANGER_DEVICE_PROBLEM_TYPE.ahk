#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class CHANGER_DEVICE_PROBLEM_TYPE extends Win32Enum {

    /**
     * Native name: DeviceProblemNone
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Native name: DeviceProblemHardware
     * @type {Integer (Int32)}
     */
    static Hardware => 1

    /**
     * Native name: DeviceProblemCHMError
     * @type {Integer (Int32)}
     */
    static ProblemCHMError => 2

    /**
     * Native name: DeviceProblemDoorOpen
     * @type {Integer (Int32)}
     */
    static DoorOpen => 3

    /**
     * Native name: DeviceProblemCalibrationError
     * @type {Integer (Int32)}
     */
    static CalibrationError => 4

    /**
     * Native name: DeviceProblemTargetFailure
     * @type {Integer (Int32)}
     */
    static TargetFailure => 5

    /**
     * Native name: DeviceProblemCHMMoveError
     * @type {Integer (Int32)}
     */
    static ProblemCHMMoveError => 6

    /**
     * Native name: DeviceProblemCHMZeroError
     * @type {Integer (Int32)}
     */
    static ProblemCHMZeroError => 7

    /**
     * Native name: DeviceProblemCartridgeInsertError
     * @type {Integer (Int32)}
     */
    static CartridgeInsertError => 8

    /**
     * Native name: DeviceProblemPositionError
     * @type {Integer (Int32)}
     */
    static PositionError => 9

    /**
     * Native name: DeviceProblemSensorError
     * @type {Integer (Int32)}
     */
    static SensorError => 10

    /**
     * Native name: DeviceProblemCartridgeEjectError
     * @type {Integer (Int32)}
     */
    static CartridgeEjectError => 11

    /**
     * Native name: DeviceProblemGripperError
     * @type {Integer (Int32)}
     */
    static GripperError => 12

    /**
     * Native name: DeviceProblemDriveError
     * @type {Integer (Int32)}
     */
    static DriveError => 13
}

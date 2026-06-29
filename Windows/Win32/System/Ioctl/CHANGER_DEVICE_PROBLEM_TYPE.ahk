#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct CHANGER_DEVICE_PROBLEM_TYPE {
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
    static DeviceProblemNone => 0

    /**
     * @type {Integer (Int32)}
     */
    static DeviceProblemHardware => 1

    /**
     * @type {Integer (Int32)}
     */
    static DeviceProblemCHMError => 2

    /**
     * @type {Integer (Int32)}
     */
    static DeviceProblemDoorOpen => 3

    /**
     * @type {Integer (Int32)}
     */
    static DeviceProblemCalibrationError => 4

    /**
     * @type {Integer (Int32)}
     */
    static DeviceProblemTargetFailure => 5

    /**
     * @type {Integer (Int32)}
     */
    static DeviceProblemCHMMoveError => 6

    /**
     * @type {Integer (Int32)}
     */
    static DeviceProblemCHMZeroError => 7

    /**
     * @type {Integer (Int32)}
     */
    static DeviceProblemCartridgeInsertError => 8

    /**
     * @type {Integer (Int32)}
     */
    static DeviceProblemPositionError => 9

    /**
     * @type {Integer (Int32)}
     */
    static DeviceProblemSensorError => 10

    /**
     * @type {Integer (Int32)}
     */
    static DeviceProblemCartridgeEjectError => 11

    /**
     * @type {Integer (Int32)}
     */
    static DeviceProblemGripperError => 12

    /**
     * @type {Integer (Int32)}
     */
    static DeviceProblemDriveError => 13
}

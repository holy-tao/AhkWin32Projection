#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Sensors
 */
export default struct PEDOMETER_STEP_TYPE {
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
    static PedometerStepType_Unknown => 1

    /**
     * @type {Integer (Int32)}
     */
    static PedometerStepType_Walking => 2

    /**
     * @type {Integer (Int32)}
     */
    static PedometerStepType_Running => 4

    /**
     * @type {Integer (Int32)}
     */
    static PedometerStepType_Max => 8

    /**
     * @type {Integer (Int32)}
     */
    static PedometerStepType_Force_Dword => -1
}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Sensors
 */
export default struct ACTIVITY_STATE {
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
    static ActivityState_Unknown => 1

    /**
     * @type {Integer (Int32)}
     */
    static ActivityState_Stationary => 2

    /**
     * @type {Integer (Int32)}
     */
    static ActivityState_Fidgeting => 4

    /**
     * @type {Integer (Int32)}
     */
    static ActivityState_Walking => 8

    /**
     * @type {Integer (Int32)}
     */
    static ActivityState_Running => 16

    /**
     * @type {Integer (Int32)}
     */
    static ActivityState_InVehicle => 32

    /**
     * @type {Integer (Int32)}
     */
    static ActivityState_Biking => 64

    /**
     * @type {Integer (Int32)}
     */
    static ActivityState_Idle => 128

    /**
     * @type {Integer (Int32)}
     */
    static ActivityState_Max => 256

    /**
     * @type {Integer (Int32)}
     */
    static ActivityState_Force_Dword => -1
}

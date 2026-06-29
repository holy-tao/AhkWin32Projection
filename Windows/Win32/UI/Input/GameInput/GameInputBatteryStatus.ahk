#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 */
export default struct GameInputBatteryStatus {
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
    static GameInputBatteryUnknown => -1

    /**
     * @type {Integer (Int32)}
     */
    static GameInputBatteryNotPresent => 0

    /**
     * @type {Integer (Int32)}
     */
    static GameInputBatteryDischarging => 1

    /**
     * @type {Integer (Int32)}
     */
    static GameInputBatteryIdle => 2

    /**
     * @type {Integer (Int32)}
     */
    static GameInputBatteryCharging => 3
}

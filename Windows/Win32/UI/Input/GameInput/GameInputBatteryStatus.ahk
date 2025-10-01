#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 * @version v4.0.30319
 */
class GameInputBatteryStatus{

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

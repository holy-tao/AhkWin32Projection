#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 */
class GameInputBatteryStatus extends Win32Enum {

    /**
     * Native name: GameInputBatteryUnknown
     * @type {Integer (Int32)}
     */
    static Unknown => -1

    /**
     * Native name: GameInputBatteryNotPresent
     * @type {Integer (Int32)}
     */
    static NotPresent => 0

    /**
     * Native name: GameInputBatteryDischarging
     * @type {Integer (Int32)}
     */
    static Discharging => 1

    /**
     * Native name: GameInputBatteryIdle
     * @type {Integer (Int32)}
     */
    static Idle => 2

    /**
     * Native name: GameInputBatteryCharging
     * @type {Integer (Int32)}
     */
    static Charging => 3
}

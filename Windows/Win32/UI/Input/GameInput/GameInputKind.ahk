#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 */
class GameInputKind extends Win32BitflagEnum {

    /**
     * Native name: GameInputKindUnknown
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * Native name: GameInputKindRawDeviceReport
     * @type {Integer (Int32)}
     */
    static RawDeviceReport => 1

    /**
     * Native name: GameInputKindControllerAxis
     * @type {Integer (Int32)}
     */
    static ControllerAxis => 2

    /**
     * Native name: GameInputKindControllerButton
     * @type {Integer (Int32)}
     */
    static ControllerButton => 4

    /**
     * Native name: GameInputKindControllerSwitch
     * @type {Integer (Int32)}
     */
    static ControllerSwitch => 8

    /**
     * Native name: GameInputKindController
     * @type {Integer (Int32)}
     */
    static Controller => 14

    /**
     * Native name: GameInputKindKeyboard
     * @type {Integer (Int32)}
     */
    static Keyboard => 16

    /**
     * Native name: GameInputKindMouse
     * @type {Integer (Int32)}
     */
    static Mouse => 32

    /**
     * Native name: GameInputKindTouch
     * @type {Integer (Int32)}
     */
    static Touch => 256

    /**
     * Native name: GameInputKindMotion
     * @type {Integer (Int32)}
     */
    static Motion => 4096

    /**
     * Native name: GameInputKindArcadeStick
     * @type {Integer (Int32)}
     */
    static ArcadeStick => 65536

    /**
     * Native name: GameInputKindFlightStick
     * @type {Integer (Int32)}
     */
    static FlightStick => 131072

    /**
     * Native name: GameInputKindGamepad
     * @type {Integer (Int32)}
     */
    static Gamepad => 262144

    /**
     * Native name: GameInputKindRacingWheel
     * @type {Integer (Int32)}
     */
    static RacingWheel => 524288

    /**
     * Native name: GameInputKindUiNavigation
     * @type {Integer (Int32)}
     */
    static UiNavigation => 16777216
}

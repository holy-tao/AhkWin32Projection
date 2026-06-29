#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 */
export default struct GameInputKind {
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
    static GameInputKindUnknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static GameInputKindRawDeviceReport => 1

    /**
     * @type {Integer (Int32)}
     */
    static GameInputKindControllerAxis => 2

    /**
     * @type {Integer (Int32)}
     */
    static GameInputKindControllerButton => 4

    /**
     * @type {Integer (Int32)}
     */
    static GameInputKindControllerSwitch => 8

    /**
     * @type {Integer (Int32)}
     */
    static GameInputKindController => 14

    /**
     * @type {Integer (Int32)}
     */
    static GameInputKindKeyboard => 16

    /**
     * @type {Integer (Int32)}
     */
    static GameInputKindMouse => 32

    /**
     * @type {Integer (Int32)}
     */
    static GameInputKindTouch => 256

    /**
     * @type {Integer (Int32)}
     */
    static GameInputKindMotion => 4096

    /**
     * @type {Integer (Int32)}
     */
    static GameInputKindArcadeStick => 65536

    /**
     * @type {Integer (Int32)}
     */
    static GameInputKindFlightStick => 131072

    /**
     * @type {Integer (Int32)}
     */
    static GameInputKindGamepad => 262144

    /**
     * @type {Integer (Int32)}
     */
    static GameInputKindRacingWheel => 524288

    /**
     * @type {Integer (Int32)}
     */
    static GameInputKindUiNavigation => 16777216
}

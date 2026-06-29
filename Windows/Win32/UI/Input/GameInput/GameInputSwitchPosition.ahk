#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 */
export default struct GameInputSwitchPosition {
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
    static GameInputSwitchCenter => 0

    /**
     * @type {Integer (Int32)}
     */
    static GameInputSwitchUp => 1

    /**
     * @type {Integer (Int32)}
     */
    static GameInputSwitchUpRight => 2

    /**
     * @type {Integer (Int32)}
     */
    static GameInputSwitchRight => 3

    /**
     * @type {Integer (Int32)}
     */
    static GameInputSwitchDownRight => 4

    /**
     * @type {Integer (Int32)}
     */
    static GameInputSwitchDown => 5

    /**
     * @type {Integer (Int32)}
     */
    static GameInputSwitchDownLeft => 6

    /**
     * @type {Integer (Int32)}
     */
    static GameInputSwitchLeft => 7

    /**
     * @type {Integer (Int32)}
     */
    static GameInputSwitchUpLeft => 8
}

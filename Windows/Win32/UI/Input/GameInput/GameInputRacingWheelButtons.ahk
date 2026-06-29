#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 */
export default struct GameInputRacingWheelButtons {
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
    static GameInputRacingWheelNone => 0

    /**
     * @type {Integer (Int32)}
     */
    static GameInputRacingWheelMenu => 1

    /**
     * @type {Integer (Int32)}
     */
    static GameInputRacingWheelView => 2

    /**
     * @type {Integer (Int32)}
     */
    static GameInputRacingWheelPreviousGear => 4

    /**
     * @type {Integer (Int32)}
     */
    static GameInputRacingWheelNextGear => 8

    /**
     * @type {Integer (Int32)}
     */
    static GameInputRacingWheelDpadUp => 16

    /**
     * @type {Integer (Int32)}
     */
    static GameInputRacingWheelDpadDown => 32

    /**
     * @type {Integer (Int32)}
     */
    static GameInputRacingWheelDpadLeft => 64

    /**
     * @type {Integer (Int32)}
     */
    static GameInputRacingWheelDpadRight => 128
}

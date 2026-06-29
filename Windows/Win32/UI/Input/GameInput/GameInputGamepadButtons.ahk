#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 */
export default struct GameInputGamepadButtons {
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
    static GameInputGamepadNone => 0

    /**
     * @type {Integer (Int32)}
     */
    static GameInputGamepadMenu => 1

    /**
     * @type {Integer (Int32)}
     */
    static GameInputGamepadView => 2

    /**
     * @type {Integer (Int32)}
     */
    static GameInputGamepadA => 4

    /**
     * @type {Integer (Int32)}
     */
    static GameInputGamepadB => 8

    /**
     * @type {Integer (Int32)}
     */
    static GameInputGamepadX => 16

    /**
     * @type {Integer (Int32)}
     */
    static GameInputGamepadY => 32

    /**
     * @type {Integer (Int32)}
     */
    static GameInputGamepadDPadUp => 64

    /**
     * @type {Integer (Int32)}
     */
    static GameInputGamepadDPadDown => 128

    /**
     * @type {Integer (Int32)}
     */
    static GameInputGamepadDPadLeft => 256

    /**
     * @type {Integer (Int32)}
     */
    static GameInputGamepadDPadRight => 512

    /**
     * @type {Integer (Int32)}
     */
    static GameInputGamepadLeftShoulder => 1024

    /**
     * @type {Integer (Int32)}
     */
    static GameInputGamepadRightShoulder => 2048

    /**
     * @type {Integer (Int32)}
     */
    static GameInputGamepadLeftThumbstick => 4096

    /**
     * @type {Integer (Int32)}
     */
    static GameInputGamepadRightThumbstick => 8192
}

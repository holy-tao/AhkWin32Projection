#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 */
export default struct GameInputArcadeStickButtons {
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
    static GameInputArcadeStickNone => 0

    /**
     * @type {Integer (Int32)}
     */
    static GameInputArcadeStickMenu => 1

    /**
     * @type {Integer (Int32)}
     */
    static GameInputArcadeStickView => 2

    /**
     * @type {Integer (Int32)}
     */
    static GameInputArcadeStickUp => 4

    /**
     * @type {Integer (Int32)}
     */
    static GameInputArcadeStickDown => 8

    /**
     * @type {Integer (Int32)}
     */
    static GameInputArcadeStickLeft => 16

    /**
     * @type {Integer (Int32)}
     */
    static GameInputArcadeStickRight => 32

    /**
     * @type {Integer (Int32)}
     */
    static GameInputArcadeStickAction1 => 64

    /**
     * @type {Integer (Int32)}
     */
    static GameInputArcadeStickAction2 => 128

    /**
     * @type {Integer (Int32)}
     */
    static GameInputArcadeStickAction3 => 256

    /**
     * @type {Integer (Int32)}
     */
    static GameInputArcadeStickAction4 => 512

    /**
     * @type {Integer (Int32)}
     */
    static GameInputArcadeStickAction5 => 1024

    /**
     * @type {Integer (Int32)}
     */
    static GameInputArcadeStickAction6 => 2048

    /**
     * @type {Integer (Int32)}
     */
    static GameInputArcadeStickSpecial1 => 4096

    /**
     * @type {Integer (Int32)}
     */
    static GameInputArcadeStickSpecial2 => 8192
}

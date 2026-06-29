#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 */
export default struct GameInputSwitchKind {
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
    static GameInputUnknownSwitchKind => -1

    /**
     * @type {Integer (Int32)}
     */
    static GameInput2WaySwitch => 0

    /**
     * @type {Integer (Int32)}
     */
    static GameInput4WaySwitch => 1

    /**
     * @type {Integer (Int32)}
     */
    static GameInput8WaySwitch => 2
}

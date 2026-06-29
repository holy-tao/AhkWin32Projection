#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 */
export default struct GameInputFeedbackAxes {
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
    static GameInputFeedbackAxisNone => 0

    /**
     * @type {Integer (Int32)}
     */
    static GameInputFeedbackAxisLinearX => 1

    /**
     * @type {Integer (Int32)}
     */
    static GameInputFeedbackAxisLinearY => 2

    /**
     * @type {Integer (Int32)}
     */
    static GameInputFeedbackAxisLinearZ => 4

    /**
     * @type {Integer (Int32)}
     */
    static GameInputFeedbackAxisAngularX => 8

    /**
     * @type {Integer (Int32)}
     */
    static GameInputFeedbackAxisAngularY => 16

    /**
     * @type {Integer (Int32)}
     */
    static GameInputFeedbackAxisAngularZ => 32

    /**
     * @type {Integer (Int32)}
     */
    static GameInputFeedbackAxisNormal => 64
}

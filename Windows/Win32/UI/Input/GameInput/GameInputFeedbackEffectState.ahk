#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 */
export default struct GameInputFeedbackEffectState {
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
    static GameInputFeedbackStopped => 0

    /**
     * @type {Integer (Int32)}
     */
    static GameInputFeedbackRunning => 1

    /**
     * @type {Integer (Int32)}
     */
    static GameInputFeedbackPaused => 2
}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 */
export default struct GameInputFocusPolicy {
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
    static GameInputDefaultFocusPolicy => 0

    /**
     * @type {Integer (Int32)}
     */
    static GameInputDisableBackgroundInput => 1

    /**
     * @type {Integer (Int32)}
     */
    static GameInputExclusiveForegroundInput => 2

    /**
     * @type {Integer (Int32)}
     */
    static GameInputDisableBackgroundGuideButton => 4

    /**
     * @type {Integer (Int32)}
     */
    static GameInputExclusiveForegroundGuideButton => 8

    /**
     * @type {Integer (Int32)}
     */
    static GameInputDisableBackgroundShareButton => 16

    /**
     * @type {Integer (Int32)}
     */
    static GameInputExclusiveForegroundShareButton => 32
}

#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 * @version v4.0.30319
 */
class GameInputFocusPolicy{

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

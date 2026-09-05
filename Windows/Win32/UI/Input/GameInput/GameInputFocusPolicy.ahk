#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 */
class GameInputFocusPolicy extends Win32BitflagEnum {

    /**
     * Native name: GameInputDefaultFocusPolicy
     * @type {Integer (Int32)}
     */
    static DefaultFocusPolicy => 0

    /**
     * Native name: GameInputDisableBackgroundInput
     * @type {Integer (Int32)}
     */
    static DisableBackgroundInput => 1

    /**
     * Native name: GameInputExclusiveForegroundInput
     * @type {Integer (Int32)}
     */
    static ExclusiveForegroundInput => 2

    /**
     * Native name: GameInputDisableBackgroundGuideButton
     * @type {Integer (Int32)}
     */
    static DisableBackgroundGuideButton => 4

    /**
     * Native name: GameInputExclusiveForegroundGuideButton
     * @type {Integer (Int32)}
     */
    static ExclusiveForegroundGuideButton => 8

    /**
     * Native name: GameInputDisableBackgroundShareButton
     * @type {Integer (Int32)}
     */
    static DisableBackgroundShareButton => 16

    /**
     * Native name: GameInputExclusiveForegroundShareButton
     * @type {Integer (Int32)}
     */
    static ExclusiveForegroundShareButton => 32
}

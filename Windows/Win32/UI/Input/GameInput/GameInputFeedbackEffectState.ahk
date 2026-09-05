#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 */
class GameInputFeedbackEffectState extends Win32Enum {

    /**
     * Native name: GameInputFeedbackStopped
     * @type {Integer (Int32)}
     */
    static Stopped => 0

    /**
     * Native name: GameInputFeedbackRunning
     * @type {Integer (Int32)}
     */
    static Running => 1

    /**
     * Native name: GameInputFeedbackPaused
     * @type {Integer (Int32)}
     */
    static Paused => 2
}

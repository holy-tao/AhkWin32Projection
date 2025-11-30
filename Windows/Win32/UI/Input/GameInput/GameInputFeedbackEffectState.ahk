#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 * @version v4.0.30319
 */
class GameInputFeedbackEffectState extends Win32Enum{

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

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 * @version v4.0.30319
 */
class GameInputMotionAccuracy extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static GameInputMotionAccuracyUnknown => -1

    /**
     * @type {Integer (Int32)}
     */
    static GameInputMotionUnavailable => 0

    /**
     * @type {Integer (Int32)}
     */
    static GameInputMotionUnreliable => 1

    /**
     * @type {Integer (Int32)}
     */
    static GameInputMotionApproximate => 2

    /**
     * @type {Integer (Int32)}
     */
    static GameInputMotionAccurate => 3
}

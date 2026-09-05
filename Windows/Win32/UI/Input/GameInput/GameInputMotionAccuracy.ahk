#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 */
class GameInputMotionAccuracy extends Win32Enum {

    /**
     * Native name: GameInputMotionAccuracyUnknown
     * @type {Integer (Int32)}
     */
    static Unknown => -1

    /**
     * Native name: GameInputMotionUnavailable
     * @type {Integer (Int32)}
     */
    static Unavailable => 0

    /**
     * Native name: GameInputMotionUnreliable
     * @type {Integer (Int32)}
     */
    static Unreliable => 1

    /**
     * Native name: GameInputMotionApproximate
     * @type {Integer (Int32)}
     */
    static Approximate => 2

    /**
     * Native name: GameInputMotionAccurate
     * @type {Integer (Int32)}
     */
    static Accurate => 3
}

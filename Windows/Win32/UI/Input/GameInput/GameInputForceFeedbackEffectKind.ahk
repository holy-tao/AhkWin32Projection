#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 */
class GameInputForceFeedbackEffectKind extends Win32Enum {

    /**
     * Native name: GameInputForceFeedbackConstant
     * @type {Integer (Int32)}
     */
    static Constant => 0

    /**
     * Native name: GameInputForceFeedbackRamp
     * @type {Integer (Int32)}
     */
    static Ramp => 1

    /**
     * Native name: GameInputForceFeedbackSineWave
     * @type {Integer (Int32)}
     */
    static SineWave => 2

    /**
     * Native name: GameInputForceFeedbackSquareWave
     * @type {Integer (Int32)}
     */
    static SquareWave => 3

    /**
     * Native name: GameInputForceFeedbackTriangleWave
     * @type {Integer (Int32)}
     */
    static TriangleWave => 4

    /**
     * Native name: GameInputForceFeedbackSawtoothUpWave
     * @type {Integer (Int32)}
     */
    static SawtoothUpWave => 5

    /**
     * Native name: GameInputForceFeedbackSawtoothDownWave
     * @type {Integer (Int32)}
     */
    static SawtoothDownWave => 6

    /**
     * Native name: GameInputForceFeedbackSpring
     * @type {Integer (Int32)}
     */
    static Spring => 7

    /**
     * Native name: GameInputForceFeedbackFriction
     * @type {Integer (Int32)}
     */
    static Friction => 8

    /**
     * Native name: GameInputForceFeedbackDamper
     * @type {Integer (Int32)}
     */
    static Damper => 9

    /**
     * Native name: GameInputForceFeedbackInertia
     * @type {Integer (Int32)}
     */
    static Inertia => 10
}

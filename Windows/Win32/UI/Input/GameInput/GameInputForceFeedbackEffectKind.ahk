#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 */
export default struct GameInputForceFeedbackEffectKind {
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
    static GameInputForceFeedbackConstant => 0

    /**
     * @type {Integer (Int32)}
     */
    static GameInputForceFeedbackRamp => 1

    /**
     * @type {Integer (Int32)}
     */
    static GameInputForceFeedbackSineWave => 2

    /**
     * @type {Integer (Int32)}
     */
    static GameInputForceFeedbackSquareWave => 3

    /**
     * @type {Integer (Int32)}
     */
    static GameInputForceFeedbackTriangleWave => 4

    /**
     * @type {Integer (Int32)}
     */
    static GameInputForceFeedbackSawtoothUpWave => 5

    /**
     * @type {Integer (Int32)}
     */
    static GameInputForceFeedbackSawtoothDownWave => 6

    /**
     * @type {Integer (Int32)}
     */
    static GameInputForceFeedbackSpring => 7

    /**
     * @type {Integer (Int32)}
     */
    static GameInputForceFeedbackFriction => 8

    /**
     * @type {Integer (Int32)}
     */
    static GameInputForceFeedbackDamper => 9

    /**
     * @type {Integer (Int32)}
     */
    static GameInputForceFeedbackInertia => 10
}

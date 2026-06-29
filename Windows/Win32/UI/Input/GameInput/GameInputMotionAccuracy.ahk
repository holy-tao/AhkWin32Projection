#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 */
export default struct GameInputMotionAccuracy {
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

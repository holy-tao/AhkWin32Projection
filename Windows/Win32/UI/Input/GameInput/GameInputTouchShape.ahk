#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 */
export default struct GameInputTouchShape {
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
    static GameInputTouchShapeUnknown => -1

    /**
     * @type {Integer (Int32)}
     */
    static GameInputTouchShapePoint => 0

    /**
     * @type {Integer (Int32)}
     */
    static GameInputTouchShape1DLinear => 1

    /**
     * @type {Integer (Int32)}
     */
    static GameInputTouchShape1DRadial => 2

    /**
     * @type {Integer (Int32)}
     */
    static GameInputTouchShape1DIrregular => 3

    /**
     * @type {Integer (Int32)}
     */
    static GameInputTouchShape2DRectangular => 4

    /**
     * @type {Integer (Int32)}
     */
    static GameInputTouchShape2DElliptical => 5

    /**
     * @type {Integer (Int32)}
     */
    static GameInputTouchShape2DIrregular => 6
}

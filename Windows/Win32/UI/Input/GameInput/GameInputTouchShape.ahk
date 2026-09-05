#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 */
class GameInputTouchShape extends Win32Enum {

    /**
     * Native name: GameInputTouchShapeUnknown
     * @type {Integer (Int32)}
     */
    static Unknown => -1

    /**
     * Native name: GameInputTouchShapePoint
     * @type {Integer (Int32)}
     */
    static Point => 0

    /**
     * Native name: GameInputTouchShape1DLinear
     * @type {Integer (Int32)}
     */
    static Shape1DLinear => 1

    /**
     * Native name: GameInputTouchShape1DRadial
     * @type {Integer (Int32)}
     */
    static Shape1DRadial => 2

    /**
     * Native name: GameInputTouchShape1DIrregular
     * @type {Integer (Int32)}
     */
    static Shape1DIrregular => 3

    /**
     * Native name: GameInputTouchShape2DRectangular
     * @type {Integer (Int32)}
     */
    static Shape2DRectangular => 4

    /**
     * Native name: GameInputTouchShape2DElliptical
     * @type {Integer (Int32)}
     */
    static Shape2DElliptical => 5

    /**
     * Native name: GameInputTouchShape2DIrregular
     * @type {Integer (Int32)}
     */
    static Shape2DIrregular => 6
}

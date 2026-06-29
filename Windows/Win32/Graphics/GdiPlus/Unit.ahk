#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
export default struct Unit {
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
    static UnitWorld => 0

    /**
     * @type {Integer (Int32)}
     */
    static UnitDisplay => 1

    /**
     * @type {Integer (Int32)}
     */
    static UnitPixel => 2

    /**
     * @type {Integer (Int32)}
     */
    static UnitPoint => 3

    /**
     * @type {Integer (Int32)}
     */
    static UnitInch => 4

    /**
     * @type {Integer (Int32)}
     */
    static UnitDocument => 5

    /**
     * @type {Integer (Int32)}
     */
    static UnitMillimeter => 6
}

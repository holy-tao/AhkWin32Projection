#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct BRUSH_STYLE {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt32)}
     */
    static BS_SOLID => 0

    /**
     * @type {Integer (UInt32)}
     */
    static BS_NULL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static BS_HOLLOW => 1

    /**
     * @type {Integer (UInt32)}
     */
    static BS_HATCHED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static BS_PATTERN => 3

    /**
     * @type {Integer (UInt32)}
     */
    static BS_INDEXED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static BS_DIBPATTERN => 5

    /**
     * @type {Integer (UInt32)}
     */
    static BS_DIBPATTERNPT => 6

    /**
     * @type {Integer (UInt32)}
     */
    static BS_PATTERN8X8 => 7

    /**
     * @type {Integer (UInt32)}
     */
    static BS_DIBPATTERN8X8 => 8

    /**
     * @type {Integer (UInt32)}
     */
    static BS_MONOPATTERN => 9
}

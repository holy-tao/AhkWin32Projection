#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
export default struct DitherType {
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
    static DitherTypeNone => 0

    /**
     * @type {Integer (Int32)}
     */
    static DitherTypeSolid => 1

    /**
     * @type {Integer (Int32)}
     */
    static DitherTypeOrdered4x4 => 2

    /**
     * @type {Integer (Int32)}
     */
    static DitherTypeOrdered8x8 => 3

    /**
     * @type {Integer (Int32)}
     */
    static DitherTypeOrdered16x16 => 4

    /**
     * @type {Integer (Int32)}
     */
    static DitherTypeSpiral4x4 => 5

    /**
     * @type {Integer (Int32)}
     */
    static DitherTypeSpiral8x8 => 6

    /**
     * @type {Integer (Int32)}
     */
    static DitherTypeDualSpiral4x4 => 7

    /**
     * @type {Integer (Int32)}
     */
    static DitherTypeDualSpiral8x8 => 8

    /**
     * @type {Integer (Int32)}
     */
    static DitherTypeErrorDiffusion => 9

    /**
     * @type {Integer (Int32)}
     */
    static DitherTypeMax => 10
}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct ExtendedArrayDimensionFlags {
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
    static ExtendedArrayLengthIsOffset32 => 1

    /**
     * @type {Integer (Int32)}
     */
    static ExtendedArrayLengthIsOffset64 => 2

    /**
     * @type {Integer (Int32)}
     */
    static ExtendedArrayLengthIsOffset => 3

    /**
     * @type {Integer (Int32)}
     */
    static ExtendedArrayLowerBoundIsOffset32 => 4

    /**
     * @type {Integer (Int32)}
     */
    static ExtendedArrayLowerBoundIsOffset64 => 8

    /**
     * @type {Integer (Int32)}
     */
    static ExtendedArrayLowerBoundIsOffset => 12

    /**
     * @type {Integer (Int32)}
     */
    static ExtendedArrayStrideIsOffset32 => 16

    /**
     * @type {Integer (Int32)}
     */
    static ExtendedArrayStrideIsOffset64 => 32

    /**
     * @type {Integer (Int32)}
     */
    static ExtendedArrayStrideIsOffset => 48

    /**
     * @type {Integer (Int32)}
     */
    static ExtendedArrayStrideIsComputedByNextRank => 64

    /**
     * @type {Integer (Int32)}
     */
    static ExtendedArrayStrideIsComputedByPreviousRank => 128

    /**
     * @type {Integer (Int32)}
     */
    static ExtendedArrayStrideIsComputed => 192
}

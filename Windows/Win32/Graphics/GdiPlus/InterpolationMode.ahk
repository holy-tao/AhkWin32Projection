#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
export default struct InterpolationMode {
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
    static InterpolationModeInvalid => -1

    /**
     * @type {Integer (Int32)}
     */
    static InterpolationModeDefault => 0

    /**
     * @type {Integer (Int32)}
     */
    static InterpolationModeLowQuality => 1

    /**
     * @type {Integer (Int32)}
     */
    static InterpolationModeHighQuality => 2

    /**
     * @type {Integer (Int32)}
     */
    static InterpolationModeBilinear => 3

    /**
     * @type {Integer (Int32)}
     */
    static InterpolationModeBicubic => 4

    /**
     * @type {Integer (Int32)}
     */
    static InterpolationModeNearestNeighbor => 5

    /**
     * @type {Integer (Int32)}
     */
    static InterpolationModeHighQualityBilinear => 6

    /**
     * @type {Integer (Int32)}
     */
    static InterpolationModeHighQualityBicubic => 7
}

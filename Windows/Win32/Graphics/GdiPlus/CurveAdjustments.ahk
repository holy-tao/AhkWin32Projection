#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
export default struct CurveAdjustments {
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
    static AdjustExposure => 0

    /**
     * @type {Integer (Int32)}
     */
    static AdjustDensity => 1

    /**
     * @type {Integer (Int32)}
     */
    static AdjustContrast => 2

    /**
     * @type {Integer (Int32)}
     */
    static AdjustHighlight => 3

    /**
     * @type {Integer (Int32)}
     */
    static AdjustShadow => 4

    /**
     * @type {Integer (Int32)}
     */
    static AdjustMidtone => 5

    /**
     * @type {Integer (Int32)}
     */
    static AdjustWhiteSaturation => 6

    /**
     * @type {Integer (Int32)}
     */
    static AdjustBlackSaturation => 7
}

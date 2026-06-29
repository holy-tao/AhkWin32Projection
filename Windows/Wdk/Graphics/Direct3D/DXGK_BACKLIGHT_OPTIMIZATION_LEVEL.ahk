#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct DXGK_BACKLIGHT_OPTIMIZATION_LEVEL {
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
    static DxgkBacklightOptimizationDisable => 0

    /**
     * @type {Integer (Int32)}
     */
    static DxgkBacklightOptimizationDesktop => 1

    /**
     * @type {Integer (Int32)}
     */
    static DxgkBacklightOptimizationDynamic => 2

    /**
     * @type {Integer (Int32)}
     */
    static DxgkBacklightOptimizationDimmed => 3

    /**
     * @type {Integer (Int32)}
     */
    static DxgkBacklightOptimizationEDR => 4
}

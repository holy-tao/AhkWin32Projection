#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct DISPLAYID_DETAILED_TIMING_TYPE_I_ASPECT_RATIO {
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
    static DIDDT1_AspectRatio_1x1 => 0

    /**
     * @type {Integer (Int32)}
     */
    static DIDDT1_AspectRatio_5x4 => 1

    /**
     * @type {Integer (Int32)}
     */
    static DIDDT1_AspectRatio_4x3 => 2

    /**
     * @type {Integer (Int32)}
     */
    static DIDDT1_AspectRatio_15x9 => 3

    /**
     * @type {Integer (Int32)}
     */
    static DIDDT1_AspectRatio_16x9 => 4

    /**
     * @type {Integer (Int32)}
     */
    static DIDDT1_AspectRatio_16x10 => 5
}

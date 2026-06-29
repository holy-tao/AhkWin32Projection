#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct D2D1_INTERPOLATION_MODE_DEFINITION {
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
    static D2D1_INTERPOLATION_MODE_DEFINITION_NEAREST_NEIGHBOR => 0

    /**
     * @type {Integer (Int32)}
     */
    static D2D1_INTERPOLATION_MODE_DEFINITION_LINEAR => 1

    /**
     * @type {Integer (Int32)}
     */
    static D2D1_INTERPOLATION_MODE_DEFINITION_CUBIC => 2

    /**
     * @type {Integer (Int32)}
     */
    static D2D1_INTERPOLATION_MODE_DEFINITION_MULTI_SAMPLE_LINEAR => 3

    /**
     * @type {Integer (Int32)}
     */
    static D2D1_INTERPOLATION_MODE_DEFINITION_ANISOTROPIC => 4

    /**
     * @type {Integer (Int32)}
     */
    static D2D1_INTERPOLATION_MODE_DEFINITION_HIGH_QUALITY_CUBIC => 5

    /**
     * @type {Integer (Int32)}
     */
    static D2D1_INTERPOLATION_MODE_DEFINITION_FANT => 6

    /**
     * @type {Integer (Int32)}
     */
    static D2D1_INTERPOLATION_MODE_DEFINITION_MIPMAP_LINEAR => 7
}

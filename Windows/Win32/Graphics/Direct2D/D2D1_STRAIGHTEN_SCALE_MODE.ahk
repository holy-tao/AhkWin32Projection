#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Values for the D2D1_STRAIGHTEN_PROP_SCALE_MODE property of the Straighten effect.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1effects_2/ne-d2d1effects_2-d2d1_straighten_scale_mode
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct D2D1_STRAIGHTEN_SCALE_MODE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Indicates nearest neighbor interpolation should be used.
     * @type {Integer (Int32)}
     */
    static D2D1_STRAIGHTEN_SCALE_MODE_NEAREST_NEIGHBOR => 0

    /**
     * Indicates linear interpolation should be used.
     * @type {Integer (Int32)}
     */
    static D2D1_STRAIGHTEN_SCALE_MODE_LINEAR => 1

    /**
     * Indicates cubic interpolation should be used.
     * @type {Integer (Int32)}
     */
    static D2D1_STRAIGHTEN_SCALE_MODE_CUBIC => 2

    /**
     * Indicates multi-sample linear interpolation should be used.
     * @type {Integer (Int32)}
     */
    static D2D1_STRAIGHTEN_SCALE_MODE_MULTI_SAMPLE_LINEAR => 3

    /**
     * Indicates anisotropic filtering should be used.
     * @type {Integer (Int32)}
     */
    static D2D1_STRAIGHTEN_SCALE_MODE_ANISOTROPIC => 4
}

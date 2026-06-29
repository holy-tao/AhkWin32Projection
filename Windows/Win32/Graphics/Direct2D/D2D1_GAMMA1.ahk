#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Determines what gamma is used for interpolation and blending.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/ne-d2d1_3-d2d1_gamma1
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct D2D1_GAMMA1 {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Colors are manipulated in 2.2 gamma color space.
     * @type {Integer (Int32)}
     */
    static D2D1_GAMMA1_G22 => 0

    /**
     * Colors are manipulated in 1.0 gamma color space.
     * @type {Integer (Int32)}
     */
    static D2D1_GAMMA1_G10 => 1

    /**
     * Colors are manipulated in ST.2084 PQ gamma color space.
     * @type {Integer (Int32)}
     */
    static D2D1_GAMMA1_G2084 => 2
}

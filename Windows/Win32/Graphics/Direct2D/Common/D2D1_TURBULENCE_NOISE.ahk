#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The turbulence noise mode for the Turbulence effect. Indicates whether to generate a bitmap based on Fractal Noise or the Turbulence function.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1effects/ne-d2d1effects-d2d1_turbulence_noise
 * @namespace Windows.Win32.Graphics.Direct2D.Common
 */
export default struct D2D1_TURBULENCE_NOISE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Computes a sum of the octaves, shifting the output range from [-1, 1], to [0, 1].
     * @type {Integer (Int32)}
     */
    static D2D1_TURBULENCE_NOISE_FRACTAL_SUM => 0

    /**
     * Computes a sum of the absolute value of each octave.
     * @type {Integer (Int32)}
     */
    static D2D1_TURBULENCE_NOISE_TURBULENCE => 1
}

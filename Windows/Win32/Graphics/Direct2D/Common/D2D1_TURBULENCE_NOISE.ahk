#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * The turbulence noise mode for the Turbulence effect. Indicates whether to generate a bitmap based on Fractal Noise or the Turbulence function.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1effects/ne-d2d1effects-d2d1_turbulence_noise
 * @namespace Windows.Win32.Graphics.Direct2D.Common
 */
class D2D1_TURBULENCE_NOISE extends Win32Enum {

    /**
     * Computes a sum of the octaves, shifting the output range from [-1, 1], to [0, 1].
     * Native name: D2D1_TURBULENCE_NOISE_FRACTAL_SUM
     * @type {Integer (Int32)}
     */
    static FRACTAL_SUM => 0

    /**
     * Computes a sum of the absolute value of each octave.
     * Native name: D2D1_TURBULENCE_NOISE_TURBULENCE
     * @type {Integer (Int32)}
     */
    static TURBULENCE => 1
}

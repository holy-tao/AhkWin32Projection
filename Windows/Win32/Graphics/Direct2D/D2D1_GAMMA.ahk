#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies which gamma is used for interpolation.
 * @remarks
 * 
 * Interpolating in a linear gamma space (<b>D2D1_GAMMA_1_0</b>) can avoid changes in perceived brightness caused by the effect of gamma correction in spaces where the gamma is not 1.0, such as the default sRGB color space, where the gamma is 2.2. For an example of the differences between these two blending modes, consider the following illustration, which shows two gradients, each of which blends from red to blue to green:
 * 
 * <img alt="Illustration of two gradients from red to blue to green, blended by using sRGB gamma and linear-gamma" src="./images/D2D1_GAMMA.png"/>
 * 
 * The first gradient is interpolated linearly in the space of the render target (sRGB in this case), and one can see the dark bands between each color. The second gradient uses a gamma-correct linear interpolation, and thus does not exhibit the same variations in brightness.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d2d1/ne-d2d1-d2d1_gamma
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_GAMMA{

    /**
     * Interpolation is performed in the standard RGB (sRGB) gamma.
     * @type {Integer (Int32)}
     */
    static D2D1_GAMMA_2_2 => 0

    /**
     * Interpolation is performed in the linear-gamma color space.
     * @type {Integer (Int32)}
     */
    static D2D1_GAMMA_1_0 => 1
}

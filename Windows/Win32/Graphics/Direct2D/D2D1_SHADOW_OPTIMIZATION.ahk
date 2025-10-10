#Requires AutoHotkey v2.0.0 64-bit

/**
 * The level of performance optimization for the Shadow effect.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1effects/ne-d2d1effects-d2d1_shadow_optimization
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_SHADOW_OPTIMIZATION{

    /**
     * Applies internal optimizations such as pre-scaling at relatively small radii. Uses linear filtering.
     * @type {Integer (Int32)}
     */
    static D2D1_SHADOW_OPTIMIZATION_SPEED => 0

    /**
     * Uses the same optimization thresholds as Speed mode, but uses trilinear filtering.
     * @type {Integer (Int32)}
     */
    static D2D1_SHADOW_OPTIMIZATION_BALANCED => 1

    /**
     * Only uses internal optimizations with large blur radii, where approximations are less likely to be visible. Uses trilinear filtering.
     * @type {Integer (Int32)}
     */
    static D2D1_SHADOW_OPTIMIZATION_QUALITY => 2
}

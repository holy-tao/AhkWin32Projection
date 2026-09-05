#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The optimization mode for the Gaussian blur effect.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1effects/ne-d2d1effects-d2d1_gaussianblur_optimization
 * @namespace Windows.Win32.Graphics.Direct2D
 */
class D2D1_GAUSSIANBLUR_OPTIMIZATION extends Win32Enum {

    /**
     * Applies internal optimizations such as pre-scaling at relatively small radii. Uses linear filtering.
     * Native name: D2D1_GAUSSIANBLUR_OPTIMIZATION_SPEED
     * @type {Integer (Int32)}
     */
    static SPEED => 0

    /**
     * Uses the same optimization thresholds as Speed mode, but uses trilinear filtering.
     * Native name: D2D1_GAUSSIANBLUR_OPTIMIZATION_BALANCED
     * @type {Integer (Int32)}
     */
    static BALANCED => 1

    /**
     * Only uses internal optimizations with large blur radii, where approximations are less likely to be visible. Uses trilinear filtering.
     * Native name: D2D1_GAUSSIANBLUR_OPTIMIZATION_QUALITY
     * @type {Integer (Int32)}
     */
    static QUALITY => 2
}

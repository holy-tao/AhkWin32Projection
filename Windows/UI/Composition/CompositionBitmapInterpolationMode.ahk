#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the algorithm used for interpolating pixels from ICompositionSurface when they do not form a one-to-one mapping to pixels on screen.
 * @remarks
 * Interpolating pixels is necessary when the pixels of an [ICompositionSurface](icompositionsurface.md) do not form a one-to-one mapping to the pixels of a [SpriteVisual](spritevisual.md); this can happen under scale, stretch, rotation, skew, or other transformations (such as perspective projection, etc.).
 * 
 * When the bitmap contents of an [ICompositionSurface](icompositionsurface.md) are mapped to a [SpriteVisual](spritevisual.md) whose size is larger than that of the bitmap, each pixel from the surface must be mapped to a group of pixels on screen.
 * 
 * Conversely, when the bitmap contents of an [ICompositionSurface](icompositionsurface.md) are mapped to a [SpriteVisual](spritevisual.md) whose size is smaller than that of the bitmap, multiple pixels from the surface must be mapped to single pixels on screen.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionbitmapinterpolationmode
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class CompositionBitmapInterpolationMode extends Win32Enum{

    /**
     * Use the exact color of the nearest bitmap pixel to the current rendering pixel.
     * @type {Integer (Int32)}
     */
    static NearestNeighbor => 0

    /**
     * Interpolate a color from the four bitmap pixels that are the nearest to the current rendering pixel.
     * @type {Integer (Int32)}
     */
    static Linear => 1

    /**
     * Use Linear interpolation for magnification, minification, and mip-level sampling.
     * @type {Integer (Int32)}
     */
    static MagLinearMinLinearMipLinear => 2

    /**
     * Use Linear interpolation for magnification and minification; use NearestNeighbor for mip-level sampling.
     * @type {Integer (Int32)}
     */
    static MagLinearMinLinearMipNearest => 3

    /**
     * Use Linear interpolation for magnification; use NearestNeighbor for minification; use Linear interpolation for mip-level sampling.
     * @type {Integer (Int32)}
     */
    static MagLinearMinNearestMipLinear => 4

    /**
     * Use Linear interpolation for magnification; use NearestNeighbor for minification and mip-level sampling.
     * @type {Integer (Int32)}
     */
    static MagLinearMinNearestMipNearest => 5

    /**
     * Use NearestNeighbor for magnification; use Linear interpolation for minification and mip-level sampling.
     * @type {Integer (Int32)}
     */
    static MagNearestMinLinearMipLinear => 6

    /**
     * Use NearestNeighbor for magnification; use Linear interpolation for minification; use NearestNeighbor for mip-level sampling.
     * @type {Integer (Int32)}
     */
    static MagNearestMinLinearMipNearest => 7

    /**
     * Use NearestNeighbor for magnification and minification; use Linear interpolation for mip-level sampling.
     * @type {Integer (Int32)}
     */
    static MagNearestMinNearestMipLinear => 8

    /**
     * Use NearestNeighbor for magnification, minification, and mip-level sampling.
     * @type {Integer (Int32)}
     */
    static MagNearestMinNearestMipNearest => 9
}

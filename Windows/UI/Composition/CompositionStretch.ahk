#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies how content is scaled when mapped from its source to a destination space.
 * @remarks
 * For stretching the contents of a [CompositionSurfaceBrush](compositionsurfacebrush.md) onto a [SpriteVisual](spritevisual.md), refer to the CompositionSurfaceBrush.[Stretch](compositionsurfacebrush_stretch.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionstretch
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class CompositionStretch extends Win32Enum{

    /**
     * No Scaling. If the size of the content is greater than size of destination, the content is clipped to the bounds of the destination space.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Scale content such that its size is equal to the size of the destination. The aspect ratio of the content is not preserved.
     * @type {Integer (Int32)}
     */
    static Fill => 1

    /**
     * Scale content such that its aspect ratio is preserved and it fits entirely within the bounds of the destination space. If the content’s aspect ratio does not match that of the destination, the content will not cover some of the area bound by the destination space. This is the default value for CompositionSurfaceBrush.[Stretch](compositionsurfacebrush_stretch.md).
     * @type {Integer (Int32)}
     */
    static Uniform => 2

    /**
     * Scale content such that its aspect ratio is preserved and it fills the entirety of the destination’s bounds. If the content’s aspect ratio does not match that of the destination, the content will be clipped to the bounds of the destination.
     * @type {Integer (Int32)}
     */
    static UniformToFill => 3
}

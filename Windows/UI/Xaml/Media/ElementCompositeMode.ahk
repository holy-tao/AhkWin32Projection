#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Declares alternate composition and blending modes for elements in mixed XAML / Microsoft DirectX UI.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.elementcompositemode
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class ElementCompositeMode extends Win32Enum{

    /**
     * Uses values from successive parents in the visual tree. This is the default.
     * @type {Integer (Int32)}
     */
    static Inherit => 0

    /**
     * Uses standard XAML source-over-destination mode. This corresponds to [D2D1_PRIMITIVE_BLEND_SOURCE_OVER](/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_primitive_blend).
     * @type {Integer (Int32)}
     */
    static SourceOver => 1

    /**
     * Uses the minimum of the source and destination value for each pixel. This corresponds to [D2D1_PRIMITIVE_BLEND_MIN](/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_primitive_blend).
     * @type {Integer (Int32)}
     */
    static MinBlend => 2
}

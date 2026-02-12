#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Describes what kind of Advanced Color the display supports.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.advancedcolorkind
 * @namespace Windows.Graphics.Display
 * @version WindowsRuntime 1.4
 */
class AdvancedColorKind extends Win32Enum{

    /**
     * The display only supports standard dynamic range. In this case, it is safe to assume that OS composition is being done using an RGB:8 surface encoded as sRGB gamma. The actual wire signalling is usually done using sRGB.
     * @type {Integer (Int32)}
     */
    static StandardDynamicRange => 0

    /**
     * The display supports Wide Color Gamut. In this case, it is safe to assume that OS composition is being done using an RGB:FP16 surface encoded as scRGB gamma. The actual wire signalling is usually done using sRGB.
     * @type {Integer (Int32)}
     */
    static WideColorGamut => 1

    /**
     * The display supports high dynamic range. In this case, it is safe to assume that OS composition is being done using an RGB:FP16 surface encoded as scRGB gamma. The actual wire signalling is usually done using ST2084.
     * @type {Integer (Int32)}
     */
    static HighDynamicRange => 2
}

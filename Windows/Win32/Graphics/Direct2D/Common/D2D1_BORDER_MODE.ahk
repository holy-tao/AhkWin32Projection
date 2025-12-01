#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Specifies how the Crop effect handles the crop rectangle falling on fractional pixel coordinates.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1effects/ne-d2d1effects-d2d1_border_mode
 * @namespace Windows.Win32.Graphics.Direct2D.Common
 * @version v4.0.30319
 */
class D2D1_BORDER_MODE extends Win32Enum{

    /**
     * If the crop rectangle falls on fractional pixel coordinates, the effect applies antialiasing which results in a soft edge.
     * @type {Integer (Int32)}
     */
    static D2D1_BORDER_MODE_SOFT => 0

    /**
     * If the crop rectangle falls on fractional pixel coordinates, the effect clamps which results in a hard edge.
     * @type {Integer (Int32)}
     */
    static D2D1_BORDER_MODE_HARD => 1
}

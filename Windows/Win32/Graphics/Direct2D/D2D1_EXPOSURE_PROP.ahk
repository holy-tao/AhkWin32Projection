#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Identifiers for properties of the Exposure effect.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1effects_2/ne-d2d1effects_2-d2d1_exposure_prop
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_EXPOSURE_PROP extends Win32Enum{

    /**
     * The D2D1_EXPOSURE_PROP_EXPOSURE_VALUE property is a float value that specifies how much to increase or decrease the exposure of the image. The allowed range is -2.0 to 2.0. The default value is 0.0 (no change).
     * @type {Integer (Int32)}
     */
    static D2D1_EXPOSURE_PROP_EXPOSURE_VALUE => 0
}

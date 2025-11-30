#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The mode for the Morphology effect.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1effects/ne-d2d1effects-d2d1_morphology_mode
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_MORPHOLOGY_MODE extends Win32Enum{

    /**
     * The maximum value from each RGB channel in the kernel is used.
     * @type {Integer (Int32)}
     */
    static D2D1_MORPHOLOGY_MODE_ERODE => 0

    /**
     * The minimum value from each RGB channel in the kernel is used.
     * @type {Integer (Int32)}
     */
    static D2D1_MORPHOLOGY_MODE_DILATE => 1
}

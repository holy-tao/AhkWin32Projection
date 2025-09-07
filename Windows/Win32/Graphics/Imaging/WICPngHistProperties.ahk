#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the Portable Network Graphics (PNG) hIST chunk metadata properties.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ne-wincodec-wicpnghistproperties
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class WICPngHistProperties{

    /**
     * [VT_VECTOR | VT_UI2] Indicates the approximate usage frequency of each color in the color palette.
     * @type {Integer (Int32)}
     */
    static WICPngHistFrequencies => 1
}

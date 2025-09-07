#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the color context types.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ne-wincodec-wiccolorcontexttype
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class WICColorContextType{

    /**
     * An uninitialized color context.
     * @type {Integer (Int32)}
     */
    static WICColorContextUninitialized => 0

    /**
     * A color context that is a full ICC color profile.
     * @type {Integer (Int32)}
     */
    static WICColorContextProfile => 1

    /**
     * A color context that is one of a number of set color spaces (sRGB, AdobeRGB) that are defined in the EXIF specification.
     * @type {Integer (Int32)}
     */
    static WICColorContextExifColorSpace => 2
}

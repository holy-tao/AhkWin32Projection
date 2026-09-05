#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the color context types.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ne-wincodec-wiccolorcontexttype
 * @namespace Windows.Win32.Graphics.Imaging
 */
class WICColorContextType extends Win32Enum {

    /**
     * An uninitialized color context.
     * Native name: WICColorContextUninitialized
     * @type {Integer (Int32)}
     */
    static Uninitialized => 0

    /**
     * A color context that is a full ICC color profile.
     * Native name: WICColorContextProfile
     * @type {Integer (Int32)}
     */
    static Profile => 1

    /**
     * A color context that is one of a number of set color spaces (sRGB, AdobeRGB) that are defined in the EXIF specification.
     * Native name: WICColorContextExifColorSpace
     * @type {Integer (Int32)}
     */
    static ExifColorSpace => 2
}

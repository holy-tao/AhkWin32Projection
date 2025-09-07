#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines constants that specify a four-character identifier for a font axis.
 * @remarks
 * You can use the **DWRITE_MAKE_FONT_AXIS_TAG(a,b,c,d)** macro to create your own custom identifiers. Here's an example.
  * 
  * ```cpp
  * DWRITE_MAKE_FONT_AXIS_TAG('c', 's', 't', 'm');
  * ```
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/ne-dwrite_3-dwrite_font_axis_tag
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class DWRITE_FONT_AXIS_TAG{

    /**
     * Specifies the weight axis, using the identifier 'w','g','h','t'.
     * @type {Integer (UInt32)}
     */
    static DWRITE_FONT_AXIS_TAG_WEIGHT => 1952999287

    /**
     * Specifies the width axis, using the identifier 'w','d','t','h'.
     * @type {Integer (UInt32)}
     */
    static DWRITE_FONT_AXIS_TAG_WIDTH => 1752458359

    /**
     * Specifies the slant axis, using the identifier 's','l','n','t'.
     * @type {Integer (UInt32)}
     */
    static DWRITE_FONT_AXIS_TAG_SLANT => 1953393779

    /**
     * Specifies the optical size axis, using the identifier 'o','p','s','z'.
     * @type {Integer (UInt32)}
     */
    static DWRITE_FONT_AXIS_TAG_OPTICAL_SIZE => 2054385775

    /**
     * Specifies the italic axis, using the identifier 'i','t','a','l'.
     * @type {Integer (UInt32)}
     */
    static DWRITE_FONT_AXIS_TAG_ITALIC => 1818326121
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates the measuring method used for text layout.
 * @see https://docs.microsoft.com/windows/win32/api//dcommon/ne-dcommon-dwrite_measuring_mode
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class DWRITE_MEASURING_MODE extends Win32Enum{

    /**
     * Specifies that text is measured using glyph ideal metrics whose values are independent to the current display resolution.
     * @type {Integer (Int32)}
     */
    static DWRITE_MEASURING_MODE_NATURAL => 0

    /**
     * Specifies that text is measured using glyph display-compatible metrics whose values tuned for the current display resolution.
     * @type {Integer (Int32)}
     */
    static DWRITE_MEASURING_MODE_GDI_CLASSIC => 1

    /**
     * Specifies that text is measured using the same glyph display metrics as text measured by GDI using a font created with CLEARTYPE_NATURAL_QUALITY.
     * @type {Integer (Int32)}
     */
    static DWRITE_MEASURING_MODE_GDI_NATURAL => 2
}

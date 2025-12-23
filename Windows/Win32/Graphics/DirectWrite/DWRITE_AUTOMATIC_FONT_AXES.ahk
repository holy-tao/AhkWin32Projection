#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify certain axes that can be applied automatically in layout during font selection.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/ne-dwrite_3-dwrite_automatic_font_axes
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class DWRITE_AUTOMATIC_FONT_AXES extends Win32BitflagEnum{

    /**
     * Specifies that no axes are automatically applied.
     * @type {Integer (Int32)}
     */
    static DWRITE_AUTOMATIC_FONT_AXES_NONE => 0

    /**
     * Specifies that&mdash;when no value is specified via <a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/ne-dwrite_3-dwrite_font_axis_tag">DWRITE_FONT_AXIS_TAG_OPTICAL_SIZE</a>&mdash;an appropriate optical value should be automatically chosen based on the font size (via <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextlayout-setfontsize">IDWriteTextLayout::SetFontSize</a>). You can still apply the 'opsz' value over text ranges via <a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritetextformat3-setfontaxisvalues">IDWriteTextFormat3::SetFontAxisValues</a>, which take priority.
     * @type {Integer (Int32)}
     */
    static DWRITE_AUTOMATIC_FONT_AXES_OPTICAL_SIZE => 1
}

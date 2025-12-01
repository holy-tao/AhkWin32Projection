#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify attributes for a font axis.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/ne-dwrite_3-dwrite_font_axis_attributes
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class DWRITE_FONT_AXIS_ATTRIBUTES extends Win32BitflagEnum{

    /**
     * Specifies no attributes.
     * @type {Integer (Int32)}
     */
    static DWRITE_FONT_AXIS_ATTRIBUTES_NONE => 0

    /**
     * Specifies that this axis is implemented as a variation axis in a variable font, with a continuous range of values, such as a range of weights from 100..900. Otherwise, it is either a static axis that holds a single point, or it has a range but doesn't vary, such as optical size in the Skia Heading font (which covers a range of points but doesn't interpolate any new glyph outlines).
     * @type {Integer (Int32)}
     */
    static DWRITE_FONT_AXIS_ATTRIBUTES_VARIABLE => 1

    /**
     * Specifies that this axis is recommended to be remain hidden in user interfaces. The font developer may recommend this if an axis is intended to be accessed only programmatically, or is meant for font-internal or font-developer use only. The axis may be exposed in lower-level font inspection utilities, but should not be exposed in common nor even advanced-mode user interfaces in content-authoring apps.
     * @type {Integer (Int32)}
     */
    static DWRITE_FONT_AXIS_ATTRIBUTES_HIDDEN => 2
}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DWRITE_FONT_AXIS_TAG.ahk" { DWRITE_FONT_AXIS_TAG }

/**
 * Represents the minimum and maximum range of the possible values for a font axis.
 * @remarks
 * The meaning and range of axis values depends on the semantics of the particular axis. Certain well-known axes have standard ranges and defaults. Here are some examples.
 * 
 * - Weight (1..1000, default == 400)
 * - Width (>0, default == 100)
 * - Slant (-90..90, default == -20)
 * - Italic (0 or 1)
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/ns-dwrite_3-dwrite_font_axis_range
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct DWRITE_FONT_AXIS_RANGE {
    #StructPack 4

    /**
     * Type: **[DWRITE_FONT_AXIS_TAG](./ne-dwrite_3-dwrite_font_axis_tag.md)**
     * 
     * The four-character identifier of the font axis (for example, weight, width, slant, italic, and so on).
     */
    axisTag : DWRITE_FONT_AXIS_TAG

    /**
     * Type: **[FLOAT](/windows/win32/winprog/windows-data-types)**
     * 
     * The minimum value supported by this axis.
     */
    minValue : Float32

    /**
     * Type: **[FLOAT](/windows/win32/winprog/windows-data-types)**
     * 
     * The maximum value supported by this axis.
     */
    maxValue : Float32

}

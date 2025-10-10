#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents the minimum and maximum range of the possible values for a font axis.
 * @remarks
 * 
  * The meaning and range of axis values depends on the semantics of the particular axis. Certain well-known axes have standard ranges and defaults. Here are some examples.
  * 
  * - Weight (1..1000, default == 400)
  * - Width (>0, default == 100)
  * - Slant (-90..90, default == -20)
  * - Italic (0 or 1)
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/ns-dwrite_3-dwrite_font_axis_range
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class DWRITE_FONT_AXIS_RANGE extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * Type: **[DWRITE_FONT_AXIS_TAG](./ne-dwrite_3-dwrite_font_axis_tag.md)**
     * 
     * The four-character identifier of the font axis (for example, weight, width, slant, italic, and so on).
     * @type {Integer}
     */
    axisTag {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: **[FLOAT](/windows/win32/winprog/windows-data-types)**
     * 
     * The minimum value supported by this axis.
     * @type {Float}
     */
    minValue {
        get => NumGet(this, 4, "float")
        set => NumPut("float", value, this, 4)
    }

    /**
     * Type: **[FLOAT](/windows/win32/winprog/windows-data-types)**
     * 
     * The maximum value supported by this axis.
     * @type {Float}
     */
    maxValue {
        get => NumGet(this, 8, "float")
        set => NumPut("float", value, this, 8)
    }
}

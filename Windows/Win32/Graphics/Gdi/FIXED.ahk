#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The FIXED structure contains the integral and fractional parts of a fixed-point real number.
 * @remarks
 * 
  * The <b>FIXED</b> structure is used to describe the elements of the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-mat2">MAT2</a> structure.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wingdi/ns-wingdi-fixed
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class FIXED extends Win32Struct
{
    static sizeof => 4

    static packingSize => 2

    /**
     * The fractional part of the number.
     * @type {Integer}
     */
    fract {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * The integer part of the number.
     * @type {Integer}
     */
    value {
        get => NumGet(this, 2, "short")
        set => NumPut("short", value, this, 2)
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The FONTSIM structure contains offsets to one or more FONTDIFF structures describing bold, italic, and bold italic font simulations.
 * @remarks
 * 
  * If the <b>dpFontSim</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-ifimetrics">IFIMETRICS</a> structure is nonzero, it holds the offset from the beginning of that structure to the beginning of a FONTSIM structure.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winddi/ns-winddi-fontsim
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class FONTSIM extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * If nonzero, specifies the offset from the beginning of this structure to the FONTDIFF structure describing the bold simulation. If this member is zero, the font does not support bold simulation.
     * @type {Integer}
     */
    dpBold {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * If nonzero, specifies the offset from the beginning of this structure to the FONTDIFF structure describing the italic simulation. If this member is zero, the font does not support italic simulation.
     * @type {Integer}
     */
    dpItalic {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * If nonzero, specifies the offset from the beginning of this structure to the FONTDIFF structure describing the bold italic simulation. If this member is zero, the font does not support bold italic simulation.
     * @type {Integer}
     */
    dpBoldItalic {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }
}

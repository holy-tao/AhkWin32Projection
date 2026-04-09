#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\PALETTEENTRY.ahk

/**
 * The LOGPALETTE structure defines a logical palette.
 * @remarks
 * The colors in the palette-entry table should appear in order of importance because entries earlier in the logical palette are most likely to be placed in the system palette.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-logpalette
 * @namespace Windows.Win32.Graphics.Gdi
 */
class LOGPALETTE extends Win32Struct {
    static sizeof => 8

    static packingSize => 2

    /**
     * The version number of the system.
     * @type {Integer}
     */
    palVersion {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * The number of entries in the logical palette.
     * @type {Integer}
     */
    palNumEntries {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * Specifies an array of <a href="https://docs.microsoft.com/previous-versions/dd162769(v=vs.85)">PALETTEENTRY</a> structures that define the color and usage of each entry in the logical palette.
     * @type {PALETTEENTRY}
     */
    palPalEntry {
        get {
            if(!this.HasProp("__palPalEntryProxyArray"))
                this.__palPalEntryProxyArray := Win32FixedArray(this.ptr + 4, 1, PALETTEENTRY, "")
            return this.__palPalEntryProxyArray
        }
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The ColorPalette structure defines an array of colors that make up a color palette. The colors are 32-bit ARGB colors.
 * @see https://docs.microsoft.com/windows/win32/api//gdipluspixelformats/ns-gdipluspixelformats-colorpalette
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class ColorPalette extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * Type: <b>UINT</b>
     * 
     * Combination of flags from the <a href="https://docs.microsoft.com/windows/desktop/api/gdipluspixelformats/ne-gdipluspixelformats-paletteflags">PaletteFlags</a> enumeration.
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>UINT</b>
     * 
     * Number of elements in the <b>Entries</b> array.
     * @type {Integer}
     */
    Count {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>ARGB[1]</b>
     * 
     * Array of ARGB colors.
     * @type {Array<UInt32>}
     */
    Entries{
        get {
            if(!this.HasProp("__EntriesProxyArray"))
                this.__EntriesProxyArray := Win32FixedArray(this.ptr + 8, 1, Primitive, "uint")
            return this.__EntriesProxyArray
        }
    }
}

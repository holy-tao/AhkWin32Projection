#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\EMR.ahk

/**
 * The EMRRESIZEPALETTE structure contains members for the ResizePalette enhanced metafile record.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-emrresizepalette
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class EMRRESIZEPALETTE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The base structure for all record types.
     * @type {EMR}
     */
    emr{
        get {
            if(!this.HasProp("__emr"))
                this.__emr := EMR(this.ptr + 0)
            return this.__emr
        }
    }

    /**
     * Index of the palette in the handle table.
     * @type {Integer}
     */
    ihPal {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Number of entries in palette after resizing.
     * @type {Integer}
     */
    cEntries {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\EMR.ahk
#Include .\PALETTEENTRY.ahk
#Include .\LOGPALETTE.ahk

/**
 * The EMRCREATEPALETTE structure contains members for the CreatePalette enhanced metafile record.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-emrcreatepalette
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class EMRCREATEPALETTE extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The base structure for all record types.
     * @type {EMR}
     */
    emr{
        get {
            if(!this.HasProp("__emr"))
                this.__emr := EMR(0, this)
            return this.__emr
        }
    }

    /**
     * Index of palette in handle table.
     * @type {Integer}
     */
    ihPal {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-logpalette">LOGPALETTE</a> structure that contains information about the palette. Note that <b>peFlags</b> members in the <a href="https://docs.microsoft.com/previous-versions/dd162769(v=vs.85)">PALETTEENTRY</a> structures do not contain any flags.
     * @type {LOGPALETTE}
     */
    lgpl{
        get {
            if(!this.HasProp("__lgpl"))
                this.__lgpl := LOGPALETTE(16, this)
            return this.__lgpl
        }
    }
}

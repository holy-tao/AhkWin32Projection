#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\EMR.ahk

/**
 * The EMREOF structure contains data for the enhanced metafile record that indicates the end of the metafile.
 * @see https://docs.microsoft.com/windows/win32/api//wingdi/ns-wingdi-emreof
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class EMREOF extends Win32Struct
{
    static sizeof => 24

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
     * The number of palette entries.
     * @type {Integer}
     */
    nPalEntries {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The offset, in bytes, to an array of <a href="https://docs.microsoft.com/previous-versions/dd162769(v=vs.85)">PALETTEENTRY</a> structures.
     * @type {Integer}
     */
    offPalEntries {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The same size as the <b>nSize</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emr">EMR</a> structure. This member must be the last double word of the record. If palette entries exist, they precede this member.
     * @type {Integer}
     */
    nSizeLast {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\EMR.ahk
#Include .\PALETTEENTRY.ahk

/**
 * The EMRSETPALETTEENTRIES structure contains members for the SetPaletteEntries enhanced metafile record.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-emrsetpaletteentries
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class EMRSETPALETTEENTRIES extends Win32Struct
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
                this.__emr := EMR(this.ptr + 0)
            return this.__emr
        }
    }

    /**
     * Palette handle index.
     * @type {Integer}
     */
    ihPal {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Index of first entry to set.
     * @type {Integer}
     */
    iStart {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Number of entries.
     * @type {Integer}
     */
    cEntries {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Array of <a href="https://docs.microsoft.com/previous-versions/dd162769(v=vs.85)">PALETTEENTRY</a> structures. Note that <b>peFlags</b> members in the structures do not contain any flags.
     * @type {Array<PALETTEENTRY>}
     */
    aPalEntries{
        get {
            if(!this.HasProp("__aPalEntriesProxyArray"))
                this.__aPalEntriesProxyArray := Win32FixedArray(this.ptr + 24, 8, PALETTEENTRY, "")
            return this.__aPalEntriesProxyArray
        }
    }
}

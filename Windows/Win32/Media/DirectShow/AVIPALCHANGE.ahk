#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Graphics\Gdi\PALETTEENTRY.ahk

/**
 * The AVIPALCHANGE structure defines a palette change in an AVI file.
 * @see https://learn.microsoft.com/windows/win32/api/avifmt/ns-avifmt-avipalchange
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class AVIPALCHANGE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Specifies the index of the first palette entry to change.
     * @type {Integer}
     */
    bFirstEntry {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * Specifies the number of palette entries to change, or zero to change all 256 palette entries.
     * @type {Integer}
     */
    bNumEntries {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * Reserved.
     * @type {Integer}
     */
    wFlags {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * Specifies an array of <a href="https://docs.microsoft.com/previous-versions/dd162769(v=vs.85)">PALETTEENTRY</a> structures, of size <b>bNumEntries</b>.
     * @type {Array<PALETTEENTRY>}
     */
    peNew{
        get {
            if(!this.HasProp("__peNewProxyArray"))
                this.__peNewProxyArray := Win32FixedArray(this.ptr + 8, 1, PALETTEENTRY, "")
            return this.__peNewProxyArray
        }
    }
}

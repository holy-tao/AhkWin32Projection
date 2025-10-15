#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\EMR.ahk
#Include ..\..\Foundation\POINTL.ahk
#Include ..\..\Foundation\COLORREF.ahk

/**
 * The EMREXTFLOODFILL structure contains members for the ExtFloodFill enhanced metafile record.
 * @see https://docs.microsoft.com/windows/win32/api//wingdi/ns-wingdi-emrextfloodfill
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class EMREXTFLOODFILL extends Win32Struct
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
                this.__emr := EMR(this.ptr + 0)
            return this.__emr
        }
    }

    /**
     * Coordinates, in logical units, where filling begins.
     * @type {POINTL}
     */
    ptlStart{
        get {
            if(!this.HasProp("__ptlStart"))
                this.__ptlStart := POINTL(this.ptr + 8)
            return this.__ptlStart
        }
    }

    /**
     * Color of fill. To make a <a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a> value, use the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-rgb">RGB</a> macro.
     * @type {COLORREF}
     */
    crColor{
        get {
            if(!this.HasProp("__crColor"))
                this.__crColor := COLORREF(this.ptr + 16)
            return this.__crColor
        }
    }

    /**
     * Type of fill operation to be performed. This member must be either the FLOODFILLBORDER or FLOODFILLSURFACE value.
     * @type {Integer}
     */
    iMode {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\EMR.ahk
#Include ..\..\Foundation\POINTL.ahk

/**
 * The EMRLINETO and EMRMOVETOEX structures contains members for the LineTo and MoveToEx enhanced metafile records.
 * @see https://docs.microsoft.com/windows/win32/api//wingdi/ns-wingdi-emrlineto
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class EMRLINETO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Base structure for all record types.
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
     * Coordinates of the line's ending point for the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-lineto">LineTo</a> function or coordinates of the new current position for the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-movetoex">MoveToEx</a> function in logical units.
     * @type {POINTL}
     */
    ptl{
        get {
            if(!this.HasProp("__ptl"))
                this.__ptl := POINTL(8, this)
            return this.__ptl
        }
    }
}

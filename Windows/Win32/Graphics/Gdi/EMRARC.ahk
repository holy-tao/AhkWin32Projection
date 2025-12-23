#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\EMR.ahk
#Include ..\..\Foundation\RECTL.ahk
#Include ..\..\Foundation\POINTL.ahk

/**
 * The EMRARC, EMRARCTO, EMRCHORD, and EMRPIE structures contain members for the Arc, ArcTo, Chord, and Pie enhanced metafile records.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-emrarc
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class EMRARC extends Win32Struct
{
    static sizeof => 40

    static packingSize => 4

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
     * Bounding rectangle in logical units.
     * @type {RECTL}
     */
    rclBox{
        get {
            if(!this.HasProp("__rclBox"))
                this.__rclBox := RECTL(8, this)
            return this.__rclBox
        }
    }

    /**
     * Coordinates of first radial ending point in logical units.
     * @type {POINTL}
     */
    ptlStart{
        get {
            if(!this.HasProp("__ptlStart"))
                this.__ptlStart := POINTL(24, this)
            return this.__ptlStart
        }
    }

    /**
     * Coordinates of second radial ending point in logical units.
     * @type {POINTL}
     */
    ptlEnd{
        get {
            if(!this.HasProp("__ptlEnd"))
                this.__ptlEnd := POINTL(32, this)
            return this.__ptlEnd
        }
    }
}

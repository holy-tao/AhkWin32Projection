#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\EMR.ahk
#Include ..\..\Foundation\POINTL.ahk

/**
 * The EMRANGLEARC structure contains members for the AngleArc enhanced metafile record.
 * @see https://docs.microsoft.com/windows/win32/api//wingdi/ns-wingdi-emranglearc
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class EMRANGLEARC extends Win32Struct
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
     * Logical coordinates of a circle's center.
     * @type {POINTL}
     */
    ptlCenter{
        get {
            if(!this.HasProp("__ptlCenter"))
                this.__ptlCenter := POINTL(8, this)
            return this.__ptlCenter
        }
    }

    /**
     * A circle's radius, in logical units.
     * @type {Integer}
     */
    nRadius {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * An arc's start angle, in degrees.
     * @type {Float}
     */
    eStartAngle {
        get => NumGet(this, 20, "float")
        set => NumPut("float", value, this, 20)
    }

    /**
     * An arc's sweep angle, in degrees.
     * @type {Float}
     */
    eSweepAngle {
        get => NumGet(this, 24, "float")
        set => NumPut("float", value, this, 24)
    }
}

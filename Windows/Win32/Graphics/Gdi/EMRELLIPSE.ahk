#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\EMR.ahk
#Include ..\..\Foundation\RECTL.ahk

/**
 * The EMRELLIPSE and EMRRECTANGLE structures contain members for the Ellipse and Rectangle enhanced metafile records.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-emrellipse
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class EMRELLIPSE extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Base structure for all record types.
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
     * Bounding rectangle in logical units.
     * @type {RECTL}
     */
    rclBox{
        get {
            if(!this.HasProp("__rclBox"))
                this.__rclBox := RECTL(this.ptr + 8)
            return this.__rclBox
        }
    }
}

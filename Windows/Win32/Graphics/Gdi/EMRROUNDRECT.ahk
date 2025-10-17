#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\EMR.ahk
#Include ..\..\Foundation\RECTL.ahk
#Include ..\..\Foundation\SIZE.ahk

/**
 * The EMRROUNDRECT structure contains members for the RoundRect enhanced metafile record.
 * @see https://docs.microsoft.com/windows/win32/api//wingdi/ns-wingdi-emrroundrect
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class EMRROUNDRECT extends Win32Struct
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
     * Bounding rectangle, in logical units.
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
     * Width and height, in logical units, of the ellipse used to draw rounded corners.
     * @type {SIZE}
     */
    szlCorner{
        get {
            if(!this.HasProp("__szlCorner"))
                this.__szlCorner := SIZE(24, this)
            return this.__szlCorner
        }
    }
}

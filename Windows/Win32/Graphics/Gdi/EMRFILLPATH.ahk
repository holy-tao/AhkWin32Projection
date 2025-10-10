#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\EMR.ahk
#Include ..\..\Foundation\RECTL.ahk

/**
 * The EMRFILLPATH,�EMRSTROKEANDFILLPATH,� and EMRSTROKEPATH structures contain members for the FillPath, StrokeAndFillPath, and StrokePath enhanced metafile records.
 * @see https://docs.microsoft.com/windows/win32/api//wingdi/ns-wingdi-emrfillpath
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class EMRFILLPATH extends Win32Struct
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
     * Bounding rectangle, in device units.
     * @type {RECTL}
     */
    rclBounds{
        get {
            if(!this.HasProp("__rclBounds"))
                this.__rclBounds := RECTL(this.ptr + 8)
            return this.__rclBounds
        }
    }
}

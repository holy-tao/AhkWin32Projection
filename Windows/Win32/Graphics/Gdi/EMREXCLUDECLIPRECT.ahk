#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\EMR.ahk
#Include ..\..\Foundation\RECTL.ahk

/**
 * The EMREXCLUDECLIPRECT and EMRINTERSECTCLIPRECT structures contain members for the ExcludeClipRect and IntersectClipRect enhanced metafile records.
 * @see https://docs.microsoft.com/windows/win32/api//wingdi/ns-wingdi-emrexcludecliprect
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class EMREXCLUDECLIPRECT extends Win32Struct
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
     * Clipping rectangle in logical units.
     * @type {RECTL}
     */
    rclClip{
        get {
            if(!this.HasProp("__rclClip"))
                this.__rclClip := RECTL(this.ptr + 8)
            return this.__rclClip
        }
    }
}

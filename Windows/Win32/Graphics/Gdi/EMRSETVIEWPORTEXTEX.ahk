#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\EMR.ahk
#Include ..\..\Foundation\SIZE.ahk

/**
 * The EMRSETVIEWPORTEXTEX and EMRSETWINDOWEXTEX structures contains members for the SetViewportExtEx and SetWindowExtEx enhanced metafile records.
 * @see https://docs.microsoft.com/windows/win32/api//wingdi/ns-wingdi-emrsetviewportextex
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class EMRSETVIEWPORTEXTEX extends Win32Struct
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
     * Horizontal and vertical extents. For <b>SetViewportExtEx</b>, the extents are in device units, and for <b>SetWindowExtEx</b>, the extents are in logical units.
     * @type {SIZE}
     */
    szlExtent{
        get {
            if(!this.HasProp("__szlExtent"))
                this.__szlExtent := SIZE(8, this)
            return this.__szlExtent
        }
    }
}

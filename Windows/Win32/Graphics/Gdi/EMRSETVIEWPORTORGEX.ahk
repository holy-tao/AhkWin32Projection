#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\EMR.ahk
#Include ..\..\Foundation\POINTL.ahk

/**
 * The EMRSETVIEWPORTORGEX, EMRSETWINDOWORGEX, and EMRSETBRUSHORGEX structures contain members for the SetViewportOrgEx, SetWindowOrgEx, and SetBrushOrgEx enhanced metafile records.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-emrsetviewportorgex
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class EMRSETVIEWPORTORGEX extends Win32Struct
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
                this.__emr := EMR(this.ptr + 0)
            return this.__emr
        }
    }

    /**
     * Coordinates of the origin. For <b>EMRSETVIEWPORTORGEX</b> and <b>EMRSETBRUSHORGEX</b>, this is in device units. For <b>EMRSETWINDOWORGEX</b>, this is in logical units.
     * @type {POINTL}
     */
    ptlOrigin{
        get {
            if(!this.HasProp("__ptlOrigin"))
                this.__ptlOrigin := POINTL(this.ptr + 8)
            return this.__ptlOrigin
        }
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\EMR.ahk
#Include ..\..\Foundation\POINTL.ahk

/**
 * The EMROFFSETCLIPRGN structure contains members for the OffsetClipRgn enhanced metafile record.
 * @see https://docs.microsoft.com/windows/win32/api//wingdi/ns-wingdi-emroffsetcliprgn
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class EMROFFSETCLIPRGN extends Win32Struct
{
    static sizeof => 16

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
     * The logical coordinates of offset.
     * @type {POINTL}
     */
    ptlOffset{
        get {
            if(!this.HasProp("__ptlOffset"))
                this.__ptlOffset := POINTL(8, this)
            return this.__ptlOffset
        }
    }
}

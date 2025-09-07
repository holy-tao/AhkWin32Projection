#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\EMR.ahk
#Include .\XFORM.ahk

/**
 * The EMRSETWORLDTRANSFORM structure contains members for the SetWorldTransform enhanced metafile record.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-emrsetworldtransform
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class EMRSETWORLDTRANSFORM extends Win32Struct
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
                this.__emr := EMR(this.ptr + 0)
            return this.__emr
        }
    }

    /**
     * World-space to page-space transformation data.
     * @type {XFORM}
     */
    xform{
        get {
            if(!this.HasProp("__xform"))
                this.__xform := XFORM(this.ptr + 8)
            return this.__xform
        }
    }
}

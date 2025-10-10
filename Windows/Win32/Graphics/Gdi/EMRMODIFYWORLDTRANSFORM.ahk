#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\EMR.ahk
#Include .\XFORM.ahk

/**
 * The EMRMODIFYWORLDTRANSFORM structure contains members for the ModifyWorldTransform enhanced metafile record.
 * @see https://docs.microsoft.com/windows/win32/api//wingdi/ns-wingdi-emrmodifyworldtransform
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class EMRMODIFYWORLDTRANSFORM extends Win32Struct
{
    static sizeof => 40

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
     * The world-space to page-space transform data.
     * @type {XFORM}
     */
    xform{
        get {
            if(!this.HasProp("__xform"))
                this.__xform := XFORM(this.ptr + 8)
            return this.__xform
        }
    }

    /**
     * 
     * @type {Integer}
     */
    iMode {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }
}

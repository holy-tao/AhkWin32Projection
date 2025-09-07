#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\EMR.ahk

/**
 * The EMRSETCOLORSPACE, EMRSELECTCOLORSPACE, and EMRDELETECOLORSPACE structures contain members for the SetColorSpace and DeleteColorSpace enhanced metafile records.
 * @remarks
 * There is no function that generates an enhanced metafile record with the <b>EMRSELECTCOLORSPACE</b> structure.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-emrsetcolorspace
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class EMRSETCOLORSPACE extends Win32Struct
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
     * Color space handle index.
     * @type {Integer}
     */
    ihCS {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}

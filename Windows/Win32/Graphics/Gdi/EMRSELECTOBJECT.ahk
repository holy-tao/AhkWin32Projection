#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\EMR.ahk

/**
 * The EMRSELECTOBJECT and EMRDELETEOBJECT structures contain members for the SelectObject and DeleteObject enhanced metafile records.
 * @see https://docs.microsoft.com/windows/win32/api//wingdi/ns-wingdi-emrselectobject
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class EMRSELECTOBJECT extends Win32Struct
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
     * The index of an object in the handle table.
     * @type {Integer}
     */
    ihObject {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}

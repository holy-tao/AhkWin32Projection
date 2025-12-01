#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\EMR.ahk

/**
 * The EMRSETARCDIRECTION structure contains members for the SetArcDirection enhanced metafile record.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-emrsetarcdirection
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class EMRSETARCDIRECTION extends Win32Struct
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
     * Arc direction. This member can be either the AD_CLOCKWISE or AD_COUNTERCLOCKWISE value.
     * @type {Integer}
     */
    iArcDirection {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}

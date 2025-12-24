#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\EMR.ahk

/**
 * The EMRRESTOREDC structure contains members for the RestoreDC enhanced metafile record.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-emrrestoredc
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class EMRRESTOREDC extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

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
     * Relative instance to restore.
     * @type {Integer}
     */
    iRelative {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }
}

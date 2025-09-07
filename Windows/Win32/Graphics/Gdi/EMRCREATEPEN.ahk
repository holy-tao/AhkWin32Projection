#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\EMR.ahk
#Include ..\..\Foundation\POINT.ahk
#Include .\LOGPEN.ahk

/**
 * The EMRCREATEPEN structure contains members for the CreatePen enhanced metafile record.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-emrcreatepen
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class EMRCREATEPEN extends Win32Struct
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
     * Index to pen in handle table.
     * @type {Integer}
     */
    ihPen {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Logical pen.
     * @type {LOGPEN}
     */
    lopn{
        get {
            if(!this.HasProp("__lopn"))
                this.__lopn := LOGPEN(this.ptr + 16)
            return this.__lopn
        }
    }
}

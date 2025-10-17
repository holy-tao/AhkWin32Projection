#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Graphics\Gdi\EMR.ahk
#Include ..\..\Graphics\Gdi\CIEXYZ.ahk
#Include ..\..\Graphics\Gdi\CIEXYZTRIPLE.ahk
#Include .\LOGCOLORSPACEA.ahk

/**
 * The EMRCREATECOLORSPACE structure contains members for the CreateColorSpace enhanced metafile record.
 * @see https://docs.microsoft.com/windows/win32/api//wingdi/ns-wingdi-emrcreatecolorspace
 * @namespace Windows.Win32.UI.ColorSystem
 * @version v4.0.30319
 * @charset ANSI
 */
class EMRCREATECOLORSPACE extends Win32Struct
{
    static sizeof => 360

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
     * The index of the color space in handle table.
     * @type {Integer}
     */
    ihCS {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The logical color space.
     * @type {LOGCOLORSPACEA}
     */
    lcs{
        get {
            if(!this.HasProp("__lcs"))
                this.__lcs := LOGCOLORSPACEA(16, this)
            return this.__lcs
        }
    }
}

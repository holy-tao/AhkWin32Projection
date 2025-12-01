#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Graphics\Gdi\EMR.ahk
#Include ..\..\Graphics\Gdi\CIEXYZ.ahk
#Include ..\..\Graphics\Gdi\CIEXYZTRIPLE.ahk
#Include .\LOGCOLORSPACEW.ahk

/**
 * The EMRCREATECOLORSPACEW structure contains members for the CreateColorSpace enhanced metafile record. It differs from EMRCREATECOLORSPACE in that it has a Unicode logical color space and also has an optional array containing raw source profile data.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-emrcreatecolorspacew
 * @namespace Windows.Win32.UI.ColorSystem
 * @version v4.0.30319
 * @charset Unicode
 */
class EMRCREATECOLORSPACEW extends Win32Struct
{
    static sizeof => 640

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
     * Index of the color space in handle table.
     * @type {Integer}
     */
    ihCS {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Logical color space. Note, this is the Unicode version of the structure.
     * @type {LOGCOLORSPACEW}
     */
    lcs{
        get {
            if(!this.HasProp("__lcs"))
                this.__lcs := LOGCOLORSPACEW(16, this)
            return this.__lcs
        }
    }

    /**
     * Can be the following.
     * 
     * <table>
     * <tr>
     * <th>Flag</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>CREATECOLORSPACE_EMBEDED</td>
     * <td>Indicates that a color space is embedded in the metafile.</td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 624, "uint")
        set => NumPut("uint", value, this, 624)
    }

    /**
     * Size of the raw source profile data in bytes, if it is attached.
     * @type {Integer}
     */
    cbData {
        get => NumGet(this, 628, "uint")
        set => NumPut("uint", value, this, 628)
    }

    /**
     * An array containing the source profile data. The size of the array is <b>cbData</b>.
     * @type {Array<Byte>}
     */
    Data{
        get {
            if(!this.HasProp("__DataProxyArray"))
                this.__DataProxyArray := Win32FixedArray(this.ptr + 632, 1, Primitive, "char")
            return this.__DataProxyArray
        }
    }
}

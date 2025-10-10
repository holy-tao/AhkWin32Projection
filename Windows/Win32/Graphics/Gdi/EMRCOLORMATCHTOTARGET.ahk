#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\EMR.ahk

/**
 * The EMRCOLORMATCHTOTARGET structure contains members for the ColorMatchToTarget enhanced metafile record.
 * @see https://docs.microsoft.com/windows/win32/api//wingdi/ns-wingdi-emrcolormatchtotarget
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class EMRCOLORMATCHTOTARGET extends Win32Struct
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
     * 
     * @type {Integer}
     */
    dwAction {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * This parameter can be the following value.
     * 
     * <table>
     * <tr>
     * <th>Flag</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>COLORMATCHTOTARGET_EMBEDED</td>
     * <td>Indicates that a color profile has been embedded in the metafile.</td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The size of the desired target profile name, in bytes.
     * @type {Integer}
     */
    cbName {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The size of the raw target profile data in bytes, if it is attached.
     * @type {Integer}
     */
    cbData {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * An array containing the target profile name and the raw target profile data. 
     * 			 The size of the array is <b>cbName</b> + <b>cbData</b>. 
     * 			 If <b>cbData</b> is nonzero the raw target profile data is attached and follows the target profile name at location <b>Data</b>[<b>cbName</b>].
     * @type {Array<Byte>}
     */
    Data{
        get {
            if(!this.HasProp("__DataProxyArray"))
                this.__DataProxyArray := Win32FixedArray(this.ptr + 24, 1, Primitive, "char")
            return this.__DataProxyArray
        }
    }
}

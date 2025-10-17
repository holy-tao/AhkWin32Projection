#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\EMR.ahk

/**
 * The EMRSETICMPROFILE structure contains members for the SetICMProfile enhanced metafile record.
 * @remarks
 * 
  * This structure is to be used during metafile playback.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wingdi/ns-wingdi-emrseticmprofile
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class EMRSETICMPROFILE extends Win32Struct
{
    static sizeof => 24

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
     * The profile flags. This member can be SETICMPROFILE_EMBEDED (0x00000001).
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The size of the desired profile name.
     * @type {Integer}
     */
    cbName {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The size of profile data, if attached.
     * @type {Integer}
     */
    cbData {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * An array that contains the profile data. The length of this array is <b>cbName</b> plus <b>cbData</b>.
     * @type {Array<Byte>}
     */
    Data{
        get {
            if(!this.HasProp("__DataProxyArray"))
                this.__DataProxyArray := Win32FixedArray(this.ptr + 20, 1, Primitive, "char")
            return this.__DataProxyArray
        }
    }
}

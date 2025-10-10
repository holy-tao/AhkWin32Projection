#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies the DVD title key from the current content.
 * @remarks
 * 
  * The AM_PROPERTY_DVDCOPY_TITLE_KEY property uses this structure.
  * 
  * A title key is used for the DVD CSS key exchange for decryption. Implementors should get a CSS license and further instructions from CSS.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//dvdmedia/ns-dvdmedia-am_dvdcopy_titlekey
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class AM_DVDCOPY_TITLEKEY extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * Key flags.
     * @type {Integer}
     */
    KeyFlags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<UInt32>}
     */
    Reserved1{
        get {
            if(!this.HasProp("__Reserved1ProxyArray"))
                this.__Reserved1ProxyArray := Win32FixedArray(this.ptr + 4, 2, Primitive, "uint")
            return this.__Reserved1ProxyArray
        }
    }

    /**
     * Title key.
     * @type {Array<Byte>}
     */
    TitleKey{
        get {
            if(!this.HasProp("__TitleKeyProxyArray"))
                this.__TitleKeyProxyArray := Win32FixedArray(this.ptr + 12, 6, Primitive, "char")
            return this.__TitleKeyProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved2{
        get {
            if(!this.HasProp("__Reserved2ProxyArray"))
                this.__Reserved2ProxyArray := Win32FixedArray(this.ptr + 18, 2, Primitive, "char")
            return this.__Reserved2ProxyArray
        }
    }
}

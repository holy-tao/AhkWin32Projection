#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Identifies the DVD challenge key.
 * @remarks
 * 
  * The AM_PROPERTY_DVDCOPY_CHLG_KEY property uses this structure.
  * 
  * A challenge key is used for the DVD CSS key exchange for decryption. Implementors should get a CSS license and further instructions from CSS.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//dvdmedia/ns-dvdmedia-am_dvdcopy_chlgkey
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class AM_DVDCOPY_CHLGKEY extends Win32Struct
{
    static sizeof => 12

    static packingSize => 1

    /**
     * Challenge key.
     * @type {Array<Byte>}
     */
    ChlgKey{
        get {
            if(!this.HasProp("__ChlgKeyProxyArray"))
                this.__ChlgKeyProxyArray := Win32FixedArray(this.ptr + 0, 10, Primitive, "char")
            return this.__ChlgKeyProxyArray
        }
    }

    /**
     * Reserved.
     * @type {Array<Byte>}
     */
    Reserved{
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 10, 2, Primitive, "char")
            return this.__ReservedProxyArray
        }
    }
}

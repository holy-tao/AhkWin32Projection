#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Identifies the DVD bus key.
 * @remarks
 * 
 * The AM_PROPERTY_DVDCOPY_DVD_KEY1 and AM_PROPERTY_DVDCOPY_DEC_KEY2 properties use this structure.
 * 
 * A bus key is used for the DVD CSS key exchange for decryption. Implementors should get a CSS license and further instructions from CSS.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//dvdmedia/ns-dvdmedia-am_dvdcopy_buskey
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class AM_DVDCOPY_BUSKEY extends Win32Struct
{
    static sizeof => 6

    static packingSize => 1

    /**
     * DVD drive bus key.
     * @type {Array<Byte>}
     */
    BusKey{
        get {
            if(!this.HasProp("__BusKeyProxyArray"))
                this.__BusKeyProxyArray := Win32FixedArray(this.ptr + 0, 5, Primitive, "char")
            return this.__BusKeyProxyArray
        }
    }

    /**
     * Reserved.
     * @type {Array<Byte>}
     */
    Reserved{
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 5, 1, Primitive, "char")
            return this.__ReservedProxyArray
        }
    }
}

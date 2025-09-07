#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies the DVD disc key.
 * @remarks
 * The AM_PROPERTY_DVDCOPY_DISC_KEY property uses this structure.
  * 
  * A disc key is used for the DVD CSS key exchange for decryption. Implementors should get a CSS license and further instructions from CSS.
 * @see https://learn.microsoft.com/windows/win32/api/dvdmedia/ns-dvdmedia-am_dvdcopy_disckey
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class AM_DVDCOPY_DISCKEY extends Win32Struct
{
    static sizeof => 2048

    static packingSize => 1

    /**
     * DVD disc key.
     * @type {Array<Byte>}
     */
    DiscKey{
        get {
            if(!this.HasProp("__DiscKeyProxyArray"))
                this.__DiscKeyProxyArray := Win32FixedArray(this.ptr + 0, 1, Primitive, "char")
            return this.__DiscKeyProxyArray
        }
    }
}

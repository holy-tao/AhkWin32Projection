#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Description of the HiFiCOLOR structure.
 * @remarks
 * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//icm/ns-icm-hificolor
 * @namespace Windows.Win32.UI.ColorSystem
 * @version v4.0.30319
 */
class HiFiCOLOR extends Win32Struct
{
    static sizeof => 8

    static packingSize => 1

    /**
     * TBD
     * @type {Array<Byte>}
     */
    channel{
        get {
            if(!this.HasProp("__channelProxyArray"))
                this.__channelProxyArray := Win32FixedArray(this.ptr + 0, 8, Primitive, "char")
            return this.__channelProxyArray
        }
    }
}

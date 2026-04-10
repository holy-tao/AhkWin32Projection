#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Description of the HiFiCOLOR structure.
 * @see https://learn.microsoft.com/windows/win32/api/icm/ns-icm-hificolor
 * @namespace Windows.Win32.UI.ColorSystem
 */
class HiFiCOLOR extends Win32Struct {
    static sizeof => 8

    static packingSize => 1

    /**
     * TBD
     * @type {Array<Integer>}
     */
    channel {
        get {
            if(!this.HasProp("__channelProxyArray"))
                this.__channelProxyArray := Win32FixedArray(this.ptr + 0, 8, Primitive, "char")
            return this.__channelProxyArray
        }
    }
}

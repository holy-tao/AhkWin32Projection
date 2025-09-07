#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class _URB_HCD_AREA extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * @type {Array<Void>}
     */
    Reserved8{
        get {
            if(!this.HasProp("__Reserved8ProxyArray"))
                this.__Reserved8ProxyArray := Win32FixedArray(this.ptr + 0, 8, Primitive, "ptr")
            return this.__Reserved8ProxyArray
        }
    }
}

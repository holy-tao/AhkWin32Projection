#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class USB4_HRD_DEBUG_ROUTE_STRING extends Win32Struct
{
    static sizeof => 8

    static packingSize => 1

    /**
     * @type {Integer}
     */
    Depth {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Array<Byte>}
     */
    Route{
        get {
            if(!this.HasProp("__RouteProxyArray"))
                this.__RouteProxyArray := Win32FixedArray(this.ptr + 1, 7, Primitive, "char")
            return this.__RouteProxyArray
        }
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Networking.HttpServer
 * @version v4.0.30319
 */
class HTTP_REQUEST_TIMING_INFO extends Win32Struct
{
    static sizeof => 248

    static packingSize => 8

    /**
     * @type {Integer}
     */
    RequestTimingCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<UInt64>}
     */
    RequestTiming{
        get {
            if(!this.HasProp("__RequestTimingProxyArray"))
                this.__RequestTimingProxyArray := Win32FixedArray(this.ptr + 8, 30, Primitive, "uint")
            return this.__RequestTimingProxyArray
        }
    }
}
